
.MEMORYMAP
    DEFAULTSLOT 0
    SLOTSIZE 1173
    SLOT 0 0x0000
.ENDME

.ROMBANKMAP
    BANKSTOTAL 1
    BANKSIZE 1173
    BANKS 1
.ENDRO

.stringmaptable symbols "symbols.tbl"

.BANK 0 SLOT 0
.ORGA 0x0000

ENTRY_POINT:
   jmp @01d8

@TEXT:
   .stringmap symbols,"{CLS}{HOME}{LF}{LF}{LF}{LF}{LF}{LF}{LF}{LF}{LF}{LF}{LF}"
   .stringmap symbols,"__________**_ЖИЗНЬ_С_РАЗНОТИПНЫМИ_ТОЧКАМИ_**{LF}{CR}{CR}{LF}"
   .stringmap symbols,"{CR}{LF}ПРАВИЛА:{CR}{LF}"
   .stringmap symbols,"НА_ЭКРАНЕ_ВЫСВЕЧИВАЕТСЯ_МАРКЕР_'@',КОТОРЫЙ_МОЖНО{CR}{LF}"
   .stringmap symbols,"ПЕРЕМЕЩАТЬ_КЛАВИШАМИ_УПРАВЛЕНИЯ_КУРСОРОМ.{CR}{LF}"
   .stringmap symbols,"<:>_ИЛИ_<0>_--_УСТАНОВИТЬ_ТОЧКУ_1-ГО_ИЛИ_2-ГО_ТИПОВ.{CR}{LF}"
   .stringmap symbols,"<ПРОБЕЛ>_--_СТЕРЕТЬ_ТОЧКУ.{CR}{LF}"
   .stringmap symbols,"<N>_--_УСТАНОВИТЬ_НАЧАЛО_ПРОСМАТРИВАЕМОЙ_ЗОНЫ.{CR}{LF}"
   .stringmap symbols,"<К>_--_УСТАНОВИТЬ_КОНЕЦ_ПРОСМАТРИВАЕМОЙ_ЗОНЫ.{CR}{LF}"
   .stringmap symbols,"<F1>_--_ЗАПУСК_ЭВОЛЮЦИИ.{CR}{LF}"
   .stringmap symbols,"<F2>_--_ОСТАНОВ_ЭВОЛЮЦИИ.{CR}{LF}"
   .stringmap symbols,"<РУС/ЛАТ>_--_ПРИОСТАНОВКА.{CR}{LF}"
   .stringmap symbols,"НАЖМИТЕ_НА_ЛЮБУЮ_КЛАВИШУ$"

@01c4:
   .word 0x7928
@01c6:
   .word 0xFFBD
   nop
@01c9:
   .word 0x7928
   nop
   nop
   nop
@01ce:
   .word 0x7772
   nop
   nop
   nop
@01d3:
   .word 0x7FA1
   nop
   nop
   nop

@01d8:
   lxi h,@TEXT
   call 0xf818
@01de:
   call 0xf812
   jz @01de
   mvi c,0x1f
   call 0xf809
   lxi h,0x77c2
   shld @01c4
   shld @01c9
   mvi c,0x00
   mvi d,0x01
   mvi e,0x00
   lhld @01c4
   mvi m,0x17
@01fd:
   lhld @01c4
   mov m,c
   lhld @01c9
   mov c,m
   shld @01c4
   mvi m,0x17
@020a:
   call 0xf803
   mvi b,0xff
   cmp b
   jz @020a
   mvi b,0x08
   cmp b
   jnz @0223
   lhld @01c9
   dcx h
   shld @01c9
   jmp @01fd
@0223:
   mvi b,0x18
   cmp b
   jnz @0233
   lhld @01c9
   inx h
   shld @01c9
   jmp @01fd
@0233:
   mvi b,0x1a
   cmp b
   jnz @0248
   lhld @01c9
   push d
   lxi d,0x004e
   dad d
   shld @01c9
   pop d
   jmp @01fd
@0248:
   mvi b,0x19
   cmp b
   jnz @025d
   lhld @01c9
   push d
   lxi d,0xffb2
   dad d
   shld @01c9
   pop d
   jmp @01fd
@025d:
   mvi b,0x30
   cmp b
   jnz @026f
   mvi c,0x30
   lhld @01c9
   inx h
   shld @01c9
   jmp @01fd
@026f:
   mvi b,0x3a
   cmp b
   jnz @0281
   mvi c,0x2a
   lhld @01c9
   inx h
   shld @01c9
   jmp @01fd
@0281:
   mvi b,0x20
   cmp b
   jnz @0293
   mvi c,0x00
   lhld @01c9
   inx h
   shld @01c9
   jmp @01fd
@0293:
   mvi b,0x4e
   cmp b
   jnz @02a8
   mvi c,0x0e
   lhld @01c9
   shld @01ce
   inx h
   shld @01c9
   jmp @01fd
@02a8:
   mvi b,0x4b
   cmp b
   jnz @02bd
   mvi c,0x1d
   lhld @01c9
   shld @01d3
   inx h
   shld @01c9
   jmp @01fd
@02bd:
   mvi b,0x00
   cmp b
   jz @02f2
   mvi b,0x7f
   cmp b
   jz @0487
   mvi b,0x0c
   cmp b
   jnz @02d8
   lhld @01ce
   shld @01c9
   jmp @01fd
@02d8:
   mvi b,0x1b
   cmp b
   jnz @02e7
   lhld @01d3
   shld @01c9
   jmp @01fd
@02e7:
   mvi b,0x52
   cmp b
   jnz @01fd
   mvi d,0x00
   jmp @01fd
@02f2:
   lhld @01c9
   mvi m,0x00
   lhld @01d3
   mvi m,0x00
   lhld @01ce
   mvi m,0x00
   push d
   push b
   lhld @01ce
   mov a,h
   cma
   mov h,a
   mov a,l
   cma
   mov l,a
   inx h
   xchg
   lhld @01d3
   dad d
   lxi d,0xffb2
@0315:
   mov b,h
   mov c,l
   dad d
   jc @0315
   mov h,b
   mov l,c
   shld @01c4
   lhld @01ce
   mvi b,0x00
@0325:
   call @03bc
   push b
   mov a,m
   mvi b,0x30
   cmp b
   jz @0355
   mvi b,0x2a
   cmp b
   jz @0368
   mov a,d
   add e
   mvi b,0x03
   cmp b
   jnz @0378
   mov a,d
   mvi b,0x02
   cmp b
   jnz @034a
@0345:
   mvi m,0x2b
   jmp @0378
@034a:
   mvi b,0x03
   cmp b
   jz @0345
   mvi m,0x23
   jmp @0378
@0355:
   mov a,d
   add e
   mvi b,0x02
   cmp b
   jz @0378
   mvi b,0x03
   cmp b
   jz @0378
   mvi m,0x17
   jmp @0378
@0368:
   mov a,d
   add e
   mvi b,0x02
   cmp b
   jz @0378
   mvi b,0x03
   cmp b
   jz @0378
   mvi m,0x58
@0378:
   pop b
   push h
   lhld @01c4
   mov a,l
   pop h
   cmp b
   jnz @03b7
   jmp @03a0
@0386:
   mvi b,0x00
   lxi d,0x004e
   dad d
   mvi d,0xff
   push h
   lhld @01c4
   mov a,l
   cma
   mov e,a
   inx d
   xchg
   shld @01c6
   xchg
   pop h
   dad d
   jmp @0325
@03a0:
   push h
   xchg
   lhld @01d3
   mov a,h
   cmp d
   jnz @03b3
   mov a,l
   cmp e
   jnz @03b3
   pop h
   jmp @040f
@03b3:
   pop h
   jmp @0386
@03b7:
   inr b
   inx h
   jmp @0325
@03bc:
   push b
   push h
   lxi d,0x0000
   lxi b,0xffb1
   dad b
   call @03ee
   inx h
   call @03ee
   inx h
   call @03ee
   lxi b,0x004c
   dad b
   call @03ee
   inx h
   inx h
   call @03ee
   lxi b,0x004c
   dad b
   call @03ee
   inx h
   call @03ee
   inx h
   call @03ee
   pop h
   pop b
   ret
@03ee:
   mov a,m
   mvi b,0x30
   cmp b
   jnz @03f7
   inr d
   ret
@03f7:
   mvi b,0x17
   cmp b
   jnz @03ff
   inr d
   ret
@03ff:
   mvi b,0x2a
   cmp b
   jnz @0407
   inr e
   ret
@0407:
   mvi b,0x58
   cmp b
   jnz @040e
   inr e
@040e:
   ret
@040f:
   lhld @01ce
   mvi b,0x00
@0414:
   mov a,m
   mvi d,0x17
   cmp d
   jnz @0420
   mvi m,0x00
   jmp @043e
@0420:
   mvi d,0x58
   cmp d
   jnz @042b
   mvi m,0x00
   jmp @043e
@042b:
   mvi d,0x2b
   cmp d
   jnz @0436
   mvi m,0x30
   jmp @043e
@0436:
   mvi d,0x23
   cmp d
   jnz @043e
   mvi m,0x2a
@043e:
   xchg
   lhld @01d3
   mov a,h
   cmp d
   jnz @044c
   mov a,l
   cmp e
   jz @0467
@044c:
   lhld @01c4
   mov a,l
   cmp b
   jnz @0461
   lhld @01c6
   dad d
   lxi d,0x004e
   dad d
   mvi b,0x00
   jmp @0414
@0461:
   xchg
   inx h
   inr b
   jmp @0414
@0467:
   pop b
   pop d
   call 0xf81b
   cpi 0x01
   jz @047c
@0471:
   call 0xf81b
   cpi 0xfe
   jz @0471
   jmp @02f2
@047c:
   mvi c,0x00
   lhld @01c9
   shld @01c4
   jmp @020a
@0487:
   jmp 0xf86c

   jmp ENTRY_POINT
