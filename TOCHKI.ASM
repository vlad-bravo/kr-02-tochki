
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

   .byte $28
   mov a,c
   cmp l
   rst 7
   nop
   .byte $28
   mov a,c
   nop
   nop
   nop
   mov m,d
   mov m,a
   nop
   nop
   nop
   ana c
   mov a,a
   nop
   nop
   nop

@01d8:
   lxi h,@TEXT
   call 0xf818
   call 0xf812
   jz $01de
   mvi c,0x1f
   call $f809
   lxi h,$77c2
   shld $01c4
   shld $01c9
   mvi c,$00
   mvi d,$01
   mvi e,$00
   lhld $01c4
   mvi m,$17
   lhld $01c4
   mov m,c
   lhld $01c9
   mov c,m
   shld $01c4
   mvi m,$17
   call $f803
   mvi b,$ff
   cmp b
   jz $020a
   mvi b,$08
   cmp b
   jnz $0223
   lhld $01c9
   dcx h
   shld $01c9
   jmp $01fd

   mvi b,$18
   cmp b
   jnz $0233
   lhld $01c9
   inx h
   shld $01c9
   jmp $01fd

   mvi b,$1a
   cmp b
   jnz $0248
   lhld $01c9
   push d
   lxi d,$004e
   dad d
   shld $01c9
   pop d
   jmp $01fd

   mvi b,$19
   cmp b
   jnz $025d
   lhld $01c9
   push d
   lxi d,$ffb2
   dad d
   shld $01c9
   pop d
   jmp $01fd

   mvi b,$30
   cmp b
   jnz $026f
   mvi c,$30
   lhld $01c9
   inx h
   shld $01c9
   jmp $01fd

   mvi b,$3a
   cmp b
   jnz $0281
   mvi c,$2a
   lhld $01c9
   inx h
   shld $01c9
   jmp $01fd

   mvi b,$20
   cmp b
   jnz $0293
   mvi c,$00
   lhld $01c9
   inx h
   shld $01c9
   jmp $01fd

   mvi b,$4e
   cmp b
   jnz $02a8
   mvi c,$0e
   lhld $01c9
   shld $01ce
   inx h
   shld $01c9
   jmp $01fd

   mvi b,$4b
   cmp b
   jnz $02bd
   mvi c,$1d
   lhld $01c9
   shld $01d3
   inx h
   shld $01c9
   jmp $01fd

   mvi b,$00
   cmp b
   jz $02f2
   mvi b,$7f
   cmp b
   jz $0487
   mvi b,$0c
   cmp b
   jnz $02d8
   lhld $01ce
   shld $01c9
   jmp $01fd

   mvi b,$1b
   cmp b
   jnz $02e7
   lhld $01d3
   shld $01c9
   jmp $01fd

   mvi b,$52
   cmp b
   jnz $01fd
   mvi d,$00
   jmp $01fd

   lhld $01c9
   mvi m,$00
   lhld $01d3
   mvi m,$00
   lhld $01ce
   mvi m,$00
   push d
   push b
   lhld $01ce
   mov a,h
   cma
   mov h,a
   mov a,l
   cma
   mov l,a
   inx h
   xchg
   lhld $01d3
   dad d
   lxi d,$ffb2
   mov b,h
   mov c,l
   dad d
   jc $0315
   mov h,b
   mov l,c
   shld $01c4
   lhld $01ce
   mvi b,$00
   call $03bc
   push b
   mov a,m
   mvi b,$30
   cmp b
   jz $0355
   mvi b,$2a
   cmp b
   jz $0368
   mov a,d
   add e
   mvi b,$03
   cmp b
   jnz $0378
   mov a,d
   mvi b,$02
   cmp b
   jnz $034a
   mvi m,$2b
   jmp $0378

   mvi b,$03
   cmp b
   jz $0345
   mvi m,$23
   jmp $0378

   mov a,d
   add e
   mvi b,$02
   cmp b
   jz $0378
   mvi b,$03
   cmp b
   jz $0378
   mvi m,$17
   jmp $0378

   mov a,d
   add e
   mvi b,$02
   cmp b
   jz $0378
   mvi b,$03
   cmp b
   jz $0378
   mvi m,$58
   pop b
   push h
   lhld $01c4
   mov a,l
   pop h
   cmp b
   jnz $03b7
   jmp $03a0

   mvi b,$00
   lxi d,$004e
   dad d
   mvi d,$ff
   push h
   lhld $01c4
   mov a,l
   cma
   mov e,a
   inx d
   xchg
   shld $01c6
   xchg
   pop h
   dad d
   jmp $0325

   push h
   xchg
   lhld $01d3
   mov a,h
   cmp d
   jnz $03b3
   mov a,l
   cmp e
   jnz $03b3
   pop h
   jmp $040f

   pop h
   jmp $0386

   inr b
   inx h
   jmp $0325

   push b
   push h
   lxi d,$0000
   lxi b,$ffb1
   dad b
   call $03ee
   inx h
   call $03ee
   inx h
   call $03ee
   lxi b,$004c
   dad b
   call $03ee
   inx h
   inx h
   call $03ee
   lxi b,$004c
   dad b
   call $03ee
   inx h
   call $03ee
   inx h
   call $03ee
   pop h
   pop b
   ret

   mov a,m
   mvi b,$30
   cmp b
   jnz $03f7
   inr d
   ret

   mvi b,$17
   cmp b
   jnz $03ff
   inr d
   ret

   mvi b,$2a
   cmp b
   jnz $0407
   inr e
   ret

   mvi b,$58
   cmp b
   jnz $040e
   inr e
   ret

   lhld $01ce
   mvi b,$00
   mov a,m
   mvi d,$17
   cmp d
   jnz $0420
   mvi m,$00
   jmp $043e

   mvi d,$58
   cmp d
   jnz $042b
   mvi m,$00
   jmp $043e

   mvi d,$2b
   cmp d
   jnz $0436
   mvi m,$30
   jmp $043e

   mvi d,$23
   cmp d
   jnz $043e
   mvi m,$2a
   xchg
   lhld $01d3
   mov a,h
   cmp d
   jnz $044c
   mov a,l
   cmp e
   jz $0467
   lhld $01c4
   mov a,l
   cmp b
   jnz $0461
   lhld $01c6
   dad d
   lxi d,$004e
   dad d
   mvi b,$00
   jmp $0414

   xchg
   inx h
   inr b
   jmp $0414

   pop b
   pop d
   call $f81b
   cpi $01
   jz $047c
   call $f81b
   cpi $fe
   jz $0471
   jmp $02f2

   mvi c,$00
   lhld $01c9
   shld $01c4
   jmp $020a

   jmp $f86c

   jmp $0000
