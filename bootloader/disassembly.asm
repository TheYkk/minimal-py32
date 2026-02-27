
/workspace/oauth-google-117553995698928995599/sessions/agent_c06977bf-ff4a-4630-8dda-f90f9dcd21f3/bootloader/build/py32f030_bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c0 <deregister_tm_clones>:
 80000c0:	4804      	ldr	r0, [pc, #16]	; (80000d4 <deregister_tm_clones+0x14>)
 80000c2:	4b05      	ldr	r3, [pc, #20]	; (80000d8 <deregister_tm_clones+0x18>)
 80000c4:	b510      	push	{r4, lr}
 80000c6:	4283      	cmp	r3, r0
 80000c8:	d003      	beq.n	80000d2 <deregister_tm_clones+0x12>
 80000ca:	4b04      	ldr	r3, [pc, #16]	; (80000dc <deregister_tm_clones+0x1c>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d000      	beq.n	80000d2 <deregister_tm_clones+0x12>
 80000d0:	4798      	blx	r3
 80000d2:	bd10      	pop	{r4, pc}
 80000d4:	20000008 	.word	0x20000008
 80000d8:	20000008 	.word	0x20000008
 80000dc:	00000000 	.word	0x00000000

080000e0 <register_tm_clones>:
 80000e0:	4806      	ldr	r0, [pc, #24]	; (80000fc <register_tm_clones+0x1c>)
 80000e2:	4907      	ldr	r1, [pc, #28]	; (8000100 <register_tm_clones+0x20>)
 80000e4:	1a09      	subs	r1, r1, r0
 80000e6:	108b      	asrs	r3, r1, #2
 80000e8:	0fc9      	lsrs	r1, r1, #31
 80000ea:	18c9      	adds	r1, r1, r3
 80000ec:	b510      	push	{r4, lr}
 80000ee:	1049      	asrs	r1, r1, #1
 80000f0:	d003      	beq.n	80000fa <register_tm_clones+0x1a>
 80000f2:	4b04      	ldr	r3, [pc, #16]	; (8000104 <register_tm_clones+0x24>)
 80000f4:	2b00      	cmp	r3, #0
 80000f6:	d000      	beq.n	80000fa <register_tm_clones+0x1a>
 80000f8:	4798      	blx	r3
 80000fa:	bd10      	pop	{r4, pc}
 80000fc:	20000008 	.word	0x20000008
 8000100:	20000008 	.word	0x20000008
 8000104:	00000000 	.word	0x00000000

08000108 <__do_global_dtors_aux>:
 8000108:	b510      	push	{r4, lr}
 800010a:	4c07      	ldr	r4, [pc, #28]	; (8000128 <__do_global_dtors_aux+0x20>)
 800010c:	7823      	ldrb	r3, [r4, #0]
 800010e:	2b00      	cmp	r3, #0
 8000110:	d109      	bne.n	8000126 <__do_global_dtors_aux+0x1e>
 8000112:	f7ff ffd5 	bl	80000c0 <deregister_tm_clones>
 8000116:	4b05      	ldr	r3, [pc, #20]	; (800012c <__do_global_dtors_aux+0x24>)
 8000118:	2b00      	cmp	r3, #0
 800011a:	d002      	beq.n	8000122 <__do_global_dtors_aux+0x1a>
 800011c:	4804      	ldr	r0, [pc, #16]	; (8000130 <__do_global_dtors_aux+0x28>)
 800011e:	e000      	b.n	8000122 <__do_global_dtors_aux+0x1a>
 8000120:	bf00      	nop
 8000122:	2301      	movs	r3, #1
 8000124:	7023      	strb	r3, [r4, #0]
 8000126:	bd10      	pop	{r4, pc}
 8000128:	20000008 	.word	0x20000008
 800012c:	00000000 	.word	0x00000000
 8000130:	0800102c 	.word	0x0800102c

08000134 <frame_dummy>:
 8000134:	4b05      	ldr	r3, [pc, #20]	; (800014c <frame_dummy+0x18>)
 8000136:	b510      	push	{r4, lr}
 8000138:	2b00      	cmp	r3, #0
 800013a:	d003      	beq.n	8000144 <frame_dummy+0x10>
 800013c:	4904      	ldr	r1, [pc, #16]	; (8000150 <frame_dummy+0x1c>)
 800013e:	4805      	ldr	r0, [pc, #20]	; (8000154 <frame_dummy+0x20>)
 8000140:	e000      	b.n	8000144 <frame_dummy+0x10>
 8000142:	bf00      	nop
 8000144:	f7ff ffcc 	bl	80000e0 <register_tm_clones>
 8000148:	bd10      	pop	{r4, pc}
 800014a:	46c0      	nop			; (mov r8, r8)
 800014c:	00000000 	.word	0x00000000
 8000150:	2000000c 	.word	0x2000000c
 8000154:	0800102c 	.word	0x0800102c

08000158 <__libc_init_array>:
 8000158:	b570      	push	{r4, r5, r6, lr}
 800015a:	4d0c      	ldr	r5, [pc, #48]	; (800018c <__libc_init_array+0x34>)
 800015c:	4e0c      	ldr	r6, [pc, #48]	; (8000190 <__libc_init_array+0x38>)
 800015e:	1b76      	subs	r6, r6, r5
 8000160:	10b6      	asrs	r6, r6, #2
 8000162:	d005      	beq.n	8000170 <__libc_init_array+0x18>
 8000164:	2400      	movs	r4, #0
 8000166:	cd08      	ldmia	r5!, {r3}
 8000168:	3401      	adds	r4, #1
 800016a:	4798      	blx	r3
 800016c:	42a6      	cmp	r6, r4
 800016e:	d1fa      	bne.n	8000166 <__libc_init_array+0xe>
 8000170:	f000 ff5c 	bl	800102c <_init>
 8000174:	4d07      	ldr	r5, [pc, #28]	; (8000194 <__libc_init_array+0x3c>)
 8000176:	4e08      	ldr	r6, [pc, #32]	; (8000198 <__libc_init_array+0x40>)
 8000178:	1b76      	subs	r6, r6, r5
 800017a:	10b6      	asrs	r6, r6, #2
 800017c:	d005      	beq.n	800018a <__libc_init_array+0x32>
 800017e:	2400      	movs	r4, #0
 8000180:	cd08      	ldmia	r5!, {r3}
 8000182:	3401      	adds	r4, #1
 8000184:	4798      	blx	r3
 8000186:	42a6      	cmp	r6, r4
 8000188:	d1fa      	bne.n	8000180 <__libc_init_array+0x28>
 800018a:	bd70      	pop	{r4, r5, r6, pc}
 800018c:	08001118 	.word	0x08001118
 8000190:	08001118 	.word	0x08001118
 8000194:	08001118 	.word	0x08001118
 8000198:	0800111c 	.word	0x0800111c

0800019c <Reset_Handler>:
 800019c:	480d      	ldr	r0, [pc, #52]	; (80001d4 <LoopForever+0x2>)
 800019e:	4685      	mov	sp, r0
 80001a0:	480d      	ldr	r0, [pc, #52]	; (80001d8 <LoopForever+0x6>)
 80001a2:	490e      	ldr	r1, [pc, #56]	; (80001dc <LoopForever+0xa>)
 80001a4:	4a0e      	ldr	r2, [pc, #56]	; (80001e0 <LoopForever+0xe>)
 80001a6:	2300      	movs	r3, #0
 80001a8:	e002      	b.n	80001b0 <LoopCopyDataInit>

080001aa <CopyDataInit>:
 80001aa:	58d4      	ldr	r4, [r2, r3]
 80001ac:	50c4      	str	r4, [r0, r3]
 80001ae:	3304      	adds	r3, #4

080001b0 <LoopCopyDataInit>:
 80001b0:	18c4      	adds	r4, r0, r3
 80001b2:	428c      	cmp	r4, r1
 80001b4:	d3f9      	bcc.n	80001aa <CopyDataInit>
 80001b6:	4a0b      	ldr	r2, [pc, #44]	; (80001e4 <LoopForever+0x12>)
 80001b8:	4c0b      	ldr	r4, [pc, #44]	; (80001e8 <LoopForever+0x16>)
 80001ba:	2300      	movs	r3, #0
 80001bc:	e001      	b.n	80001c2 <LoopFillZerobss>

080001be <FillZerobss>:
 80001be:	6013      	str	r3, [r2, #0]
 80001c0:	3204      	adds	r2, #4

080001c2 <LoopFillZerobss>:
 80001c2:	42a2      	cmp	r2, r4
 80001c4:	d3fb      	bcc.n	80001be <FillZerobss>
 80001c6:	f000 fecf 	bl	8000f68 <SystemInit>
 80001ca:	f7ff ffc5 	bl	8000158 <__libc_init_array>
 80001ce:	f000 f80f 	bl	80001f0 <main>

080001d2 <LoopForever>:
 80001d2:	e7fe      	b.n	80001d2 <LoopForever>
 80001d4:	20001000 	.word	0x20001000
 80001d8:	20000000 	.word	0x20000000
 80001dc:	20000008 	.word	0x20000008
 80001e0:	08001120 	.word	0x08001120
 80001e4:	20000008 	.word	0x20000008
 80001e8:	200001a4 	.word	0x200001a4

080001ec <ADC_COMP_IRQHandler>:
 80001ec:	e7fe      	b.n	80001ec <ADC_COMP_IRQHandler>
	...

080001f0 <main>:
 80001f0:	2000      	movs	r0, #0
 80001f2:	b510      	push	{r4, lr}
 80001f4:	2100      	movs	r1, #0
 80001f6:	f000 fecd 	bl	8000f94 <BSP_PB_Init>
 80001fa:	2000      	movs	r0, #0
 80001fc:	f000 ff06 	bl	800100c <BSP_PB_GetState>
 8000200:	2800      	cmp	r0, #0
 8000202:	d00e      	beq.n	8000222 <main+0x32>
 8000204:	4b09      	ldr	r3, [pc, #36]	; (800022c <main+0x3c>)
 8000206:	490a      	ldr	r1, [pc, #40]	; (8000230 <main+0x40>)
 8000208:	6818      	ldr	r0, [r3, #0]
 800020a:	2380      	movs	r3, #128	; 0x80
 800020c:	04c0      	lsls	r0, r0, #19
 800020e:	021b      	lsls	r3, r3, #8
 8000210:	0cc0      	lsrs	r0, r0, #19
 8000212:	4318      	orrs	r0, r3
 8000214:	f000 faf2 	bl	80007fc <APP_SystemClockConfig>
 8000218:	f000 f80e 	bl	8000238 <Bootloader_Init>
 800021c:	f000 fb52 	bl	80008c4 <Bootloader_ProtocolDetection>
 8000220:	e7fc      	b.n	800021c <main+0x2c>
 8000222:	4804      	ldr	r0, [pc, #16]	; (8000234 <main+0x44>)
 8000224:	f000 f9f0 	bl	8000608 <JumpToAddress>
 8000228:	e7ec      	b.n	8000204 <main+0x14>
 800022a:	46c0      	nop			; (mov r8, r8)
 800022c:	1fff0f10 	.word	0x1fff0f10
 8000230:	016e3600 	.word	0x016e3600
 8000234:	08001000 	.word	0x08001000

08000238 <Bootloader_Init>:
 8000238:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800023a:	46de      	mov	lr, fp
 800023c:	4657      	mov	r7, sl
 800023e:	464e      	mov	r6, r9
 8000240:	4645      	mov	r5, r8
 8000242:	b5e0      	push	{r5, r6, r7, lr}
 8000244:	f000 fe4c 	bl	8000ee0 <WDG_Init>
 8000248:	2101      	movs	r1, #1
 800024a:	4a62      	ldr	r2, [pc, #392]	; (80003d4 <Bootloader_Init+0x19c>)
 800024c:	6b53      	ldr	r3, [r2, #52]	; 0x34
 800024e:	430b      	orrs	r3, r1
 8000250:	6353      	str	r3, [r2, #52]	; 0x34
 8000252:	23a0      	movs	r3, #160	; 0xa0
 8000254:	05db      	lsls	r3, r3, #23
 8000256:	681a      	ldr	r2, [r3, #0]
 8000258:	495f      	ldr	r1, [pc, #380]	; (80003d8 <Bootloader_Init+0x1a0>)
 800025a:	400a      	ands	r2, r1
 800025c:	601a      	str	r2, [r3, #0]
 800025e:	4a5f      	ldr	r2, [pc, #380]	; (80003dc <Bootloader_Init+0x1a4>)
 8000260:	6812      	ldr	r2, [r2, #0]
 8000262:	0711      	lsls	r1, r2, #28
 8000264:	d403      	bmi.n	800026e <Bootloader_Init+0x36>
 8000266:	2040      	movs	r0, #64	; 0x40
 8000268:	68d9      	ldr	r1, [r3, #12]
 800026a:	4301      	orrs	r1, r0
 800026c:	60d9      	str	r1, [r3, #12]
 800026e:	0553      	lsls	r3, r2, #21
 8000270:	d406      	bmi.n	8000280 <Bootloader_Init+0x48>
 8000272:	21a0      	movs	r1, #160	; 0xa0
 8000274:	2380      	movs	r3, #128	; 0x80
 8000276:	05c9      	lsls	r1, r1, #23
 8000278:	68c8      	ldr	r0, [r1, #12]
 800027a:	035b      	lsls	r3, r3, #13
 800027c:	4303      	orrs	r3, r0
 800027e:	60cb      	str	r3, [r1, #12]
 8000280:	0413      	lsls	r3, r2, #16
 8000282:	d406      	bmi.n	8000292 <Bootloader_Init+0x5a>
 8000284:	22a0      	movs	r2, #160	; 0xa0
 8000286:	2380      	movs	r3, #128	; 0x80
 8000288:	05d2      	lsls	r2, r2, #23
 800028a:	68d1      	ldr	r1, [r2, #12]
 800028c:	05db      	lsls	r3, r3, #23
 800028e:	430b      	orrs	r3, r1
 8000290:	60d3      	str	r3, [r2, #12]
 8000292:	25a0      	movs	r5, #160	; 0xa0
 8000294:	2608      	movs	r6, #8
 8000296:	05ed      	lsls	r5, r5, #23
 8000298:	692b      	ldr	r3, [r5, #16]
 800029a:	692f      	ldr	r7, [r5, #16]
 800029c:	401e      	ands	r6, r3
 800029e:	2380      	movs	r3, #128	; 0x80
 80002a0:	00db      	lsls	r3, r3, #3
 80002a2:	469b      	mov	fp, r3
 80002a4:	401f      	ands	r7, r3
 80002a6:	2380      	movs	r3, #128	; 0x80
 80002a8:	692c      	ldr	r4, [r5, #16]
 80002aa:	021b      	lsls	r3, r3, #8
 80002ac:	401c      	ands	r4, r3
 80002ae:	46b0      	mov	r8, r6
 80002b0:	2608      	movs	r6, #8
 80002b2:	46b9      	mov	r9, r7
 80002b4:	465f      	mov	r7, fp
 80002b6:	46a2      	mov	sl, r4
 80002b8:	2480      	movs	r4, #128	; 0x80
 80002ba:	692b      	ldr	r3, [r5, #16]
 80002bc:	0224      	lsls	r4, r4, #8
 80002be:	401e      	ands	r6, r3
 80002c0:	692b      	ldr	r3, [r5, #16]
 80002c2:	401f      	ands	r7, r3
 80002c4:	692b      	ldr	r3, [r5, #16]
 80002c6:	401c      	ands	r4, r3
 80002c8:	f000 fe34 	bl	8000f34 <WDG_Refresh>
 80002cc:	4643      	mov	r3, r8
 80002ce:	2b00      	cmp	r3, #0
 80002d0:	d001      	beq.n	80002d6 <Bootloader_Init+0x9e>
 80002d2:	2e00      	cmp	r6, #0
 80002d4:	d05a      	beq.n	800038c <Bootloader_Init+0x154>
 80002d6:	464b      	mov	r3, r9
 80002d8:	2b00      	cmp	r3, #0
 80002da:	d001      	beq.n	80002e0 <Bootloader_Init+0xa8>
 80002dc:	2f00      	cmp	r7, #0
 80002de:	d061      	beq.n	80003a4 <Bootloader_Init+0x16c>
 80002e0:	4653      	mov	r3, sl
 80002e2:	2b00      	cmp	r3, #0
 80002e4:	d0e3      	beq.n	80002ae <Bootloader_Init+0x76>
 80002e6:	2c00      	cmp	r4, #0
 80002e8:	d1e1      	bne.n	80002ae <Bootloader_Init+0x76>
 80002ea:	23a0      	movs	r3, #160	; 0xa0
 80002ec:	4a3c      	ldr	r2, [pc, #240]	; (80003e0 <Bootloader_Init+0x1a8>)
 80002ee:	05db      	lsls	r3, r3, #23
 80002f0:	601a      	str	r2, [r3, #0]
 80002f2:	681a      	ldr	r2, [r3, #0]
 80002f4:	493b      	ldr	r1, [pc, #236]	; (80003e4 <Bootloader_Init+0x1ac>)
 80002f6:	400a      	ands	r2, r1
 80002f8:	601a      	str	r2, [r3, #0]
 80002fa:	2288      	movs	r2, #136	; 0x88
 80002fc:	6a59      	ldr	r1, [r3, #36]	; 0x24
 80002fe:	0552      	lsls	r2, r2, #21
 8000300:	430a      	orrs	r2, r1
 8000302:	625a      	str	r2, [r3, #36]	; 0x24
 8000304:	2380      	movs	r3, #128	; 0x80
 8000306:	4a33      	ldr	r2, [pc, #204]	; (80003d4 <Bootloader_Init+0x19c>)
 8000308:	01db      	lsls	r3, r3, #7
 800030a:	6c11      	ldr	r1, [r2, #64]	; 0x40
 800030c:	430b      	orrs	r3, r1
 800030e:	6413      	str	r3, [r2, #64]	; 0x40
 8000310:	22a0      	movs	r2, #160	; 0xa0
 8000312:	4b35      	ldr	r3, [pc, #212]	; (80003e8 <Bootloader_Init+0x1b0>)
 8000314:	0152      	lsls	r2, r2, #5
 8000316:	68d9      	ldr	r1, [r3, #12]
 8000318:	430a      	orrs	r2, r1
 800031a:	60da      	str	r2, [r3, #12]
 800031c:	22d0      	movs	r2, #208	; 0xd0
 800031e:	609a      	str	r2, [r3, #8]
 8000320:	695a      	ldr	r2, [r3, #20]
 8000322:	4932      	ldr	r1, [pc, #200]	; (80003ec <Bootloader_Init+0x1b4>)
 8000324:	4011      	ands	r1, r2
 8000326:	2280      	movs	r2, #128	; 0x80
 8000328:	0152      	lsls	r2, r2, #5
 800032a:	430a      	orrs	r2, r1
 800032c:	615a      	str	r2, [r3, #20]
 800032e:	2280      	movs	r2, #128	; 0x80
 8000330:	68d9      	ldr	r1, [r3, #12]
 8000332:	0192      	lsls	r2, r2, #6
 8000334:	430a      	orrs	r2, r1
 8000336:	2180      	movs	r1, #128	; 0x80
 8000338:	60da      	str	r2, [r3, #12]
 800033a:	00c9      	lsls	r1, r1, #3
 800033c:	681a      	ldr	r2, [r3, #0]
 800033e:	420a      	tst	r2, r1
 8000340:	d0fc      	beq.n	800033c <Bootloader_Init+0x104>
 8000342:	681a      	ldr	r2, [r3, #0]
 8000344:	0512      	lsls	r2, r2, #20
 8000346:	d43b      	bmi.n	80003c0 <Bootloader_Init+0x188>
 8000348:	6899      	ldr	r1, [r3, #8]
 800034a:	4a29      	ldr	r2, [pc, #164]	; (80003f0 <Bootloader_Init+0x1b8>)
 800034c:	4291      	cmp	r1, r2
 800034e:	d837      	bhi.n	80003c0 <Bootloader_Init+0x188>
 8000350:	689a      	ldr	r2, [r3, #8]
 8000352:	2a17      	cmp	r2, #23
 8000354:	d934      	bls.n	80003c0 <Bootloader_Init+0x188>
 8000356:	b672      	cpsid	i
 8000358:	2280      	movs	r2, #128	; 0x80
 800035a:	6819      	ldr	r1, [r3, #0]
 800035c:	0152      	lsls	r2, r2, #5
 800035e:	430a      	orrs	r2, r1
 8000360:	601a      	str	r2, [r3, #0]
 8000362:	695a      	ldr	r2, [r3, #20]
 8000364:	4923      	ldr	r1, [pc, #140]	; (80003f4 <Bootloader_Init+0x1bc>)
 8000366:	2079      	movs	r0, #121	; 0x79
 8000368:	400a      	ands	r2, r1
 800036a:	2160      	movs	r1, #96	; 0x60
 800036c:	615a      	str	r2, [r3, #20]
 800036e:	681a      	ldr	r2, [r3, #0]
 8000370:	438a      	bics	r2, r1
 8000372:	601a      	str	r2, [r3, #0]
 8000374:	68da      	ldr	r2, [r3, #12]
 8000376:	3954      	subs	r1, #84	; 0x54
 8000378:	430a      	orrs	r2, r1
 800037a:	60da      	str	r2, [r3, #12]
 800037c:	f000 fd94 	bl	8000ea8 <USART_SendByte>
 8000380:	bcf0      	pop	{r4, r5, r6, r7}
 8000382:	46bb      	mov	fp, r7
 8000384:	46b2      	mov	sl, r6
 8000386:	46a9      	mov	r9, r5
 8000388:	46a0      	mov	r8, r4
 800038a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800038c:	2250      	movs	r2, #80	; 0x50
 800038e:	4b14      	ldr	r3, [pc, #80]	; (80003e0 <Bootloader_Init+0x1a8>)
 8000390:	602b      	str	r3, [r5, #0]
 8000392:	682b      	ldr	r3, [r5, #0]
 8000394:	4393      	bics	r3, r2
 8000396:	602b      	str	r3, [r5, #0]
 8000398:	2388      	movs	r3, #136	; 0x88
 800039a:	6a2a      	ldr	r2, [r5, #32]
 800039c:	015b      	lsls	r3, r3, #5
 800039e:	4313      	orrs	r3, r2
 80003a0:	622b      	str	r3, [r5, #32]
 80003a2:	e7af      	b.n	8000304 <Bootloader_Init+0xcc>
 80003a4:	23a0      	movs	r3, #160	; 0xa0
 80003a6:	4a0e      	ldr	r2, [pc, #56]	; (80003e0 <Bootloader_Init+0x1a8>)
 80003a8:	05db      	lsls	r3, r3, #23
 80003aa:	601a      	str	r2, [r3, #0]
 80003ac:	681a      	ldr	r2, [r3, #0]
 80003ae:	4912      	ldr	r1, [pc, #72]	; (80003f8 <Bootloader_Init+0x1c0>)
 80003b0:	400a      	ands	r2, r1
 80003b2:	601a      	str	r2, [r3, #0]
 80003b4:	2288      	movs	r2, #136	; 0x88
 80003b6:	6a59      	ldr	r1, [r3, #36]	; 0x24
 80003b8:	0052      	lsls	r2, r2, #1
 80003ba:	430a      	orrs	r2, r1
 80003bc:	625a      	str	r2, [r3, #36]	; 0x24
 80003be:	e7a1      	b.n	8000304 <Bootloader_Init+0xcc>
 80003c0:	f3bf 8f4f 	dsb	sy
 80003c4:	4b0d      	ldr	r3, [pc, #52]	; (80003fc <Bootloader_Init+0x1c4>)
 80003c6:	4a0e      	ldr	r2, [pc, #56]	; (8000400 <Bootloader_Init+0x1c8>)
 80003c8:	60da      	str	r2, [r3, #12]
 80003ca:	f3bf 8f4f 	dsb	sy
 80003ce:	46c0      	nop			; (mov r8, r8)
 80003d0:	e7fd      	b.n	80003ce <Bootloader_Init+0x196>
 80003d2:	46c0      	nop			; (mov r8, r8)
 80003d4:	40021000 	.word	0x40021000
 80003d8:	3fcfff3f 	.word	0x3fcfff3f
 80003dc:	1fff0d90 	.word	0x1fff0d90
 80003e0:	ebffffff 	.word	0xebffffff
 80003e4:	afffffff 	.word	0xafffffff
 80003e8:	40013800 	.word	0x40013800
 80003ec:	ffff8fff 	.word	0xffff8fff
 80003f0:	0000553a 	.word	0x0000553a
 80003f4:	ffffefff 	.word	0xffffefff
 80003f8:	ffebffff 	.word	0xffebffff
 80003fc:	e000ed00 	.word	0xe000ed00
 8000400:	05fa0004 	.word	0x05fa0004

08000404 <GetAddressArea>:
 8000404:	b570      	push	{r4, r5, r6, lr}
 8000406:	0006      	movs	r6, r0
 8000408:	f000 fd58 	bl	8000ebc <USART_ReadByte>
 800040c:	4d39      	ldr	r5, [pc, #228]	; (80004f4 <GetAddressArea+0xf0>)
 800040e:	7028      	strb	r0, [r5, #0]
 8000410:	f000 fd54 	bl	8000ebc <USART_ReadByte>
 8000414:	7068      	strb	r0, [r5, #1]
 8000416:	f000 fd51 	bl	8000ebc <USART_ReadByte>
 800041a:	70a8      	strb	r0, [r5, #2]
 800041c:	f000 fd4e 	bl	8000ebc <USART_ReadByte>
 8000420:	70e8      	strb	r0, [r5, #3]
 8000422:	f000 fd4b 	bl	8000ebc <USART_ReadByte>
 8000426:	002b      	movs	r3, r5
 8000428:	2200      	movs	r2, #0
 800042a:	1d2c      	adds	r4, r5, #4
 800042c:	7819      	ldrb	r1, [r3, #0]
 800042e:	3301      	adds	r3, #1
 8000430:	404a      	eors	r2, r1
 8000432:	429c      	cmp	r4, r3
 8000434:	d1fa      	bne.n	800042c <GetAddressArea+0x28>
 8000436:	4290      	cmp	r0, r2
 8000438:	d001      	beq.n	800043e <GetAddressArea+0x3a>
 800043a:	2000      	movs	r0, #0
 800043c:	bd70      	pop	{r4, r5, r6, pc}
 800043e:	2079      	movs	r0, #121	; 0x79
 8000440:	f000 fd32 	bl	8000ea8 <USART_SendByte>
 8000444:	782b      	ldrb	r3, [r5, #0]
 8000446:	786a      	ldrb	r2, [r5, #1]
 8000448:	061b      	lsls	r3, r3, #24
 800044a:	0412      	lsls	r2, r2, #16
 800044c:	189b      	adds	r3, r3, r2
 800044e:	78aa      	ldrb	r2, [r5, #2]
 8000450:	0212      	lsls	r2, r2, #8
 8000452:	189b      	adds	r3, r3, r2
 8000454:	78ea      	ldrb	r2, [r5, #3]
 8000456:	189b      	adds	r3, r3, r2
 8000458:	4a27      	ldr	r2, [pc, #156]	; (80004f8 <GetAddressArea+0xf4>)
 800045a:	6033      	str	r3, [r6, #0]
 800045c:	4293      	cmp	r3, r2
 800045e:	d022      	beq.n	80004a6 <GetAddressArea+0xa2>
 8000460:	dc0e      	bgt.n	8000480 <GetAddressArea+0x7c>
 8000462:	4a26      	ldr	r2, [pc, #152]	; (80004fc <GetAddressArea+0xf8>)
 8000464:	4293      	cmp	r3, r2
 8000466:	d013      	beq.n	8000490 <GetAddressArea+0x8c>
 8000468:	4a25      	ldr	r2, [pc, #148]	; (8000500 <GetAddressArea+0xfc>)
 800046a:	4293      	cmp	r3, r2
 800046c:	d010      	beq.n	8000490 <GetAddressArea+0x8c>
 800046e:	4a25      	ldr	r2, [pc, #148]	; (8000504 <GetAddressArea+0x100>)
 8000470:	4293      	cmp	r3, r2
 8000472:	d10f      	bne.n	8000494 <GetAddressArea+0x90>
 8000474:	4b24      	ldr	r3, [pc, #144]	; (8000508 <GetAddressArea+0x104>)
 8000476:	2001      	movs	r0, #1
 8000478:	6033      	str	r3, [r6, #0]
 800047a:	4b24      	ldr	r3, [pc, #144]	; (800050c <GetAddressArea+0x108>)
 800047c:	781b      	ldrb	r3, [r3, #0]
 800047e:	e7dd      	b.n	800043c <GetAddressArea+0x38>
 8000480:	4a23      	ldr	r2, [pc, #140]	; (8000510 <GetAddressArea+0x10c>)
 8000482:	4293      	cmp	r3, r2
 8000484:	d106      	bne.n	8000494 <GetAddressArea+0x90>
 8000486:	4b23      	ldr	r3, [pc, #140]	; (8000514 <GetAddressArea+0x110>)
 8000488:	6033      	str	r3, [r6, #0]
 800048a:	4b20      	ldr	r3, [pc, #128]	; (800050c <GetAddressArea+0x108>)
 800048c:	781a      	ldrb	r2, [r3, #0]
 800048e:	781b      	ldrb	r3, [r3, #0]
 8000490:	2003      	movs	r0, #3
 8000492:	e7d3      	b.n	800043c <GetAddressArea+0x38>
 8000494:	2080      	movs	r0, #128	; 0x80
 8000496:	4a1d      	ldr	r2, [pc, #116]	; (800050c <GetAddressArea+0x108>)
 8000498:	0500      	lsls	r0, r0, #20
 800049a:	7811      	ldrb	r1, [r2, #0]
 800049c:	b2c9      	uxtb	r1, r1
 800049e:	4283      	cmp	r3, r0
 80004a0:	d204      	bcs.n	80004ac <GetAddressArea+0xa8>
 80004a2:	7813      	ldrb	r3, [r2, #0]
 80004a4:	e7c9      	b.n	800043a <GetAddressArea+0x36>
 80004a6:	4b1c      	ldr	r3, [pc, #112]	; (8000518 <GetAddressArea+0x114>)
 80004a8:	6033      	str	r3, [r6, #0]
 80004aa:	e7ee      	b.n	800048a <GetAddressArea+0x86>
 80004ac:	2007      	movs	r0, #7
 80004ae:	4001      	ands	r1, r0
 80004b0:	481a      	ldr	r0, [pc, #104]	; (800051c <GetAddressArea+0x118>)
 80004b2:	0349      	lsls	r1, r1, #13
 80004b4:	4684      	mov	ip, r0
 80004b6:	4461      	add	r1, ip
 80004b8:	2001      	movs	r0, #1
 80004ba:	428b      	cmp	r3, r1
 80004bc:	d3be      	bcc.n	800043c <GetAddressArea+0x38>
 80004be:	4918      	ldr	r1, [pc, #96]	; (8000520 <GetAddressArea+0x11c>)
 80004c0:	7812      	ldrb	r2, [r2, #0]
 80004c2:	468c      	mov	ip, r1
 80004c4:	0692      	lsls	r2, r2, #26
 80004c6:	0f92      	lsrs	r2, r2, #30
 80004c8:	4916      	ldr	r1, [pc, #88]	; (8000524 <GetAddressArea+0x120>)
 80004ca:	02d2      	lsls	r2, r2, #11
 80004cc:	4462      	add	r2, ip
 80004ce:	428b      	cmp	r3, r1
 80004d0:	d903      	bls.n	80004da <GetAddressArea+0xd6>
 80004d2:	4293      	cmp	r3, r2
 80004d4:	d2b1      	bcs.n	800043a <GetAddressArea+0x36>
 80004d6:	2002      	movs	r0, #2
 80004d8:	e7b0      	b.n	800043c <GetAddressArea+0x38>
 80004da:	4a13      	ldr	r2, [pc, #76]	; (8000528 <GetAddressArea+0x124>)
 80004dc:	4293      	cmp	r3, r2
 80004de:	d9ac      	bls.n	800043a <GetAddressArea+0x36>
 80004e0:	4a12      	ldr	r2, [pc, #72]	; (800052c <GetAddressArea+0x128>)
 80004e2:	2005      	movs	r0, #5
 80004e4:	4293      	cmp	r3, r2
 80004e6:	d9a9      	bls.n	800043c <GetAddressArea+0x38>
 80004e8:	4a11      	ldr	r2, [pc, #68]	; (8000530 <GetAddressArea+0x12c>)
 80004ea:	3802      	subs	r0, #2
 80004ec:	4293      	cmp	r3, r2
 80004ee:	d9a5      	bls.n	800043c <GetAddressArea+0x38>
 80004f0:	e7a3      	b.n	800043a <GetAddressArea+0x36>
 80004f2:	46c0      	nop			; (mov r8, r8)
 80004f4:	20000024 	.word	0x20000024
 80004f8:	1ffff7e8 	.word	0x1ffff7e8
 80004fc:	1ffff7cc 	.word	0x1ffff7cc
 8000500:	1ffff7e0 	.word	0x1ffff7e0
 8000504:	1ffff7a6 	.word	0x1ffff7a6
 8000508:	08000bfc 	.word	0x08000bfc
 800050c:	1fff0ffc 	.word	0x1fff0ffc
 8000510:	1ffff800 	.word	0x1ffff800
 8000514:	1fff0e80 	.word	0x1fff0e80
 8000518:	1fff0e00 	.word	0x1fff0e00
 800051c:	08002000 	.word	0x08002000
 8000520:	20000800 	.word	0x20000800
 8000524:	200001ff 	.word	0x200001ff
 8000528:	1ffeffff 	.word	0x1ffeffff
 800052c:	1fff0dff 	.word	0x1fff0dff
 8000530:	1fff0fff 	.word	0x1fff0fff

08000534 <ReadMemory>:
 8000534:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000536:	b083      	sub	sp, #12
 8000538:	a801      	add	r0, sp, #4
 800053a:	f7ff ff63 	bl	8000404 <GetAddressArea>
 800053e:	1e07      	subs	r7, r0, #0
 8000540:	d102      	bne.n	8000548 <ReadMemory+0x14>
 8000542:	2000      	movs	r0, #0
 8000544:	b003      	add	sp, #12
 8000546:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000548:	f000 fcb8 	bl	8000ebc <USART_ReadByte>
 800054c:	4d29      	ldr	r5, [pc, #164]	; (80005f4 <ReadMemory+0xc0>)
 800054e:	0004      	movs	r4, r0
 8000550:	7028      	strb	r0, [r5, #0]
 8000552:	f000 fcb3 	bl	8000ebc <USART_ReadByte>
 8000556:	4044      	eors	r4, r0
 8000558:	b2e4      	uxtb	r4, r4
 800055a:	2cff      	cmp	r4, #255	; 0xff
 800055c:	d1f1      	bne.n	8000542 <ReadMemory+0xe>
 800055e:	2079      	movs	r0, #121	; 0x79
 8000560:	f000 fca2 	bl	8000ea8 <USART_SendByte>
 8000564:	9b01      	ldr	r3, [sp, #4]
 8000566:	4a24      	ldr	r2, [pc, #144]	; (80005f8 <ReadMemory+0xc4>)
 8000568:	4293      	cmp	r3, r2
 800056a:	d013      	beq.n	8000594 <ReadMemory+0x60>
 800056c:	4a23      	ldr	r2, [pc, #140]	; (80005fc <ReadMemory+0xc8>)
 800056e:	4293      	cmp	r3, r2
 8000570:	d010      	beq.n	8000594 <ReadMemory+0x60>
 8000572:	2600      	movs	r6, #0
 8000574:	2f01      	cmp	r7, #1
 8000576:	d101      	bne.n	800057c <ReadMemory+0x48>
 8000578:	e029      	b.n	80005ce <ReadMemory+0x9a>
 800057a:	9b01      	ldr	r3, [sp, #4]
 800057c:	18f3      	adds	r3, r6, r3
 800057e:	7818      	ldrb	r0, [r3, #0]
 8000580:	3601      	adds	r6, #1
 8000582:	b2c0      	uxtb	r0, r0
 8000584:	f000 fc90 	bl	8000ea8 <USART_SendByte>
 8000588:	782b      	ldrb	r3, [r5, #0]
 800058a:	b2b6      	uxth	r6, r6
 800058c:	42b3      	cmp	r3, r6
 800058e:	daf4      	bge.n	800057a <ReadMemory+0x46>
 8000590:	2001      	movs	r0, #1
 8000592:	e7d7      	b.n	8000544 <ReadMemory+0x10>
 8000594:	2007      	movs	r0, #7
 8000596:	4b1a      	ldr	r3, [pc, #104]	; (8000600 <ReadMemory+0xcc>)
 8000598:	2400      	movs	r4, #0
 800059a:	781a      	ldrb	r2, [r3, #0]
 800059c:	4010      	ands	r0, r2
 800059e:	2200      	movs	r2, #0
 80005a0:	3001      	adds	r0, #1
 80005a2:	00c0      	lsls	r0, r0, #3
 80005a4:	7068      	strb	r0, [r5, #1]
 80005a6:	70aa      	strb	r2, [r5, #2]
 80005a8:	781b      	ldrb	r3, [r3, #0]
 80005aa:	712a      	strb	r2, [r5, #4]
 80005ac:	069b      	lsls	r3, r3, #26
 80005ae:	0f9b      	lsrs	r3, r3, #30
 80005b0:	3301      	adds	r3, #1
 80005b2:	005b      	lsls	r3, r3, #1
 80005b4:	70eb      	strb	r3, [r5, #3]
 80005b6:	e001      	b.n	80005bc <ReadMemory+0x88>
 80005b8:	192b      	adds	r3, r5, r4
 80005ba:	7858      	ldrb	r0, [r3, #1]
 80005bc:	f000 fc74 	bl	8000ea8 <USART_SendByte>
 80005c0:	3401      	adds	r4, #1
 80005c2:	782b      	ldrb	r3, [r5, #0]
 80005c4:	b2a4      	uxth	r4, r4
 80005c6:	42a3      	cmp	r3, r4
 80005c8:	daf6      	bge.n	80005b8 <ReadMemory+0x84>
 80005ca:	2001      	movs	r0, #1
 80005cc:	e7ba      	b.n	8000544 <ReadMemory+0x10>
 80005ce:	4a0d      	ldr	r2, [pc, #52]	; (8000604 <ReadMemory+0xd0>)
 80005d0:	6a10      	ldr	r0, [r2, #32]
 80005d2:	4004      	ands	r4, r0
 80005d4:	2caa      	cmp	r4, #170	; 0xaa
 80005d6:	d0d1      	beq.n	800057c <ReadMemory+0x48>
 80005d8:	2400      	movs	r4, #0
 80005da:	2300      	movs	r3, #0
 80005dc:	7818      	ldrb	r0, [r3, #0]
 80005de:	3401      	adds	r4, #1
 80005e0:	b2c0      	uxtb	r0, r0
 80005e2:	f000 fc61 	bl	8000ea8 <USART_SendByte>
 80005e6:	782a      	ldrb	r2, [r5, #0]
 80005e8:	b2a4      	uxth	r4, r4
 80005ea:	0023      	movs	r3, r4
 80005ec:	42a2      	cmp	r2, r4
 80005ee:	daf5      	bge.n	80005dc <ReadMemory+0xa8>
 80005f0:	2001      	movs	r0, #1
 80005f2:	e7a7      	b.n	8000544 <ReadMemory+0x10>
 80005f4:	20000024 	.word	0x20000024
 80005f8:	1ffff7cc 	.word	0x1ffff7cc
 80005fc:	1ffff7e0 	.word	0x1ffff7e0
 8000600:	1fff0ffc 	.word	0x1fff0ffc
 8000604:	40022000 	.word	0x40022000

08000608 <JumpToAddress>:
 8000608:	4a08      	ldr	r2, [pc, #32]	; (800062c <JumpToAddress+0x24>)
 800060a:	6803      	ldr	r3, [r0, #0]
 800060c:	b580      	push	{r7, lr}
 800060e:	4013      	ands	r3, r2
 8000610:	2280      	movs	r2, #128	; 0x80
 8000612:	af00      	add	r7, sp, #0
 8000614:	0592      	lsls	r2, r2, #22
 8000616:	4293      	cmp	r3, r2
 8000618:	d105      	bne.n	8000626 <JumpToAddress+0x1e>
 800061a:	b662      	cpsie	i
 800061c:	6803      	ldr	r3, [r0, #0]
 800061e:	f383 8808 	msr	MSP, r3
 8000622:	6843      	ldr	r3, [r0, #4]
 8000624:	4798      	blx	r3
 8000626:	46bd      	mov	sp, r7
 8000628:	bd80      	pop	{r7, pc}
 800062a:	46c0      	nop			; (mov r8, r8)
 800062c:	2ffe0000 	.word	0x2ffe0000

08000630 <WriteMemory>:
 8000630:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000632:	46c6      	mov	lr, r8
 8000634:	b500      	push	{lr}
 8000636:	b082      	sub	sp, #8
 8000638:	a801      	add	r0, sp, #4
 800063a:	f7ff fee3 	bl	8000404 <GetAddressArea>
 800063e:	0003      	movs	r3, r0
 8000640:	3b01      	subs	r3, #1
 8000642:	b2db      	uxtb	r3, r3
 8000644:	4680      	mov	r8, r0
 8000646:	2b02      	cmp	r3, #2
 8000648:	d904      	bls.n	8000654 <WriteMemory+0x24>
 800064a:	2000      	movs	r0, #0
 800064c:	b002      	add	sp, #8
 800064e:	bc80      	pop	{r7}
 8000650:	46b8      	mov	r8, r7
 8000652:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000654:	f000 fc32 	bl	8000ebc <USART_ReadByte>
 8000658:	2400      	movs	r4, #0
 800065a:	0005      	movs	r5, r0
 800065c:	2700      	movs	r7, #0
 800065e:	4e18      	ldr	r6, [pc, #96]	; (80006c0 <WriteMemory+0x90>)
 8000660:	f000 fc2c 	bl	8000ebc <USART_ReadByte>
 8000664:	3401      	adds	r4, #1
 8000666:	b2a4      	uxth	r4, r4
 8000668:	55f0      	strb	r0, [r6, r7]
 800066a:	0027      	movs	r7, r4
 800066c:	42ac      	cmp	r4, r5
 800066e:	ddf7      	ble.n	8000660 <WriteMemory+0x30>
 8000670:	f000 fc24 	bl	8000ebc <USART_ReadByte>
 8000674:	0031      	movs	r1, r6
 8000676:	002b      	movs	r3, r5
 8000678:	1c74      	adds	r4, r6, #1
 800067a:	1964      	adds	r4, r4, r5
 800067c:	780a      	ldrb	r2, [r1, #0]
 800067e:	3101      	adds	r1, #1
 8000680:	4053      	eors	r3, r2
 8000682:	b2db      	uxtb	r3, r3
 8000684:	42a1      	cmp	r1, r4
 8000686:	d1f9      	bne.n	800067c <WriteMemory+0x4c>
 8000688:	4298      	cmp	r0, r3
 800068a:	d1de      	bne.n	800064a <WriteMemory+0x1a>
 800068c:	4643      	mov	r3, r8
 800068e:	2b02      	cmp	r3, #2
 8000690:	d00a      	beq.n	80006a8 <WriteMemory+0x78>
 8000692:	002a      	movs	r2, r5
 8000694:	0031      	movs	r1, r6
 8000696:	9801      	ldr	r0, [sp, #4]
 8000698:	2b03      	cmp	r3, #3
 800069a:	d002      	beq.n	80006a2 <WriteMemory+0x72>
 800069c:	f000 fa36 	bl	8000b0c <WriteFlash>
 80006a0:	e7d4      	b.n	800064c <WriteMemory+0x1c>
 80006a2:	f000 fa9b 	bl	8000bdc <WriteOption>
 80006a6:	e7d1      	b.n	800064c <WriteMemory+0x1c>
 80006a8:	2300      	movs	r3, #0
 80006aa:	2100      	movs	r1, #0
 80006ac:	9a01      	ldr	r2, [sp, #4]
 80006ae:	5c71      	ldrb	r1, [r6, r1]
 80006b0:	189a      	adds	r2, r3, r2
 80006b2:	3301      	adds	r3, #1
 80006b4:	7011      	strb	r1, [r2, #0]
 80006b6:	b299      	uxth	r1, r3
 80006b8:	42a9      	cmp	r1, r5
 80006ba:	ddf7      	ble.n	80006ac <WriteMemory+0x7c>
 80006bc:	2001      	movs	r0, #1
 80006be:	e7c5      	b.n	800064c <WriteMemory+0x1c>
 80006c0:	20000024 	.word	0x20000024

080006c4 <ExtendedErase>:
 80006c4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80006c6:	46d6      	mov	lr, sl
 80006c8:	464f      	mov	r7, r9
 80006ca:	4646      	mov	r6, r8
 80006cc:	b5c0      	push	{r6, r7, lr}
 80006ce:	f000 fbf5 	bl	8000ebc <USART_ReadByte>
 80006d2:	4681      	mov	r9, r0
 80006d4:	f000 fbf2 	bl	8000ebc <USART_ReadByte>
 80006d8:	464b      	mov	r3, r9
 80006da:	4043      	eors	r3, r0
 80006dc:	b2db      	uxtb	r3, r3
 80006de:	4698      	mov	r8, r3
 80006e0:	464b      	mov	r3, r9
 80006e2:	4682      	mov	sl, r0
 80006e4:	2bff      	cmp	r3, #255	; 0xff
 80006e6:	d037      	beq.n	8000758 <ExtendedErase+0x94>
 80006e8:	2600      	movs	r6, #0
 80006ea:	2700      	movs	r7, #0
 80006ec:	1c44      	adds	r4, r0, #1
 80006ee:	4d21      	ldr	r5, [pc, #132]	; (8000774 <ExtendedErase+0xb0>)
 80006f0:	0064      	lsls	r4, r4, #1
 80006f2:	f000 fbe3 	bl	8000ebc <USART_ReadByte>
 80006f6:	3601      	adds	r6, #1
 80006f8:	b2f6      	uxtb	r6, r6
 80006fa:	55e8      	strb	r0, [r5, r7]
 80006fc:	0037      	movs	r7, r6
 80006fe:	42a6      	cmp	r6, r4
 8000700:	dbf7      	blt.n	80006f2 <ExtendedErase+0x2e>
 8000702:	3c01      	subs	r4, #1
 8000704:	b2a3      	uxth	r3, r4
 8000706:	002a      	movs	r2, r5
 8000708:	4644      	mov	r4, r8
 800070a:	481b      	ldr	r0, [pc, #108]	; (8000778 <ExtendedErase+0xb4>)
 800070c:	7811      	ldrb	r1, [r2, #0]
 800070e:	3b01      	subs	r3, #1
 8000710:	b29b      	uxth	r3, r3
 8000712:	404c      	eors	r4, r1
 8000714:	3201      	adds	r2, #1
 8000716:	4283      	cmp	r3, r0
 8000718:	d1f8      	bne.n	800070c <ExtendedErase+0x48>
 800071a:	f000 fbcf 	bl	8000ebc <USART_ReadByte>
 800071e:	42a0      	cmp	r0, r4
 8000720:	d005      	beq.n	800072e <ExtendedErase+0x6a>
 8000722:	2000      	movs	r0, #0
 8000724:	bce0      	pop	{r5, r6, r7}
 8000726:	46ba      	mov	sl, r7
 8000728:	46b1      	mov	r9, r6
 800072a:	46a8      	mov	r8, r5
 800072c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800072e:	2300      	movs	r3, #0
 8000730:	005a      	lsls	r2, r3, #1
 8000732:	1c51      	adds	r1, r2, #1
 8000734:	5ca8      	ldrb	r0, [r5, r2]
 8000736:	5c6c      	ldrb	r4, [r5, r1]
 8000738:	3301      	adds	r3, #1
 800073a:	b2db      	uxtb	r3, r3
 800073c:	54ac      	strb	r4, [r5, r2]
 800073e:	5468      	strb	r0, [r5, r1]
 8000740:	459a      	cmp	sl, r3
 8000742:	d2f5      	bcs.n	8000730 <ExtendedErase+0x6c>
 8000744:	464b      	mov	r3, r9
 8000746:	2b00      	cmp	r3, #0
 8000748:	d00d      	beq.n	8000766 <ExtendedErase+0xa2>
 800074a:	2b20      	cmp	r3, #32
 800074c:	d1e9      	bne.n	8000722 <ExtendedErase+0x5e>
 800074e:	4651      	mov	r1, sl
 8000750:	0028      	movs	r0, r5
 8000752:	f000 fb47 	bl	8000de4 <SectorErase>
 8000756:	e7e5      	b.n	8000724 <ExtendedErase+0x60>
 8000758:	f000 fbb0 	bl	8000ebc <USART_ReadByte>
 800075c:	4540      	cmp	r0, r8
 800075e:	d1e0      	bne.n	8000722 <ExtendedErase+0x5e>
 8000760:	f000 fb7c 	bl	8000e5c <MassErase>
 8000764:	e7de      	b.n	8000724 <ExtendedErase+0x60>
 8000766:	2208      	movs	r2, #8
 8000768:	4641      	mov	r1, r8
 800076a:	0028      	movs	r0, r5
 800076c:	f000 fad2 	bl	8000d14 <PageErase>
 8000770:	e7d8      	b.n	8000724 <ExtendedErase+0x60>
 8000772:	46c0      	nop			; (mov r8, r8)
 8000774:	20000024 	.word	0x20000024
 8000778:	0000ffff 	.word	0x0000ffff

0800077c <WriteProtect>:
 800077c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800077e:	46c6      	mov	lr, r8
 8000780:	b500      	push	{lr}
 8000782:	f000 fb9b 	bl	8000ebc <USART_ReadByte>
 8000786:	2300      	movs	r3, #0
 8000788:	0005      	movs	r5, r0
 800078a:	0007      	movs	r7, r0
 800078c:	2400      	movs	r4, #0
 800078e:	4698      	mov	r8, r3
 8000790:	4e17      	ldr	r6, [pc, #92]	; (80007f0 <WriteProtect+0x74>)
 8000792:	f000 fb93 	bl	8000ebc <USART_ReadByte>
 8000796:	4643      	mov	r3, r8
 8000798:	3401      	adds	r4, #1
 800079a:	b2a4      	uxth	r4, r4
 800079c:	46a0      	mov	r8, r4
 800079e:	54f0      	strb	r0, [r6, r3]
 80007a0:	42ac      	cmp	r4, r5
 80007a2:	ddf6      	ble.n	8000792 <WriteProtect+0x16>
 80007a4:	f000 fb8a 	bl	8000ebc <USART_ReadByte>
 80007a8:	0033      	movs	r3, r6
 80007aa:	0004      	movs	r4, r0
 80007ac:	1c71      	adds	r1, r6, #1
 80007ae:	1949      	adds	r1, r1, r5
 80007b0:	781a      	ldrb	r2, [r3, #0]
 80007b2:	3301      	adds	r3, #1
 80007b4:	4057      	eors	r7, r2
 80007b6:	b2ff      	uxtb	r7, r7
 80007b8:	4299      	cmp	r1, r3
 80007ba:	d1f9      	bne.n	80007b0 <WriteProtect+0x34>
 80007bc:	2000      	movs	r0, #0
 80007be:	42bc      	cmp	r4, r7
 80007c0:	d112      	bne.n	80007e8 <WriteProtect+0x6c>
 80007c2:	2300      	movs	r3, #0
 80007c4:	2100      	movs	r1, #0
 80007c6:	4a0b      	ldr	r2, [pc, #44]	; (80007f4 <WriteProtect+0x78>)
 80007c8:	3001      	adds	r0, #1
 80007ca:	0004      	movs	r4, r0
 80007cc:	5c71      	ldrb	r1, [r6, r1]
 80007ce:	3301      	adds	r3, #1
 80007d0:	408c      	lsls	r4, r1
 80007d2:	b29b      	uxth	r3, r3
 80007d4:	0019      	movs	r1, r3
 80007d6:	43a2      	bics	r2, r4
 80007d8:	42ab      	cmp	r3, r5
 80007da:	ddf6      	ble.n	80007ca <WriteProtect+0x4e>
 80007dc:	8032      	strh	r2, [r6, #0]
 80007de:	0031      	movs	r1, r6
 80007e0:	2201      	movs	r2, #1
 80007e2:	4805      	ldr	r0, [pc, #20]	; (80007f8 <WriteProtect+0x7c>)
 80007e4:	f000 f9fa 	bl	8000bdc <WriteOption>
 80007e8:	bc80      	pop	{r7}
 80007ea:	46b8      	mov	r8, r7
 80007ec:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80007ee:	46c0      	nop			; (mov r8, r8)
 80007f0:	20000024 	.word	0x20000024
 80007f4:	0000ffff 	.word	0x0000ffff
 80007f8:	1fff0e8c 	.word	0x1fff0e8c

080007fc <APP_SystemClockConfig>:
 80007fc:	b510      	push	{r4, lr}
 80007fe:	2480      	movs	r4, #128	; 0x80
 8000800:	4b14      	ldr	r3, [pc, #80]	; (8000854 <APP_SystemClockConfig+0x58>)
 8000802:	0064      	lsls	r4, r4, #1
 8000804:	681a      	ldr	r2, [r3, #0]
 8000806:	4314      	orrs	r4, r2
 8000808:	601c      	str	r4, [r3, #0]
 800080a:	685c      	ldr	r4, [r3, #4]
 800080c:	0c24      	lsrs	r4, r4, #16
 800080e:	0422      	lsls	r2, r4, #16
 8000810:	4302      	orrs	r2, r0
 8000812:	2080      	movs	r0, #128	; 0x80
 8000814:	605a      	str	r2, [r3, #4]
 8000816:	00c0      	lsls	r0, r0, #3
 8000818:	681a      	ldr	r2, [r3, #0]
 800081a:	4202      	tst	r2, r0
 800081c:	d0fc      	beq.n	8000818 <APP_SystemClockConfig+0x1c>
 800081e:	689a      	ldr	r2, [r3, #8]
 8000820:	480d      	ldr	r0, [pc, #52]	; (8000858 <APP_SystemClockConfig+0x5c>)
 8000822:	2438      	movs	r4, #56	; 0x38
 8000824:	4002      	ands	r2, r0
 8000826:	2007      	movs	r0, #7
 8000828:	609a      	str	r2, [r3, #8]
 800082a:	689a      	ldr	r2, [r3, #8]
 800082c:	4382      	bics	r2, r0
 800082e:	609a      	str	r2, [r3, #8]
 8000830:	4a08      	ldr	r2, [pc, #32]	; (8000854 <APP_SystemClockConfig+0x58>)
 8000832:	6893      	ldr	r3, [r2, #8]
 8000834:	421c      	tst	r4, r3
 8000836:	d1fc      	bne.n	8000832 <APP_SystemClockConfig+0x36>
 8000838:	2401      	movs	r4, #1
 800083a:	4808      	ldr	r0, [pc, #32]	; (800085c <APP_SystemClockConfig+0x60>)
 800083c:	6803      	ldr	r3, [r0, #0]
 800083e:	43a3      	bics	r3, r4
 8000840:	6003      	str	r3, [r0, #0]
 8000842:	6893      	ldr	r3, [r2, #8]
 8000844:	4806      	ldr	r0, [pc, #24]	; (8000860 <APP_SystemClockConfig+0x64>)
 8000846:	4003      	ands	r3, r0
 8000848:	6093      	str	r3, [r2, #8]
 800084a:	0008      	movs	r0, r1
 800084c:	f000 fbe8 	bl	8001020 <LL_SetSystemCoreClock>
 8000850:	bd10      	pop	{r4, pc}
 8000852:	46c0      	nop			; (mov r8, r8)
 8000854:	40021000 	.word	0x40021000
 8000858:	fffff0ff 	.word	0xfffff0ff
 800085c:	40022000 	.word	0x40022000
 8000860:	ffff8fff 	.word	0xffff8fff

08000864 <Go>:
 8000864:	b590      	push	{r4, r7, lr}
 8000866:	b083      	sub	sp, #12
 8000868:	af00      	add	r7, sp, #0
 800086a:	1d38      	adds	r0, r7, #4
 800086c:	f7ff fdca 	bl	8000404 <GetAddressArea>
 8000870:	3801      	subs	r0, #1
 8000872:	b2c0      	uxtb	r0, r0
 8000874:	2400      	movs	r4, #0
 8000876:	2801      	cmp	r0, #1
 8000878:	d903      	bls.n	8000882 <Go+0x1e>
 800087a:	0020      	movs	r0, r4
 800087c:	46bd      	mov	sp, r7
 800087e:	b003      	add	sp, #12
 8000880:	bd90      	pop	{r4, r7, pc}
 8000882:	4b0d      	ldr	r3, [pc, #52]	; (80008b8 <Go+0x54>)
 8000884:	490d      	ldr	r1, [pc, #52]	; (80008bc <Go+0x58>)
 8000886:	6818      	ldr	r0, [r3, #0]
 8000888:	2380      	movs	r3, #128	; 0x80
 800088a:	04c0      	lsls	r0, r0, #19
 800088c:	019b      	lsls	r3, r3, #6
 800088e:	0cc0      	lsrs	r0, r0, #19
 8000890:	4318      	orrs	r0, r3
 8000892:	f7ff ffb3 	bl	80007fc <APP_SystemClockConfig>
 8000896:	687a      	ldr	r2, [r7, #4]
 8000898:	4909      	ldr	r1, [pc, #36]	; (80008c0 <Go+0x5c>)
 800089a:	6813      	ldr	r3, [r2, #0]
 800089c:	3401      	adds	r4, #1
 800089e:	400b      	ands	r3, r1
 80008a0:	2180      	movs	r1, #128	; 0x80
 80008a2:	0589      	lsls	r1, r1, #22
 80008a4:	428b      	cmp	r3, r1
 80008a6:	d1e8      	bne.n	800087a <Go+0x16>
 80008a8:	b662      	cpsie	i
 80008aa:	6813      	ldr	r3, [r2, #0]
 80008ac:	f383 8808 	msr	MSP, r3
 80008b0:	6853      	ldr	r3, [r2, #4]
 80008b2:	4798      	blx	r3
 80008b4:	e7e1      	b.n	800087a <Go+0x16>
 80008b6:	46c0      	nop			; (mov r8, r8)
 80008b8:	1fff0f04 	.word	0x1fff0f04
 80008bc:	007a1200 	.word	0x007a1200
 80008c0:	2ffe0000 	.word	0x2ffe0000

080008c4 <Bootloader_ProtocolDetection>:
 80008c4:	b570      	push	{r4, r5, r6, lr}
 80008c6:	f000 faf9 	bl	8000ebc <USART_ReadByte>
 80008ca:	0004      	movs	r4, r0
 80008cc:	0005      	movs	r5, r0
 80008ce:	f000 faf5 	bl	8000ebc <USART_ReadByte>
 80008d2:	4060      	eors	r0, r4
 80008d4:	b2c0      	uxtb	r0, r0
 80008d6:	28ff      	cmp	r0, #255	; 0xff
 80008d8:	d12c      	bne.n	8000934 <Bootloader_ProtocolDetection+0x70>
 80008da:	2079      	movs	r0, #121	; 0x79
 80008dc:	f000 fae4 	bl	8000ea8 <USART_SendByte>
 80008e0:	2c73      	cmp	r4, #115	; 0x73
 80008e2:	d02b      	beq.n	800093c <Bootloader_ProtocolDetection+0x78>
 80008e4:	d80b      	bhi.n	80008fe <Bootloader_ProtocolDetection+0x3a>
 80008e6:	2c44      	cmp	r4, #68	; 0x44
 80008e8:	d028      	beq.n	800093c <Bootloader_ProtocolDetection+0x78>
 80008ea:	2c63      	cmp	r4, #99	; 0x63
 80008ec:	d026      	beq.n	800093c <Bootloader_ProtocolDetection+0x78>
 80008ee:	2c31      	cmp	r4, #49	; 0x31
 80008f0:	d024      	beq.n	800093c <Bootloader_ProtocolDetection+0x78>
 80008f2:	d900      	bls.n	80008f6 <Bootloader_ProtocolDetection+0x32>
 80008f4:	e071      	b.n	80009da <Bootloader_ProtocolDetection+0x116>
 80008f6:	4a76      	ldr	r2, [pc, #472]	; (8000ad0 <Bootloader_ProtocolDetection+0x20c>)
 80008f8:	00a3      	lsls	r3, r4, #2
 80008fa:	58d3      	ldr	r3, [r2, r3]
 80008fc:	469f      	mov	pc, r3
 80008fe:	23ef      	movs	r3, #239	; 0xef
 8000900:	4023      	ands	r3, r4
 8000902:	2b82      	cmp	r3, #130	; 0x82
 8000904:	d01a      	beq.n	800093c <Bootloader_ProtocolDetection+0x78>
 8000906:	2c82      	cmp	r4, #130	; 0x82
 8000908:	d100      	bne.n	800090c <Bootloader_ProtocolDetection+0x48>
 800090a:	e0cc      	b.n	8000aa6 <Bootloader_ProtocolDetection+0x1e2>
 800090c:	2c92      	cmp	r4, #146	; 0x92
 800090e:	d000      	beq.n	8000912 <Bootloader_ProtocolDetection+0x4e>
 8000910:	e0d9      	b.n	8000ac6 <Bootloader_ProtocolDetection+0x202>
 8000912:	4970      	ldr	r1, [pc, #448]	; (8000ad4 <Bootloader_ProtocolDetection+0x210>)
 8000914:	4b70      	ldr	r3, [pc, #448]	; (8000ad8 <Bootloader_ProtocolDetection+0x214>)
 8000916:	2207      	movs	r2, #7
 8000918:	800b      	strh	r3, [r1, #0]
 800091a:	231f      	movs	r3, #31
 800091c:	486f      	ldr	r0, [pc, #444]	; (8000adc <Bootloader_ProtocolDetection+0x218>)
 800091e:	808b      	strh	r3, [r1, #4]
 8000920:	f000 f95c 	bl	8000bdc <WriteOption>
 8000924:	2380      	movs	r3, #128	; 0x80
 8000926:	4a6e      	ldr	r2, [pc, #440]	; (8000ae0 <Bootloader_ProtocolDetection+0x21c>)
 8000928:	061b      	lsls	r3, r3, #24
 800092a:	6951      	ldr	r1, [r2, #20]
 800092c:	430b      	orrs	r3, r1
 800092e:	6153      	str	r3, [r2, #20]
 8000930:	2801      	cmp	r0, #1
 8000932:	d065      	beq.n	8000a00 <Bootloader_ProtocolDetection+0x13c>
 8000934:	201f      	movs	r0, #31
 8000936:	f000 fab7 	bl	8000ea8 <USART_SendByte>
 800093a:	bd70      	pop	{r4, r5, r6, pc}
 800093c:	4b68      	ldr	r3, [pc, #416]	; (8000ae0 <Bootloader_ProtocolDetection+0x21c>)
 800093e:	691a      	ldr	r2, [r3, #16]
 8000940:	03d2      	lsls	r2, r2, #15
 8000942:	d4f7      	bmi.n	8000934 <Bootloader_ProtocolDetection+0x70>
 8000944:	695a      	ldr	r2, [r3, #20]
 8000946:	2a00      	cmp	r2, #0
 8000948:	da39      	bge.n	80009be <Bootloader_ProtocolDetection+0xfa>
 800094a:	4a66      	ldr	r2, [pc, #408]	; (8000ae4 <Bootloader_ProtocolDetection+0x220>)
 800094c:	2680      	movs	r6, #128	; 0x80
 800094e:	609a      	str	r2, [r3, #8]
 8000950:	4a65      	ldr	r2, [pc, #404]	; (8000ae8 <Bootloader_ProtocolDetection+0x224>)
 8000952:	4866      	ldr	r0, [pc, #408]	; (8000aec <Bootloader_ProtocolDetection+0x228>)
 8000954:	609a      	str	r2, [r3, #8]
 8000956:	22ff      	movs	r2, #255	; 0xff
 8000958:	6801      	ldr	r1, [r0, #0]
 800095a:	0076      	lsls	r6, r6, #1
 800095c:	4011      	ands	r1, r2
 800095e:	5199      	str	r1, [r3, r6]
 8000960:	6801      	ldr	r1, [r0, #0]
 8000962:	3604      	adds	r6, #4
 8000964:	01c9      	lsls	r1, r1, #7
 8000966:	0dc9      	lsrs	r1, r1, #23
 8000968:	5199      	str	r1, [r3, r6]
 800096a:	6801      	ldr	r1, [r0, #0]
 800096c:	2088      	movs	r0, #136	; 0x88
 800096e:	0a09      	lsrs	r1, r1, #8
 8000970:	4011      	ands	r1, r2
 8000972:	0040      	lsls	r0, r0, #1
 8000974:	5019      	str	r1, [r3, r0]
 8000976:	495e      	ldr	r1, [pc, #376]	; (8000af0 <Bootloader_ProtocolDetection+0x22c>)
 8000978:	6808      	ldr	r0, [r1, #0]
 800097a:	4002      	ands	r2, r0
 800097c:	2084      	movs	r0, #132	; 0x84
 800097e:	0040      	lsls	r0, r0, #1
 8000980:	501a      	str	r2, [r3, r0]
 8000982:	680a      	ldr	r2, [r1, #0]
 8000984:	2186      	movs	r1, #134	; 0x86
 8000986:	0152      	lsls	r2, r2, #5
 8000988:	0d52      	lsrs	r2, r2, #21
 800098a:	0049      	lsls	r1, r1, #1
 800098c:	505a      	str	r2, [r3, r1]
 800098e:	4a59      	ldr	r2, [pc, #356]	; (8000af4 <Bootloader_ProtocolDetection+0x230>)
 8000990:	3108      	adds	r1, #8
 8000992:	6812      	ldr	r2, [r2, #0]
 8000994:	3014      	adds	r0, #20
 8000996:	03d2      	lsls	r2, r2, #15
 8000998:	0bd2      	lsrs	r2, r2, #15
 800099a:	505a      	str	r2, [r3, r1]
 800099c:	4a56      	ldr	r2, [pc, #344]	; (8000af8 <Bootloader_ProtocolDetection+0x234>)
 800099e:	3104      	adds	r1, #4
 80009a0:	6812      	ldr	r2, [r2, #0]
 80009a2:	03d2      	lsls	r2, r2, #15
 80009a4:	0bd2      	lsrs	r2, r2, #15
 80009a6:	505a      	str	r2, [r3, r1]
 80009a8:	4954      	ldr	r1, [pc, #336]	; (8000afc <Bootloader_ProtocolDetection+0x238>)
 80009aa:	680a      	ldr	r2, [r1, #0]
 80009ac:	0412      	lsls	r2, r2, #16
 80009ae:	0c12      	lsrs	r2, r2, #16
 80009b0:	501a      	str	r2, [r3, r0]
 80009b2:	680a      	ldr	r2, [r1, #0]
 80009b4:	2190      	movs	r1, #144	; 0x90
 80009b6:	0092      	lsls	r2, r2, #2
 80009b8:	0c92      	lsrs	r2, r2, #18
 80009ba:	0049      	lsls	r1, r1, #1
 80009bc:	505a      	str	r2, [r3, r1]
 80009be:	2c31      	cmp	r4, #49	; 0x31
 80009c0:	d999      	bls.n	80008f6 <Bootloader_ProtocolDetection+0x32>
 80009c2:	2c73      	cmp	r4, #115	; 0x73
 80009c4:	d109      	bne.n	80009da <Bootloader_ProtocolDetection+0x116>
 80009c6:	231f      	movs	r3, #31
 80009c8:	4942      	ldr	r1, [pc, #264]	; (8000ad4 <Bootloader_ProtocolDetection+0x210>)
 80009ca:	2207      	movs	r2, #7
 80009cc:	800b      	strh	r3, [r1, #0]
 80009ce:	3b20      	subs	r3, #32
 80009d0:	808b      	strh	r3, [r1, #4]
 80009d2:	484b      	ldr	r0, [pc, #300]	; (8000b00 <Bootloader_ProtocolDetection+0x23c>)
 80009d4:	f000 f902 	bl	8000bdc <WriteOption>
 80009d8:	e7a4      	b.n	8000924 <Bootloader_ProtocolDetection+0x60>
 80009da:	2c73      	cmp	r4, #115	; 0x73
 80009dc:	d900      	bls.n	80009e0 <Bootloader_ProtocolDetection+0x11c>
 80009de:	e792      	b.n	8000906 <Bootloader_ProtocolDetection+0x42>
 80009e0:	2c44      	cmp	r4, #68	; 0x44
 80009e2:	d068      	beq.n	8000ab6 <Bootloader_ProtocolDetection+0x1f2>
 80009e4:	2c63      	cmp	r4, #99	; 0x63
 80009e6:	d169      	bne.n	8000abc <Bootloader_ProtocolDetection+0x1f8>
 80009e8:	f7ff fec8 	bl	800077c <WriteProtect>
 80009ec:	e79a      	b.n	8000924 <Bootloader_ProtocolDetection+0x60>
 80009ee:	2001      	movs	r0, #1
 80009f0:	f000 fa5a 	bl	8000ea8 <USART_SendByte>
 80009f4:	2004      	movs	r0, #4
 80009f6:	f000 fa57 	bl	8000ea8 <USART_SendByte>
 80009fa:	2040      	movs	r0, #64	; 0x40
 80009fc:	f000 fa54 	bl	8000ea8 <USART_SendByte>
 8000a00:	2079      	movs	r0, #121	; 0x79
 8000a02:	e798      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a04:	2c82      	cmp	r4, #130	; 0x82
 8000a06:	d011      	beq.n	8000a2c <Bootloader_ProtocolDetection+0x168>
 8000a08:	201f      	movs	r0, #31
 8000a0a:	2c82      	cmp	r4, #130	; 0x82
 8000a0c:	d900      	bls.n	8000a10 <Bootloader_ProtocolDetection+0x14c>
 8000a0e:	e792      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a10:	2c73      	cmp	r4, #115	; 0x73
 8000a12:	d00b      	beq.n	8000a2c <Bootloader_ProtocolDetection+0x168>
 8000a14:	d900      	bls.n	8000a18 <Bootloader_ProtocolDetection+0x154>
 8000a16:	e78e      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a18:	2c63      	cmp	r4, #99	; 0x63
 8000a1a:	d007      	beq.n	8000a2c <Bootloader_ProtocolDetection+0x168>
 8000a1c:	d900      	bls.n	8000a20 <Bootloader_ProtocolDetection+0x15c>
 8000a1e:	e78a      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a20:	2c31      	cmp	r4, #49	; 0x31
 8000a22:	d003      	beq.n	8000a2c <Bootloader_ProtocolDetection+0x168>
 8000a24:	201f      	movs	r0, #31
 8000a26:	2c44      	cmp	r4, #68	; 0x44
 8000a28:	d000      	beq.n	8000a2c <Bootloader_ProtocolDetection+0x168>
 8000a2a:	e784      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a2c:	2380      	movs	r3, #128	; 0x80
 8000a2e:	4a2c      	ldr	r2, [pc, #176]	; (8000ae0 <Bootloader_ProtocolDetection+0x21c>)
 8000a30:	061b      	lsls	r3, r3, #24
 8000a32:	6951      	ldr	r1, [r2, #20]
 8000a34:	430b      	orrs	r3, r1
 8000a36:	6153      	str	r3, [r2, #20]
 8000a38:	e77c      	b.n	8000934 <Bootloader_ProtocolDetection+0x70>
 8000a3a:	200c      	movs	r0, #12
 8000a3c:	f000 fa34 	bl	8000ea8 <USART_SendByte>
 8000a40:	2010      	movs	r0, #16
 8000a42:	f000 fa31 	bl	8000ea8 <USART_SendByte>
 8000a46:	4e2f      	ldr	r6, [pc, #188]	; (8000b04 <Bootloader_ProtocolDetection+0x240>)
 8000a48:	1c74      	adds	r4, r6, #1
 8000a4a:	360c      	adds	r6, #12
 8000a4c:	e001      	b.n	8000a52 <Bootloader_ProtocolDetection+0x18e>
 8000a4e:	7825      	ldrb	r5, [r4, #0]
 8000a50:	3401      	adds	r4, #1
 8000a52:	0028      	movs	r0, r5
 8000a54:	f000 fa28 	bl	8000ea8 <USART_SendByte>
 8000a58:	42b4      	cmp	r4, r6
 8000a5a:	d1f8      	bne.n	8000a4e <Bootloader_ProtocolDetection+0x18a>
 8000a5c:	2079      	movs	r0, #121	; 0x79
 8000a5e:	e76a      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a60:	2010      	movs	r0, #16
 8000a62:	f000 fa21 	bl	8000ea8 <USART_SendByte>
 8000a66:	2000      	movs	r0, #0
 8000a68:	f000 fa1e 	bl	8000ea8 <USART_SendByte>
 8000a6c:	2000      	movs	r0, #0
 8000a6e:	f000 fa1b 	bl	8000ea8 <USART_SendByte>
 8000a72:	2079      	movs	r0, #121	; 0x79
 8000a74:	e75f      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a76:	4c24      	ldr	r4, [pc, #144]	; (8000b08 <Bootloader_ProtocolDetection+0x244>)
 8000a78:	2001      	movs	r0, #1
 8000a7a:	f000 fa15 	bl	8000ea8 <USART_SendByte>
 8000a7e:	6820      	ldr	r0, [r4, #0]
 8000a80:	0500      	lsls	r0, r0, #20
 8000a82:	0f00      	lsrs	r0, r0, #28
 8000a84:	f000 fa10 	bl	8000ea8 <USART_SendByte>
 8000a88:	6820      	ldr	r0, [r4, #0]
 8000a8a:	b2c0      	uxtb	r0, r0
 8000a8c:	f000 fa0c 	bl	8000ea8 <USART_SendByte>
 8000a90:	2079      	movs	r0, #121	; 0x79
 8000a92:	e750      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000a94:	f7ff fd4e 	bl	8000534 <ReadMemory>
 8000a98:	e74f      	b.n	800093a <Bootloader_ProtocolDetection+0x76>
 8000a9a:	f7ff fee3 	bl	8000864 <Go>
 8000a9e:	e747      	b.n	8000930 <Bootloader_ProtocolDetection+0x6c>
 8000aa0:	f7ff fdc6 	bl	8000630 <WriteMemory>
 8000aa4:	e73e      	b.n	8000924 <Bootloader_ProtocolDetection+0x60>
 8000aa6:	2355      	movs	r3, #85	; 0x55
 8000aa8:	490a      	ldr	r1, [pc, #40]	; (8000ad4 <Bootloader_ProtocolDetection+0x210>)
 8000aaa:	2200      	movs	r2, #0
 8000aac:	700b      	strb	r3, [r1, #0]
 8000aae:	480b      	ldr	r0, [pc, #44]	; (8000adc <Bootloader_ProtocolDetection+0x218>)
 8000ab0:	f000 f894 	bl	8000bdc <WriteOption>
 8000ab4:	e736      	b.n	8000924 <Bootloader_ProtocolDetection+0x60>
 8000ab6:	f7ff fe05 	bl	80006c4 <ExtendedErase>
 8000aba:	e733      	b.n	8000924 <Bootloader_ProtocolDetection+0x60>
 8000abc:	201f      	movs	r0, #31
 8000abe:	2c63      	cmp	r4, #99	; 0x63
 8000ac0:	d900      	bls.n	8000ac4 <Bootloader_ProtocolDetection+0x200>
 8000ac2:	e738      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000ac4:	e7ae      	b.n	8000a24 <Bootloader_ProtocolDetection+0x160>
 8000ac6:	201f      	movs	r0, #31
 8000ac8:	2c92      	cmp	r4, #146	; 0x92
 8000aca:	d900      	bls.n	8000ace <Bootloader_ProtocolDetection+0x20a>
 8000acc:	e733      	b.n	8000936 <Bootloader_ProtocolDetection+0x72>
 8000ace:	e79b      	b.n	8000a08 <Bootloader_ProtocolDetection+0x144>
 8000ad0:	08001044 	.word	0x08001044
 8000ad4:	20000024 	.word	0x20000024
 8000ad8:	ffffb0aa 	.word	0xffffb0aa
 8000adc:	1fff0e80 	.word	0x1fff0e80
 8000ae0:	40022000 	.word	0x40022000
 8000ae4:	45670123 	.word	0x45670123
 8000ae8:	cdef89ab 	.word	0xcdef89ab
 8000aec:	1fff0f6c 	.word	0x1fff0f6c
 8000af0:	1fff0f70 	.word	0x1fff0f70
 8000af4:	1fff0f74 	.word	0x1fff0f74
 8000af8:	1fff0f78 	.word	0x1fff0f78
 8000afc:	1fff0f7c 	.word	0x1fff0f7c
 8000b00:	1fff0e84 	.word	0x1fff0e84
 8000b04:	0800110c 	.word	0x0800110c
 8000b08:	40015800 	.word	0x40015800

08000b0c <WriteFlash>:
 8000b0c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000b0e:	237f      	movs	r3, #127	; 0x7f
 8000b10:	4645      	mov	r5, r8
 8000b12:	464e      	mov	r6, r9
 8000b14:	46de      	mov	lr, fp
 8000b16:	4657      	mov	r7, sl
 8000b18:	4691      	mov	r9, r2
 8000b1a:	b5e0      	push	{r5, r6, r7, lr}
 8000b1c:	000d      	movs	r5, r1
 8000b1e:	1c51      	adds	r1, r2, #1
 8000b20:	001a      	movs	r2, r3
 8000b22:	400a      	ands	r2, r1
 8000b24:	0004      	movs	r4, r0
 8000b26:	4690      	mov	r8, r2
 8000b28:	420b      	tst	r3, r1
 8000b2a:	d148      	bne.n	8000bbe <WriteFlash+0xb2>
 8000b2c:	001a      	movs	r2, r3
 8000b2e:	4002      	ands	r2, r0
 8000b30:	4203      	tst	r3, r0
 8000b32:	d144      	bne.n	8000bbe <WriteFlash+0xb2>
 8000b34:	4e26      	ldr	r6, [pc, #152]	; (8000bd0 <WriteFlash+0xc4>)
 8000b36:	4b27      	ldr	r3, [pc, #156]	; (8000bd4 <WriteFlash+0xc8>)
 8000b38:	6970      	ldr	r0, [r6, #20]
 8000b3a:	4303      	orrs	r3, r0
 8000b3c:	6173      	str	r3, [r6, #20]
 8000b3e:	09cb      	lsrs	r3, r1, #7
 8000b40:	469b      	mov	fp, r3
 8000b42:	d028      	beq.n	8000b96 <WriteFlash+0x8a>
 8000b44:	2301      	movs	r3, #1
 8000b46:	469a      	mov	sl, r3
 8000b48:	2380      	movs	r3, #128	; 0x80
 8000b4a:	2780      	movs	r7, #128	; 0x80
 8000b4c:	031b      	lsls	r3, r3, #12
 8000b4e:	469c      	mov	ip, r3
 8000b50:	027f      	lsls	r7, r7, #9
 8000b52:	2301      	movs	r3, #1
 8000b54:	e003      	b.n	8000b5e <WriteFlash+0x52>
 8000b56:	2b20      	cmp	r3, #32
 8000b58:	d00d      	beq.n	8000b76 <WriteFlash+0x6a>
 8000b5a:	3301      	adds	r3, #1
 8000b5c:	b29b      	uxth	r3, r3
 8000b5e:	18a8      	adds	r0, r5, r2
 8000b60:	6800      	ldr	r0, [r0, #0]
 8000b62:	18a1      	adds	r1, r4, r2
 8000b64:	6008      	str	r0, [r1, #0]
 8000b66:	3204      	adds	r2, #4
 8000b68:	2b1f      	cmp	r3, #31
 8000b6a:	d1f4      	bne.n	8000b56 <WriteFlash+0x4a>
 8000b6c:	4660      	mov	r0, ip
 8000b6e:	6971      	ldr	r1, [r6, #20]
 8000b70:	4301      	orrs	r1, r0
 8000b72:	6171      	str	r1, [r6, #20]
 8000b74:	e7f1      	b.n	8000b5a <WriteFlash+0x4e>
 8000b76:	6933      	ldr	r3, [r6, #16]
 8000b78:	423b      	tst	r3, r7
 8000b7a:	d1fc      	bne.n	8000b76 <WriteFlash+0x6a>
 8000b7c:	4651      	mov	r1, sl
 8000b7e:	6933      	ldr	r3, [r6, #16]
 8000b80:	4219      	tst	r1, r3
 8000b82:	d023      	beq.n	8000bcc <WriteFlash+0xc0>
 8000b84:	6933      	ldr	r3, [r6, #16]
 8000b86:	430b      	orrs	r3, r1
 8000b88:	6133      	str	r3, [r6, #16]
 8000b8a:	4643      	mov	r3, r8
 8000b8c:	3301      	adds	r3, #1
 8000b8e:	b29b      	uxth	r3, r3
 8000b90:	4698      	mov	r8, r3
 8000b92:	455b      	cmp	r3, fp
 8000b94:	d1dd      	bne.n	8000b52 <WriteFlash+0x46>
 8000b96:	2001      	movs	r0, #1
 8000b98:	4a0d      	ldr	r2, [pc, #52]	; (8000bd0 <WriteFlash+0xc4>)
 8000b9a:	490f      	ldr	r1, [pc, #60]	; (8000bd8 <WriteFlash+0xcc>)
 8000b9c:	6953      	ldr	r3, [r2, #20]
 8000b9e:	1b2d      	subs	r5, r5, r4
 8000ba0:	400b      	ands	r3, r1
 8000ba2:	1c61      	adds	r1, r4, #1
 8000ba4:	4449      	add	r1, r9
 8000ba6:	6153      	str	r3, [r2, #20]
 8000ba8:	b289      	uxth	r1, r1
 8000baa:	e003      	b.n	8000bb4 <WriteFlash+0xa8>
 8000bac:	3404      	adds	r4, #4
 8000bae:	b2a3      	uxth	r3, r4
 8000bb0:	4299      	cmp	r1, r3
 8000bb2:	d005      	beq.n	8000bc0 <WriteFlash+0xb4>
 8000bb4:	192b      	adds	r3, r5, r4
 8000bb6:	6822      	ldr	r2, [r4, #0]
 8000bb8:	681b      	ldr	r3, [r3, #0]
 8000bba:	429a      	cmp	r2, r3
 8000bbc:	d0f6      	beq.n	8000bac <WriteFlash+0xa0>
 8000bbe:	2000      	movs	r0, #0
 8000bc0:	bcf0      	pop	{r4, r5, r6, r7}
 8000bc2:	46bb      	mov	fp, r7
 8000bc4:	46b2      	mov	sl, r6
 8000bc6:	46a9      	mov	r9, r5
 8000bc8:	46a0      	mov	r8, r4
 8000bca:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000bcc:	2000      	movs	r0, #0
 8000bce:	e7e3      	b.n	8000b98 <WriteFlash+0x8c>
 8000bd0:	40022000 	.word	0x40022000
 8000bd4:	01000001 	.word	0x01000001
 8000bd8:	fefffffe 	.word	0xfefffffe

08000bdc <WriteOption>:
 8000bdc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000bde:	4657      	mov	r7, sl
 8000be0:	464e      	mov	r6, r9
 8000be2:	4645      	mov	r5, r8
 8000be4:	46de      	mov	lr, fp
 8000be6:	4b3f      	ldr	r3, [pc, #252]	; (8000ce4 <WriteOption+0x108>)
 8000be8:	b5e0      	push	{r5, r6, r7, lr}
 8000bea:	6a1e      	ldr	r6, [r3, #32]
 8000bec:	6a5d      	ldr	r5, [r3, #36]	; 0x24
 8000bee:	6adc      	ldr	r4, [r3, #44]	; 0x2c
 8000bf0:	695f      	ldr	r7, [r3, #20]
 8000bf2:	007f      	lsls	r7, r7, #1
 8000bf4:	d503      	bpl.n	8000bfe <WriteOption+0x22>
 8000bf6:	4f3c      	ldr	r7, [pc, #240]	; (8000ce8 <WriteOption+0x10c>)
 8000bf8:	60df      	str	r7, [r3, #12]
 8000bfa:	4f3c      	ldr	r7, [pc, #240]	; (8000cec <WriteOption+0x110>)
 8000bfc:	60df      	str	r7, [r3, #12]
 8000bfe:	4f3c      	ldr	r7, [pc, #240]	; (8000cf0 <WriteOption+0x114>)
 8000c00:	2300      	movs	r3, #0
 8000c02:	46b8      	mov	r8, r7
 8000c04:	4f3b      	ldr	r7, [pc, #236]	; (8000cf4 <WriteOption+0x118>)
 8000c06:	b292      	uxth	r2, r2
 8000c08:	46ba      	mov	sl, r7
 8000c0a:	4f3b      	ldr	r7, [pc, #236]	; (8000cf8 <WriteOption+0x11c>)
 8000c0c:	46bc      	mov	ip, r7
 8000c0e:	4f3b      	ldr	r7, [pc, #236]	; (8000cfc <WriteOption+0x120>)
 8000c10:	46b9      	mov	r9, r7
 8000c12:	e00e      	b.n	8000c32 <WriteOption+0x56>
 8000c14:	4548      	cmp	r0, r9
 8000c16:	d04d      	beq.n	8000cb4 <WriteOption+0xd8>
 8000c18:	4f39      	ldr	r7, [pc, #228]	; (8000d00 <WriteOption+0x124>)
 8000c1a:	42b8      	cmp	r0, r7
 8000c1c:	d141      	bne.n	8000ca2 <WriteOption+0xc6>
 8000c1e:	27ff      	movs	r7, #255	; 0xff
 8000c20:	43bd      	bics	r5, r7
 8000c22:	780f      	ldrb	r7, [r1, #0]
 8000c24:	433d      	orrs	r5, r7
 8000c26:	3301      	adds	r3, #1
 8000c28:	b29b      	uxth	r3, r3
 8000c2a:	3001      	adds	r0, #1
 8000c2c:	3101      	adds	r1, #1
 8000c2e:	429a      	cmp	r2, r3
 8000c30:	d312      	bcc.n	8000c58 <WriteOption+0x7c>
 8000c32:	4540      	cmp	r0, r8
 8000c34:	d1ee      	bne.n	8000c14 <WriteOption+0x38>
 8000c36:	27ff      	movs	r7, #255	; 0xff
 8000c38:	43be      	bics	r6, r7
 8000c3a:	780f      	ldrb	r7, [r1, #0]
 8000c3c:	433e      	orrs	r6, r7
 8000c3e:	4550      	cmp	r0, sl
 8000c40:	d1f1      	bne.n	8000c26 <WriteOption+0x4a>
 8000c42:	4667      	mov	r7, ip
 8000c44:	4027      	ands	r7, r4
 8000c46:	780c      	ldrb	r4, [r1, #0]
 8000c48:	3301      	adds	r3, #1
 8000c4a:	0224      	lsls	r4, r4, #8
 8000c4c:	b29b      	uxth	r3, r3
 8000c4e:	433c      	orrs	r4, r7
 8000c50:	3001      	adds	r0, #1
 8000c52:	3101      	adds	r1, #1
 8000c54:	429a      	cmp	r2, r3
 8000c56:	d2ec      	bcs.n	8000c32 <WriteOption+0x56>
 8000c58:	2381      	movs	r3, #129	; 0x81
 8000c5a:	4f22      	ldr	r7, [pc, #136]	; (8000ce4 <WriteOption+0x108>)
 8000c5c:	045b      	lsls	r3, r3, #17
 8000c5e:	623e      	str	r6, [r7, #32]
 8000c60:	627d      	str	r5, [r7, #36]	; 0x24
 8000c62:	62fc      	str	r4, [r7, #44]	; 0x2c
 8000c64:	697a      	ldr	r2, [r7, #20]
 8000c66:	4313      	orrs	r3, r2
 8000c68:	22ff      	movs	r2, #255	; 0xff
 8000c6a:	617b      	str	r3, [r7, #20]
 8000c6c:	4b25      	ldr	r3, [pc, #148]	; (8000d04 <WriteOption+0x128>)
 8000c6e:	601a      	str	r2, [r3, #0]
 8000c70:	2280      	movs	r2, #128	; 0x80
 8000c72:	0252      	lsls	r2, r2, #9
 8000c74:	693b      	ldr	r3, [r7, #16]
 8000c76:	4213      	tst	r3, r2
 8000c78:	d1fc      	bne.n	8000c74 <WriteOption+0x98>
 8000c7a:	2301      	movs	r3, #1
 8000c7c:	001c      	movs	r4, r3
 8000c7e:	6939      	ldr	r1, [r7, #16]
 8000c80:	693a      	ldr	r2, [r7, #16]
 8000c82:	4821      	ldr	r0, [pc, #132]	; (8000d08 <WriteOption+0x12c>)
 8000c84:	431a      	orrs	r2, r3
 8000c86:	613a      	str	r2, [r7, #16]
 8000c88:	697a      	ldr	r2, [r7, #20]
 8000c8a:	400c      	ands	r4, r1
 8000c8c:	4002      	ands	r2, r0
 8000c8e:	617a      	str	r2, [r7, #20]
 8000c90:	420b      	tst	r3, r1
 8000c92:	d11d      	bne.n	8000cd0 <WriteOption+0xf4>
 8000c94:	0020      	movs	r0, r4
 8000c96:	bcf0      	pop	{r4, r5, r6, r7}
 8000c98:	46bb      	mov	fp, r7
 8000c9a:	46b2      	mov	sl, r6
 8000c9c:	46a9      	mov	r9, r5
 8000c9e:	46a0      	mov	r8, r4
 8000ca0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000ca2:	4f1a      	ldr	r7, [pc, #104]	; (8000d0c <WriteOption+0x130>)
 8000ca4:	42b8      	cmp	r0, r7
 8000ca6:	d10b      	bne.n	8000cc0 <WriteOption+0xe4>
 8000ca8:	4667      	mov	r7, ip
 8000caa:	402f      	ands	r7, r5
 8000cac:	780d      	ldrb	r5, [r1, #0]
 8000cae:	022d      	lsls	r5, r5, #8
 8000cb0:	433d      	orrs	r5, r7
 8000cb2:	e7b8      	b.n	8000c26 <WriteOption+0x4a>
 8000cb4:	4667      	mov	r7, ip
 8000cb6:	4037      	ands	r7, r6
 8000cb8:	780e      	ldrb	r6, [r1, #0]
 8000cba:	0236      	lsls	r6, r6, #8
 8000cbc:	433e      	orrs	r6, r7
 8000cbe:	e7be      	b.n	8000c3e <WriteOption+0x62>
 8000cc0:	4f13      	ldr	r7, [pc, #76]	; (8000d10 <WriteOption+0x134>)
 8000cc2:	42b8      	cmp	r0, r7
 8000cc4:	d1bb      	bne.n	8000c3e <WriteOption+0x62>
 8000cc6:	27ff      	movs	r7, #255	; 0xff
 8000cc8:	43bc      	bics	r4, r7
 8000cca:	780f      	ldrb	r7, [r1, #0]
 8000ccc:	433c      	orrs	r4, r7
 8000cce:	e7aa      	b.n	8000c26 <WriteOption+0x4a>
 8000cd0:	2079      	movs	r0, #121	; 0x79
 8000cd2:	f000 f8e9 	bl	8000ea8 <USART_SendByte>
 8000cd6:	2380      	movs	r3, #128	; 0x80
 8000cd8:	697a      	ldr	r2, [r7, #20]
 8000cda:	051b      	lsls	r3, r3, #20
 8000cdc:	4313      	orrs	r3, r2
 8000cde:	617b      	str	r3, [r7, #20]
 8000ce0:	e7d8      	b.n	8000c94 <WriteOption+0xb8>
 8000ce2:	46c0      	nop			; (mov r8, r8)
 8000ce4:	40022000 	.word	0x40022000
 8000ce8:	08192a3b 	.word	0x08192a3b
 8000cec:	4c5d6e7f 	.word	0x4c5d6e7f
 8000cf0:	1fff0e80 	.word	0x1fff0e80
 8000cf4:	1fff0e8d 	.word	0x1fff0e8d
 8000cf8:	ffff00ff 	.word	0xffff00ff
 8000cfc:	1fff0e81 	.word	0x1fff0e81
 8000d00:	1fff0e84 	.word	0x1fff0e84
 8000d04:	40022080 	.word	0x40022080
 8000d08:	fefdffff 	.word	0xfefdffff
 8000d0c:	1fff0e85 	.word	0x1fff0e85
 8000d10:	1fff0e8c 	.word	0x1fff0e8c

08000d14 <PageErase>:
 8000d14:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000d16:	4645      	mov	r5, r8
 8000d18:	46de      	mov	lr, fp
 8000d1a:	4657      	mov	r7, sl
 8000d1c:	464e      	mov	r6, r9
 8000d1e:	b5e0      	push	{r5, r6, r7, lr}
 8000d20:	0015      	movs	r5, r2
 8000d22:	4a2c      	ldr	r2, [pc, #176]	; (8000dd4 <PageErase+0xc0>)
 8000d24:	b083      	sub	sp, #12
 8000d26:	9101      	str	r1, [sp, #4]
 8000d28:	4b2b      	ldr	r3, [pc, #172]	; (8000dd8 <PageErase+0xc4>)
 8000d2a:	6951      	ldr	r1, [r2, #20]
 8000d2c:	4683      	mov	fp, r0
 8000d2e:	430b      	orrs	r3, r1
 8000d30:	6153      	str	r3, [r2, #20]
 8000d32:	2301      	movs	r3, #1
 8000d34:	469a      	mov	sl, r3
 8000d36:	4b29      	ldr	r3, [pc, #164]	; (8000ddc <PageErase+0xc8>)
 8000d38:	4698      	mov	r8, r3
 8000d3a:	2301      	movs	r3, #1
 8000d3c:	425b      	negs	r3, r3
 8000d3e:	4699      	mov	r9, r3
 8000d40:	4653      	mov	r3, sl
 8000d42:	3b01      	subs	r3, #1
 8000d44:	b2db      	uxtb	r3, r3
 8000d46:	2d00      	cmp	r5, #0
 8000d48:	d02c      	beq.n	8000da4 <PageErase+0x90>
 8000d4a:	005e      	lsls	r6, r3, #1
 8000d4c:	2400      	movs	r4, #0
 8000d4e:	2707      	movs	r7, #7
 8000d50:	445e      	add	r6, fp
 8000d52:	e003      	b.n	8000d5c <PageErase+0x48>
 8000d54:	3401      	adds	r4, #1
 8000d56:	b2e3      	uxtb	r3, r4
 8000d58:	429d      	cmp	r5, r3
 8000d5a:	d923      	bls.n	8000da4 <PageErase+0x90>
 8000d5c:	f000 f8ea 	bl	8000f34 <WDG_Refresh>
 8000d60:	4642      	mov	r2, r8
 8000d62:	8833      	ldrh	r3, [r6, #0]
 8000d64:	7812      	ldrb	r2, [r2, #0]
 8000d66:	436b      	muls	r3, r5
 8000d68:	403a      	ands	r2, r7
 8000d6a:	191b      	adds	r3, r3, r4
 8000d6c:	3201      	adds	r2, #1
 8000d6e:	01db      	lsls	r3, r3, #7
 8000d70:	0352      	lsls	r2, r2, #13
 8000d72:	4293      	cmp	r3, r2
 8000d74:	d2ee      	bcs.n	8000d54 <PageErase+0x40>
 8000d76:	2280      	movs	r2, #128	; 0x80
 8000d78:	0512      	lsls	r2, r2, #20
 8000d7a:	4694      	mov	ip, r2
 8000d7c:	464a      	mov	r2, r9
 8000d7e:	2180      	movs	r1, #128	; 0x80
 8000d80:	4463      	add	r3, ip
 8000d82:	601a      	str	r2, [r3, #0]
 8000d84:	4a13      	ldr	r2, [pc, #76]	; (8000dd4 <PageErase+0xc0>)
 8000d86:	0249      	lsls	r1, r1, #9
 8000d88:	6913      	ldr	r3, [r2, #16]
 8000d8a:	420b      	tst	r3, r1
 8000d8c:	d1fc      	bne.n	8000d88 <PageErase+0x74>
 8000d8e:	2101      	movs	r1, #1
 8000d90:	6913      	ldr	r3, [r2, #16]
 8000d92:	4219      	tst	r1, r3
 8000d94:	d00e      	beq.n	8000db4 <PageErase+0xa0>
 8000d96:	6913      	ldr	r3, [r2, #16]
 8000d98:	3401      	adds	r4, #1
 8000d9a:	430b      	orrs	r3, r1
 8000d9c:	6113      	str	r3, [r2, #16]
 8000d9e:	b2e3      	uxtb	r3, r4
 8000da0:	429d      	cmp	r5, r3
 8000da2:	d8db      	bhi.n	8000d5c <PageErase+0x48>
 8000da4:	9b01      	ldr	r3, [sp, #4]
 8000da6:	4553      	cmp	r3, sl
 8000da8:	d311      	bcc.n	8000dce <PageErase+0xba>
 8000daa:	4653      	mov	r3, sl
 8000dac:	3301      	adds	r3, #1
 8000dae:	b2db      	uxtb	r3, r3
 8000db0:	469a      	mov	sl, r3
 8000db2:	e7c5      	b.n	8000d40 <PageErase+0x2c>
 8000db4:	2000      	movs	r0, #0
 8000db6:	4a07      	ldr	r2, [pc, #28]	; (8000dd4 <PageErase+0xc0>)
 8000db8:	4909      	ldr	r1, [pc, #36]	; (8000de0 <PageErase+0xcc>)
 8000dba:	6953      	ldr	r3, [r2, #20]
 8000dbc:	400b      	ands	r3, r1
 8000dbe:	6153      	str	r3, [r2, #20]
 8000dc0:	b003      	add	sp, #12
 8000dc2:	bcf0      	pop	{r4, r5, r6, r7}
 8000dc4:	46bb      	mov	fp, r7
 8000dc6:	46b2      	mov	sl, r6
 8000dc8:	46a9      	mov	r9, r5
 8000dca:	46a0      	mov	r8, r4
 8000dcc:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000dce:	2001      	movs	r0, #1
 8000dd0:	e7f1      	b.n	8000db6 <PageErase+0xa2>
 8000dd2:	46c0      	nop			; (mov r8, r8)
 8000dd4:	40022000 	.word	0x40022000
 8000dd8:	01000002 	.word	0x01000002
 8000ddc:	1fff0ffc 	.word	0x1fff0ffc
 8000de0:	fefffffd 	.word	0xfefffffd

08000de4 <SectorErase>:
 8000de4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000de6:	4647      	mov	r7, r8
 8000de8:	46ce      	mov	lr, r9
 8000dea:	4c19      	ldr	r4, [pc, #100]	; (8000e50 <SectorErase+0x6c>)
 8000dec:	4b19      	ldr	r3, [pc, #100]	; (8000e54 <SectorErase+0x70>)
 8000dee:	6962      	ldr	r2, [r4, #20]
 8000df0:	b580      	push	{r7, lr}
 8000df2:	4313      	orrs	r3, r2
 8000df4:	6163      	str	r3, [r4, #20]
 8000df6:	2301      	movs	r3, #1
 8000df8:	2580      	movs	r5, #128	; 0x80
 8000dfa:	425b      	negs	r3, r3
 8000dfc:	0007      	movs	r7, r0
 8000dfe:	4688      	mov	r8, r1
 8000e00:	2600      	movs	r6, #0
 8000e02:	4699      	mov	r9, r3
 8000e04:	026d      	lsls	r5, r5, #9
 8000e06:	f000 f895 	bl	8000f34 <WDG_Refresh>
 8000e0a:	2280      	movs	r2, #128	; 0x80
 8000e0c:	0512      	lsls	r2, r2, #20
 8000e0e:	4694      	mov	ip, r2
 8000e10:	464a      	mov	r2, r9
 8000e12:	0073      	lsls	r3, r6, #1
 8000e14:	5bdb      	ldrh	r3, [r3, r7]
 8000e16:	031b      	lsls	r3, r3, #12
 8000e18:	4463      	add	r3, ip
 8000e1a:	601a      	str	r2, [r3, #0]
 8000e1c:	6923      	ldr	r3, [r4, #16]
 8000e1e:	422b      	tst	r3, r5
 8000e20:	d1fc      	bne.n	8000e1c <SectorErase+0x38>
 8000e22:	2201      	movs	r2, #1
 8000e24:	6923      	ldr	r3, [r4, #16]
 8000e26:	421a      	tst	r2, r3
 8000e28:	d010      	beq.n	8000e4c <SectorErase+0x68>
 8000e2a:	6923      	ldr	r3, [r4, #16]
 8000e2c:	3601      	adds	r6, #1
 8000e2e:	4313      	orrs	r3, r2
 8000e30:	b2f6      	uxtb	r6, r6
 8000e32:	6123      	str	r3, [r4, #16]
 8000e34:	45b0      	cmp	r8, r6
 8000e36:	d2e6      	bcs.n	8000e06 <SectorErase+0x22>
 8000e38:	2001      	movs	r0, #1
 8000e3a:	4a05      	ldr	r2, [pc, #20]	; (8000e50 <SectorErase+0x6c>)
 8000e3c:	4906      	ldr	r1, [pc, #24]	; (8000e58 <SectorErase+0x74>)
 8000e3e:	6953      	ldr	r3, [r2, #20]
 8000e40:	400b      	ands	r3, r1
 8000e42:	6153      	str	r3, [r2, #20]
 8000e44:	bcc0      	pop	{r6, r7}
 8000e46:	46b9      	mov	r9, r7
 8000e48:	46b0      	mov	r8, r6
 8000e4a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e4c:	2000      	movs	r0, #0
 8000e4e:	e7f4      	b.n	8000e3a <SectorErase+0x56>
 8000e50:	40022000 	.word	0x40022000
 8000e54:	01000800 	.word	0x01000800
 8000e58:	fefff7ff 	.word	0xfefff7ff

08000e5c <MassErase>:
 8000e5c:	b570      	push	{r4, r5, r6, lr}
 8000e5e:	2607      	movs	r6, #7
 8000e60:	4b0e      	ldr	r3, [pc, #56]	; (8000e9c <MassErase+0x40>)
 8000e62:	b082      	sub	sp, #8
 8000e64:	781b      	ldrb	r3, [r3, #0]
 8000e66:	4d0e      	ldr	r5, [pc, #56]	; (8000ea0 <MassErase+0x44>)
 8000e68:	401e      	ands	r6, r3
 8000e6a:	4b0e      	ldr	r3, [pc, #56]	; (8000ea4 <MassErase+0x48>)
 8000e6c:	0376      	lsls	r6, r6, #13
 8000e6e:	469c      	mov	ip, r3
 8000e70:	466b      	mov	r3, sp
 8000e72:	4466      	add	r6, ip
 8000e74:	1d9c      	adds	r4, r3, #6
 8000e76:	23f8      	movs	r3, #248	; 0xf8
 8000e78:	061b      	lsls	r3, r3, #24
 8000e7a:	18eb      	adds	r3, r5, r3
 8000e7c:	0b1b      	lsrs	r3, r3, #12
 8000e7e:	2100      	movs	r1, #0
 8000e80:	0020      	movs	r0, r4
 8000e82:	8023      	strh	r3, [r4, #0]
 8000e84:	f7ff ffae 	bl	8000de4 <SectorErase>
 8000e88:	2801      	cmp	r0, #1
 8000e8a:	d105      	bne.n	8000e98 <MassErase+0x3c>
 8000e8c:	2380      	movs	r3, #128	; 0x80
 8000e8e:	015b      	lsls	r3, r3, #5
 8000e90:	469c      	mov	ip, r3
 8000e92:	4465      	add	r5, ip
 8000e94:	42ae      	cmp	r6, r5
 8000e96:	d8ee      	bhi.n	8000e76 <MassErase+0x1a>
 8000e98:	b002      	add	sp, #8
 8000e9a:	bd70      	pop	{r4, r5, r6, pc}
 8000e9c:	1fff0ffc 	.word	0x1fff0ffc
 8000ea0:	08001000 	.word	0x08001000
 8000ea4:	08002000 	.word	0x08002000

08000ea8 <USART_SendByte>:
 8000ea8:	2140      	movs	r1, #64	; 0x40
 8000eaa:	4a03      	ldr	r2, [pc, #12]	; (8000eb8 <USART_SendByte+0x10>)
 8000eac:	6813      	ldr	r3, [r2, #0]
 8000eae:	6050      	str	r0, [r2, #4]
 8000eb0:	6813      	ldr	r3, [r2, #0]
 8000eb2:	4219      	tst	r1, r3
 8000eb4:	d0fc      	beq.n	8000eb0 <USART_SendByte+0x8>
 8000eb6:	4770      	bx	lr
 8000eb8:	40013800 	.word	0x40013800

08000ebc <USART_ReadByte>:
 8000ebc:	b570      	push	{r4, r5, r6, lr}
 8000ebe:	4c07      	ldr	r4, [pc, #28]	; (8000edc <USART_ReadByte+0x20>)
 8000ec0:	6823      	ldr	r3, [r4, #0]
 8000ec2:	069b      	lsls	r3, r3, #26
 8000ec4:	d405      	bmi.n	8000ed2 <USART_ReadByte+0x16>
 8000ec6:	2520      	movs	r5, #32
 8000ec8:	f000 f834 	bl	8000f34 <WDG_Refresh>
 8000ecc:	6823      	ldr	r3, [r4, #0]
 8000ece:	421d      	tst	r5, r3
 8000ed0:	d0fa      	beq.n	8000ec8 <USART_ReadByte+0xc>
 8000ed2:	4b02      	ldr	r3, [pc, #8]	; (8000edc <USART_ReadByte+0x20>)
 8000ed4:	6858      	ldr	r0, [r3, #4]
 8000ed6:	b2c0      	uxtb	r0, r0
 8000ed8:	bd70      	pop	{r4, r5, r6, pc}
 8000eda:	46c0      	nop			; (mov r8, r8)
 8000edc:	40013800 	.word	0x40013800

08000ee0 <WDG_Init>:
 8000ee0:	4b0e      	ldr	r3, [pc, #56]	; (8000f1c <WDG_Init+0x3c>)
 8000ee2:	6a1b      	ldr	r3, [r3, #32]
 8000ee4:	049b      	lsls	r3, r3, #18
 8000ee6:	d405      	bmi.n	8000ef4 <WDG_Init+0x14>
 8000ee8:	23c0      	movs	r3, #192	; 0xc0
 8000eea:	4a0d      	ldr	r2, [pc, #52]	; (8000f20 <WDG_Init+0x40>)
 8000eec:	005b      	lsls	r3, r3, #1
 8000eee:	6851      	ldr	r1, [r2, #4]
 8000ef0:	430b      	orrs	r3, r1
 8000ef2:	6053      	str	r3, [r2, #4]
 8000ef4:	4b09      	ldr	r3, [pc, #36]	; (8000f1c <WDG_Init+0x3c>)
 8000ef6:	6a1b      	ldr	r3, [r3, #32]
 8000ef8:	04db      	lsls	r3, r3, #19
 8000efa:	d406      	bmi.n	8000f0a <WDG_Init+0x2a>
 8000efc:	4b09      	ldr	r3, [pc, #36]	; (8000f24 <WDG_Init+0x44>)
 8000efe:	4a0a      	ldr	r2, [pc, #40]	; (8000f28 <WDG_Init+0x48>)
 8000f00:	601a      	str	r2, [r3, #0]
 8000f02:	2207      	movs	r2, #7
 8000f04:	605a      	str	r2, [r3, #4]
 8000f06:	4a09      	ldr	r2, [pc, #36]	; (8000f2c <WDG_Init+0x4c>)
 8000f08:	609a      	str	r2, [r3, #8]
 8000f0a:	217f      	movs	r1, #127	; 0x7f
 8000f0c:	4a04      	ldr	r2, [pc, #16]	; (8000f20 <WDG_Init+0x40>)
 8000f0e:	6813      	ldr	r3, [r2, #0]
 8000f10:	430b      	orrs	r3, r1
 8000f12:	6013      	str	r3, [r2, #0]
 8000f14:	4b03      	ldr	r3, [pc, #12]	; (8000f24 <WDG_Init+0x44>)
 8000f16:	4a06      	ldr	r2, [pc, #24]	; (8000f30 <WDG_Init+0x50>)
 8000f18:	601a      	str	r2, [r3, #0]
 8000f1a:	4770      	bx	lr
 8000f1c:	40022000 	.word	0x40022000
 8000f20:	40002c00 	.word	0x40002c00
 8000f24:	40003000 	.word	0x40003000
 8000f28:	00005555 	.word	0x00005555
 8000f2c:	00000fff 	.word	0x00000fff
 8000f30:	0000aaaa 	.word	0x0000aaaa

08000f34 <WDG_Refresh>:
 8000f34:	217f      	movs	r1, #127	; 0x7f
 8000f36:	4a04      	ldr	r2, [pc, #16]	; (8000f48 <WDG_Refresh+0x14>)
 8000f38:	6813      	ldr	r3, [r2, #0]
 8000f3a:	430b      	orrs	r3, r1
 8000f3c:	6013      	str	r3, [r2, #0]
 8000f3e:	4b03      	ldr	r3, [pc, #12]	; (8000f4c <WDG_Refresh+0x18>)
 8000f40:	4a03      	ldr	r2, [pc, #12]	; (8000f50 <WDG_Refresh+0x1c>)
 8000f42:	601a      	str	r2, [r3, #0]
 8000f44:	4770      	bx	lr
 8000f46:	46c0      	nop			; (mov r8, r8)
 8000f48:	40002c00 	.word	0x40002c00
 8000f4c:	40003000 	.word	0x40003000
 8000f50:	0000aaaa 	.word	0x0000aaaa

08000f54 <NMI_Handler>:
 8000f54:	4770      	bx	lr
 8000f56:	46c0      	nop			; (mov r8, r8)

08000f58 <HardFault_Handler>:
 8000f58:	e7fe      	b.n	8000f58 <HardFault_Handler>
 8000f5a:	46c0      	nop			; (mov r8, r8)

08000f5c <SVC_Handler>:
 8000f5c:	4770      	bx	lr
 8000f5e:	46c0      	nop			; (mov r8, r8)

08000f60 <PendSV_Handler>:
 8000f60:	4770      	bx	lr
 8000f62:	46c0      	nop			; (mov r8, r8)

08000f64 <SysTick_Handler>:
 8000f64:	4770      	bx	lr
 8000f66:	46c0      	nop			; (mov r8, r8)

08000f68 <SystemInit>:
 8000f68:	4907      	ldr	r1, [pc, #28]	; (8000f88 <SystemInit+0x20>)
 8000f6a:	4a08      	ldr	r2, [pc, #32]	; (8000f8c <SystemInit+0x24>)
 8000f6c:	684b      	ldr	r3, [r1, #4]
 8000f6e:	6812      	ldr	r2, [r2, #0]
 8000f70:	0c1b      	lsrs	r3, r3, #16
 8000f72:	041b      	lsls	r3, r3, #16
 8000f74:	4313      	orrs	r3, r2
 8000f76:	2280      	movs	r2, #128	; 0x80
 8000f78:	0192      	lsls	r2, r2, #6
 8000f7a:	4313      	orrs	r3, r2
 8000f7c:	2280      	movs	r2, #128	; 0x80
 8000f7e:	604b      	str	r3, [r1, #4]
 8000f80:	4b03      	ldr	r3, [pc, #12]	; (8000f90 <SystemInit+0x28>)
 8000f82:	0512      	lsls	r2, r2, #20
 8000f84:	609a      	str	r2, [r3, #8]
 8000f86:	4770      	bx	lr
 8000f88:	40021000 	.word	0x40021000
 8000f8c:	1fff0f04 	.word	0x1fff0f04
 8000f90:	e000ed00 	.word	0xe000ed00

08000f94 <BSP_PB_Init>:
 8000f94:	b510      	push	{r4, lr}
 8000f96:	b082      	sub	sp, #8
 8000f98:	2800      	cmp	r0, #0
 8000f9a:	d108      	bne.n	8000fae <BSP_PB_Init+0x1a>
 8000f9c:	2301      	movs	r3, #1
 8000f9e:	4a16      	ldr	r2, [pc, #88]	; (8000ff8 <BSP_PB_Init+0x64>)
 8000fa0:	6b54      	ldr	r4, [r2, #52]	; 0x34
 8000fa2:	431c      	orrs	r4, r3
 8000fa4:	6354      	str	r4, [r2, #52]	; 0x34
 8000fa6:	6b52      	ldr	r2, [r2, #52]	; 0x34
 8000fa8:	4013      	ands	r3, r2
 8000faa:	9301      	str	r3, [sp, #4]
 8000fac:	9b01      	ldr	r3, [sp, #4]
 8000fae:	4b13      	ldr	r3, [pc, #76]	; (8000ffc <BSP_PB_Init+0x68>)
 8000fb0:	0080      	lsls	r0, r0, #2
 8000fb2:	58c3      	ldr	r3, [r0, r3]
 8000fb4:	4c12      	ldr	r4, [pc, #72]	; (8001000 <BSP_PB_Init+0x6c>)
 8000fb6:	6818      	ldr	r0, [r3, #0]
 8000fb8:	4020      	ands	r0, r4
 8000fba:	6018      	str	r0, [r3, #0]
 8000fbc:	68da      	ldr	r2, [r3, #12]
 8000fbe:	4022      	ands	r2, r4
 8000fc0:	60da      	str	r2, [r3, #12]
 8000fc2:	2901      	cmp	r1, #1
 8000fc4:	d001      	beq.n	8000fca <BSP_PB_Init+0x36>
 8000fc6:	b002      	add	sp, #8
 8000fc8:	bd10      	pop	{r4, pc}
 8000fca:	2280      	movs	r2, #128	; 0x80
 8000fcc:	4b0d      	ldr	r3, [pc, #52]	; (8001004 <BSP_PB_Init+0x70>)
 8000fce:	317f      	adds	r1, #127	; 0x7f
 8000fd0:	5858      	ldr	r0, [r3, r1]
 8000fd2:	0152      	lsls	r2, r2, #5
 8000fd4:	4310      	orrs	r0, r2
 8000fd6:	24c1      	movs	r4, #193	; 0xc1
 8000fd8:	5058      	str	r0, [r3, r1]
 8000fda:	6858      	ldr	r0, [r3, #4]
 8000fdc:	00a4      	lsls	r4, r4, #2
 8000fde:	4302      	orrs	r2, r0
 8000fe0:	20c0      	movs	r0, #192	; 0xc0
 8000fe2:	605a      	str	r2, [r3, #4]
 8000fe4:	4a08      	ldr	r2, [pc, #32]	; (8001008 <BSP_PB_Init+0x74>)
 8000fe6:	0600      	lsls	r0, r0, #24
 8000fe8:	5913      	ldr	r3, [r2, r4]
 8000fea:	021b      	lsls	r3, r3, #8
 8000fec:	0a1b      	lsrs	r3, r3, #8
 8000fee:	4303      	orrs	r3, r0
 8000ff0:	5113      	str	r3, [r2, r4]
 8000ff2:	6011      	str	r1, [r2, #0]
 8000ff4:	e7e7      	b.n	8000fc6 <BSP_PB_Init+0x32>
 8000ff6:	46c0      	nop			; (mov r8, r8)
 8000ff8:	40021000 	.word	0x40021000
 8000ffc:	20000004 	.word	0x20000004
 8001000:	fcffffff 	.word	0xfcffffff
 8001004:	40021800 	.word	0x40021800
 8001008:	e000e100 	.word	0xe000e100

0800100c <BSP_PB_GetState>:
 800100c:	4b03      	ldr	r3, [pc, #12]	; (800101c <BSP_PB_GetState+0x10>)
 800100e:	0080      	lsls	r0, r0, #2
 8001010:	58c3      	ldr	r3, [r0, r3]
 8001012:	6918      	ldr	r0, [r3, #16]
 8001014:	04c0      	lsls	r0, r0, #19
 8001016:	0fc0      	lsrs	r0, r0, #31
 8001018:	4770      	bx	lr
 800101a:	46c0      	nop			; (mov r8, r8)
 800101c:	20000004 	.word	0x20000004

08001020 <LL_SetSystemCoreClock>:
 8001020:	4b01      	ldr	r3, [pc, #4]	; (8001028 <LL_SetSystemCoreClock+0x8>)
 8001022:	6018      	str	r0, [r3, #0]
 8001024:	4770      	bx	lr
 8001026:	46c0      	nop			; (mov r8, r8)
 8001028:	20000000 	.word	0x20000000

0800102c <_init>:
 800102c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800102e:	46c0      	nop			; (mov r8, r8)
 8001030:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001032:	bc08      	pop	{r3}
 8001034:	469e      	mov	lr, r3
 8001036:	4770      	bx	lr

08001038 <_fini>:
 8001038:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800103a:	46c0      	nop			; (mov r8, r8)
 800103c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800103e:	bc08      	pop	{r3}
 8001040:	469e      	mov	lr, r3
 8001042:	4770      	bx	lr
