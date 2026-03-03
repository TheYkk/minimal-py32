#!/usr/bin/env python3
"""Firmware size analysis tool for ARM ELF binaries.

Parses the symbol table and section headers to show where flash and RAM
are being used, grouped by section, source file, and individual symbol.
"""

import subprocess
import sys
import os
import re
from collections import defaultdict
from pathlib import Path

ELF = "bin/firmware.elf"
PREFIX = "arm-none-eabi"

FLASH_ORIGIN = 0x08000000
FLASH_SIZE = 32 * 1024
RAM_ORIGIN = 0x20000000
RAM_SIZE = 4 * 1024

FLASH_SECTIONS = {".vectors", ".text", ".rodata", ".ARM.extab", ".ARM",
                  ".preinit_array", ".init_array", ".fini_array"}
RAM_SECTIONS = {".data", ".bss"}

LINKER_MARKERS = {"end", "_estack", "_ebss", "_sbss", "_sdata", "_edata",
                  "_etext", "_sidata", "__bss_start__", "__bss_end__",
                  "__TMC_END__", "__EH_FRAME_BEGIN__",
                  "__exidx_start", "__exidx_end",
                  "__preinit_array_start", "__preinit_array_end",
                  "__init_array_start", "__init_array_end",
                  "__init_array_end", "__frame_dummy_init_array_entry",
                  "__do_global_dtors_aux_fini_array_entry"}

BAR_WIDTH = 35
ROOT = os.getcwd()


def run(cmd):
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        print(f"Error running {' '.join(cmd)}:\n{r.stderr}", file=sys.stderr)
        sys.exit(1)
    return r.stdout


def bar(fraction):
    filled = max(0, min(BAR_WIDTH, int(BAR_WIDTH * fraction)))
    return "█" * filled + "░" * (BAR_WIDTH - filled)


def fmt_size(n):
    if n >= 1024:
        return f"{n:>6,} B ({n/1024:.1f}K)"
    return f"{n:>6,} B      "


def pct(used, total):
    return f"{100*used/total:5.1f}%" if total else " 0.0%"


def short_path(p):
    """Strip the project root to show relative paths."""
    if p.startswith(ROOT):
        return os.path.relpath(p, ROOT)
    return os.path.basename(p)


def parse_sections():
    out = run([f"{PREFIX}-size", "-A", ELF])
    sections = {}
    for line in out.splitlines():
        m = re.match(r"^(\.\S+)\s+(\d+)\s+(\d+)", line)
        if m:
            name, size, addr = m.group(1), int(m.group(2)), int(m.group(3))
            if size > 0:
                sections[name] = {"size": size, "addr": addr}
    return sections


def parse_symbols():
    """Get symbols with sizes and source files from nm --line-numbers."""
    out = run([f"{PREFIX}-nm", "--size-sort", "--print-size", "--radix=x",
               "--line-numbers", ELF])
    symbols = []
    for line in out.splitlines():
        m = re.match(r"^([0-9a-f]+)\s+([0-9a-f]+)\s+(\S)\s+(\S+?)(?:\t(.+))?$", line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        size = int(m.group(2), 16)
        stype = m.group(3)
        name = m.group(4)
        source_info = m.group(5)

        if size == 0 or name in LINKER_MARKERS:
            continue

        source = None
        if source_info:
            source = source_info.split(":")[0]

        symbols.append({
            "addr": addr, "size": size, "type": stype,
            "name": name, "source": source,
        })
    return symbols


def parse_objdump_files():
    """Fallback: parse objdump -t to get source file for symbols without debug info."""
    out = run([f"{PREFIX}-objdump", "-t", ELF])
    name_to_file = {}
    current_file = None

    for line in out.splitlines():
        m = re.match(r"^0+ l\s+df \*ABS\*\s+0+ (.+)", line)
        if m:
            f = m.group(1).strip()
            current_file = f if f else None
            continue

        if current_file:
            m = re.match(r"^[0-9a-f]+\s+[lwg!]\s+.*?\s+[0-9a-f]+\s+(\S+)", line)
            if m:
                sym_name = m.group(1)
                if sym_name not in name_to_file:
                    name_to_file[sym_name] = current_file

    return name_to_file


def addr_to_region(addr):
    if FLASH_ORIGIN <= addr < FLASH_ORIGIN + FLASH_SIZE:
        return "FLASH"
    if RAM_ORIGIN <= addr < RAM_ORIGIN + RAM_SIZE:
        return "RAM"
    return None


def print_header(title):
    w = 78
    print()
    print("═" * w)
    print(f"  {title}")
    print("═" * w)


def print_row(label, size, total, max_label=42):
    frac = size / total if total else 0
    label_t = label[:max_label]
    print(f"  {label_t:<{max_label}}  {fmt_size(size)}  {pct(size, total)}  {bar(frac)}")


def main():
    elf = Path(ELF)
    if not elf.exists():
        print(f"ELF not found: {ELF}  (run 'make' first)", file=sys.stderr)
        sys.exit(1)

    sections = parse_sections()
    symbols = parse_symbols()
    objdump_files = parse_objdump_files()

    for sym in symbols:
        if sym["source"] is None:
            fallback = objdump_files.get(sym["name"])
            if fallback:
                sym["source"] = fallback

    flash_used = sum(s["size"] for n, s in sections.items() if n in FLASH_SECTIONS)
    data_sz = sections.get(".data", {"size": 0})["size"]
    flash_used += data_sz

    ram_used = sum(s["size"] for n, s in sections.items() if n in RAM_SECTIONS)

    # ── Overview ──
    print_header("MEMORY OVERVIEW")
    print(f"  {'FLASH':<8} {bar(flash_used/FLASH_SIZE)}  {fmt_size(flash_used)} / {fmt_size(FLASH_SIZE)}  {pct(flash_used, FLASH_SIZE)}")
    print(f"  {'RAM':<8} {bar(ram_used/RAM_SIZE)}  {fmt_size(ram_used)} / {fmt_size(RAM_SIZE)}  {pct(ram_used, RAM_SIZE)}")

    # ── Section breakdown ──
    print_header("FLASH SECTIONS")
    flash_secs = [(n, s["size"]) for n, s in sections.items() if n in FLASH_SECTIONS and s["size"] > 0]
    flash_secs.append((".data (init values)", data_sz))
    flash_secs.sort(key=lambda x: x[1], reverse=True)
    for name, size in flash_secs:
        print_row(name, size, flash_used)

    print_header("RAM SECTIONS")
    ram_secs = [(n, s["size"]) for n, s in sections.items() if n in RAM_SECTIONS and s["size"] > 0]
    ram_secs.sort(key=lambda x: x[1], reverse=True)
    for name, size in ram_secs:
        print_row(name, size, ram_used)

    # ── Per-file breakdown ──
    file_flash = defaultdict(int)
    file_ram = defaultdict(int)

    for sym in symbols:
        region = addr_to_region(sym["addr"])
        source = sym["source"]
        if source:
            source = short_path(source)
        else:
            source = "<libc / runtime>"
        if region == "FLASH":
            file_flash[source] += sym["size"]
        elif region == "RAM":
            file_ram[source] += sym["size"]

    # Figure out what sections the unaccounted bytes live in
    section_accounted = defaultdict(int)
    for sym in symbols:
        region = addr_to_region(sym["addr"])
        if region == "FLASH":
            for sec_name, sec in sections.items():
                if sec_name in FLASH_SECTIONS and sec["addr"] <= sym["addr"] < sec["addr"] + sec["size"]:
                    section_accounted[sec_name] += sym["size"]
                    break

    print_header("FLASH BY SOURCE FILE")
    accounted_flash = sum(file_flash.values())
    for f, size in sorted(file_flash.items(), key=lambda x: x[1], reverse=True):
        print_row(f, size, flash_used)
    if accounted_flash < flash_used:
        unaccounted = flash_used - accounted_flash
        rodata_unnamed = sections.get(".rodata", {"size": 0})["size"] - section_accounted.get(".rodata", 0)
        text_unnamed = sections.get(".text", {"size": 0})["size"] - section_accounted.get(".text", 0)
        print(f"  {'─' * 74}")
        if rodata_unnamed > 0:
            print_row("<string literals / const tables>", rodata_unnamed, flash_used)
        if text_unnamed > 0:
            print_row("<unnamed .text / glue code>", text_unnamed, flash_used)
        other = unaccounted - max(0, rodata_unnamed) - max(0, text_unnamed)
        if other > 0:
            print_row("<alignment / padding>", other, flash_used)

    print_header("RAM BY SOURCE FILE")
    accounted_ram = sum(file_ram.values())
    for f, size in sorted(file_ram.items(), key=lambda x: x[1], reverse=True):
        print_row(f, size, ram_used)
    if accounted_ram < ram_used:
        print_row("<alignment / padding>", ram_used - accounted_ram, ram_used)

    # ── Top symbols ──
    flash_syms = [s for s in symbols if addr_to_region(s["addr"]) == "FLASH"]
    ram_syms = [s for s in symbols if addr_to_region(s["addr"]) == "RAM"]
    flash_syms.sort(key=lambda x: x["size"], reverse=True)
    ram_syms.sort(key=lambda x: x["size"], reverse=True)

    print_header("TOP 25 FLASH SYMBOLS")
    for s in flash_syms[:25]:
        src = short_path(s["source"]) if s["source"] else ""
        label = f"{s['name']}"
        if src:
            label += f"  ({src})"
        print_row(label, s["size"], flash_used)

    remaining = flash_syms[25:]
    if remaining:
        rest = sum(s["size"] for s in remaining)
        print_row(f"... {len(remaining)} more symbols", rest, flash_used)

    print_header("ALL RAM SYMBOLS")
    for s in ram_syms:
        src = short_path(s["source"]) if s["source"] else ""
        label = f"{s['name']}"
        if src:
            label += f"  ({src})"
        print_row(label, s["size"], ram_used)

    print()


if __name__ == "__main__":
    main()
