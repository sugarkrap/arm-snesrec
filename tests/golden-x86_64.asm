extern MapMode, CycleCount
extern regA, regX, regY, regS, regDP, regDBR
extern B_Flag, C_Flag, D_Flag, E_Flag, I_Flag
extern M_Flag, N_Flag, V_Flag, X_Flag, Z_Flag
extern inNMI, NMI, io_RDNMI, io_NMITIMEN, DoMessages, Render
extern pc_map, __JUMP_FAILED, __CALL_SHOW, __REG_DUMP, __READ_INS
extern __UpdateNZ_A8, __UpdateNZ_X8, __UpdateNZ_Y8
extern __UpdateNZ_A16, __UpdateNZ_X16, __UpdateNZ_Y16
extern __MVN, __MVP, __REP, __SEP, __XCE, __WDM, __WAI, __PRINT_INS
extern __TESTNZ8, __TESTNZ16, __COMPARE8, __COMPARE16
extern __ASL8, __ASL16, __LSR8, __LSR16, __ROR8, __ROR16, __ROL8, __ROL16
extern __TSB, __TRB, __BIT8, __BIT16, __INC8, __INC16, __ADC8, __ADC16, __SBC8, __SBC16
extern __PHP, __PLP, __PUSH8, __PUSH16, __PULL8, __PULL16
extern __WRITE8, __WRITE16, __READ8, __READ16, __READ24

  section .text
__CALL_ADDRESS:
  mov r12, rcx
  sub rsp, 32
  call __CALL_SHOW
  add rsp, 32
  mov rcx, r12
  and rcx, 0xFFFFFF
  cmp rcx, 0x808000
  jne .next_0
  jmp Label_808000
.next_0:
  cmp rcx, 0x808100
  jne .next_1
  jmp Label_808100
.next_1:
  cmp rcx, 0x808200
  jne .next_2
  jmp Label_808200
.next_2:
  cmp rcx, 0x808300
  jne .next_3
  jmp Label_808300
.next_3:
  cmp rcx, 0x808000
  jne .next_4
  jmp Label_808000
.next_4:
  cmp rcx, 0x808114
  jne .next_5
  jmp Label_808114
.next_5:
  cmp rcx, 0x808118
  jne .next_6
  jmp Label_808118
.next_6:
  cmp rcx, 0x80811C
  jne .next_7
  jmp Label_80811C
.next_7:
  cmp rcx, 0x808120
  jne .next_8
  jmp Label_808120
.next_8:
  cmp rcx, 0x808314
  jne .next_9
  jmp Label_808314
.next_9:
  cmp rcx, 0x808318
  jne .next_10
  jmp Label_808318
.next_10:
  cmp rcx, 0x80831C
  jne .next_11
  jmp Label_80831C
.next_11:
  cmp rcx, 0x808320
  jne .next_12
  jmp Label_808320
.next_12:
  cmp rcx, 0x808400
  jne .next_13
  jmp Label_808400
.next_13:
  cmp rcx, 0x808514
  jne .next_14
  jmp Label_808514
.next_14:
  cmp rcx, 0x808518
  jne .next_15
  jmp Label_808518
.next_15:
  cmp rcx, 0x80851C
  jne .next_16
  jmp Label_80851C
.next_16:
  cmp rcx, 0x808520
  jne .next_17
  jmp Label_808520
.next_17:
  cmp rcx, 0x808714
  jne .next_18
  jmp Label_808714
.next_18:
  cmp rcx, 0x808718
  jne .next_19
  jmp Label_808718
.next_19:
  cmp rcx, 0x80871C
  jne .next_20
  jmp Label_80871C
.next_20:
  cmp rcx, 0x808720
  jne .next_21
  jmp Label_808720
.next_21:
  cmp rcx, 0x808800
  jne .next_22
  jmp Label_808800
.next_22:
  cmp rcx, 0x808814
  jne .next_23
  jmp Label_808814
.next_23:
  cmp rcx, 0x808818
  jne .next_24
  jmp Label_808818
.next_24:
  cmp rcx, 0x80881C
  jne .next_25
  jmp Label_80881C
.next_25:
  cmp rcx, 0x808820
  jne .next_26
  jmp Label_808820
.next_26:
  cmp rcx, 0x808914
  jne .next_27
  jmp Label_808914
.next_27:
  cmp rcx, 0x808918
  jne .next_28
  jmp Label_808918
.next_28:
  cmp rcx, 0x80891C
  jne .next_29
  jmp Label_80891C
.next_29:
  cmp rcx, 0x808920
  jne .next_30
  jmp Label_808920
.next_30:
  cmp rcx, 0x808B14
  jne .next_31
  jmp Label_808B14
.next_31:
  cmp rcx, 0x808B18
  jne .next_32
  jmp Label_808B18
.next_32:
  cmp rcx, 0x808B1C
  jne .next_33
  jmp Label_808B1C
.next_33:
  cmp rcx, 0x808B20
  jne .next_34
  jmp Label_808B20
.next_34:
  cmp rcx, 0x808C00
  jne .next_35
  jmp Label_808C00
.next_35:
  cmp rcx, 0x808D14
  jne .next_36
  jmp Label_808D14
.next_36:
  cmp rcx, 0x808D18
  jne .next_37
  jmp Label_808D18
.next_37:
  cmp rcx, 0x808D1C
  jne .next_38
  jmp Label_808D1C
.next_38:
  cmp rcx, 0x808D20
  jne .next_39
  jmp Label_808D20
.next_39:
  cmp rcx, 0x808F14
  jne .next_40
  jmp Label_808F14
.next_40:
  cmp rcx, 0x808F18
  jne .next_41
  jmp Label_808F18
.next_41:
  cmp rcx, 0x808F1C
  jne .next_42
  jmp Label_808F1C
.next_42:
  cmp rcx, 0x808F20
  jne .next_43
  jmp Label_808F20
.next_43:
  mov rdx, rbx
  call __JUMP_FAILED

__CPUSync:
  sub rsp, 32
  call Render
  add rsp, 32
  
  mov rax, [rel NMI]
  cmp al, 0
  je .return
  
  mov al, [rel io_RDNMI]
  or al, 0x80
  mov [rel io_RDNMI], al
  
  mov byte [rel NMI], 0
  mov al, [rel io_NMITIMEN]
  and al, 0x80
  cmp al, 0
  je .return
  
  add rsp, 32
  pop rax ; pop return address
  
  mov byte [rel inNMI], 1
  mov rax, r12
  shr rax, 16
  mov cl, al
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rax, r12
  mov cl, ah
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rax, r12
  mov cl, al
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  jmp Label_NMI
  
.return:
  ret


  global Start
Start:
  mov byte [rel MapMode], 0
  ret

  global Label_Reset
Label_Reset:
  global Label_808000
Label_808000:
  ; -- 808000 --
  mov r12, 0x808000
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x02
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_BRK
  add qword [rel CycleCount], 7
  ; -- 808004 --
  mov r12, 0x808004
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x06
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_BRK
  add qword [rel CycleCount], 7
  ; -- 808008 --
  mov r12, 0x808008
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x0A
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_BRK
  add qword [rel CycleCount], 7
  ; -- 80800C --
  mov r12, 0x80800C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x0E
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_BRK
  add qword [rel CycleCount], 7
  ; -- 808010 --
  mov r12, 0x808010
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808014 --
  mov r12, 0x808014
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808018 --
  mov r12, 0x808018
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 80801C --
  mov r12, 0x80801C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808020 --
  mov r12, 0x808020
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x22
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_COP
  add qword [rel CycleCount], 7
  ; -- 808024 --
  mov r12, 0x808024
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x26
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_COP
  add qword [rel CycleCount], 7
  ; -- 808028 --
  mov r12, 0x808028
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x2A
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_COP
  add qword [rel CycleCount], 7
  ; -- 80802C --
  mov r12, 0x80802C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x2E
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  mov byte [rel D_Flag], 0x00
  jmp Label_COP
  add qword [rel CycleCount], 7
  ; -- 808030 --
  mov r12, 0x808030
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808034 --
  mov r12, 0x808034
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808038 --
  mov r12, 0x808038
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80803C --
  mov r12, 0x80803C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808040 --
  mov r12, 0x808040
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808044 --
  mov r12, 0x808044
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808048 --
  mov r12, 0x808048
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80804C --
  mov r12, 0x80804C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808050 --
  mov r12, 0x808050
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808054 --
  mov r12, 0x808054
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808058 --
  mov r12, 0x808058
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 80805C --
  mov r12, 0x80805C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808060 --
  mov r12, 0x808060
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808064 --
  mov r12, 0x808064
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808068 --
  mov r12, 0x808068
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80806C --
  mov r12, 0x80806C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808070 --
  mov r12, 0x808070
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808074 --
  mov r12, 0x808074
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808078 --
  mov r12, 0x808078
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80807C --
  mov r12, 0x80807C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808080 --
  mov r12, 0x808080
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808084 --
  mov r12, 0x808084
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808088 --
  mov r12, 0x808088
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80808C --
  mov r12, 0x80808C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808090 --
  mov r12, 0x808090
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  or rax, 0x3412
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808094 --
  mov r12, 0x808094
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  or rax, 0x3412
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808098 --
  mov r12, 0x808098
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  or rax, 0x12
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 80809C --
  mov r12, 0x80809C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  or rax, 0x12
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8080A0 --
  mov r12, 0x8080A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8080A4 --
  mov r12, 0x8080A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8080A8 --
  mov r12, 0x8080A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8080AC --
  mov r12, 0x8080AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8080B0 --
  mov r12, 0x8080B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8080B4 --
  mov r12, 0x8080B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8080B8 --
  mov r12, 0x8080B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8080BC --
  mov r12, 0x8080BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8080C0 --
  mov r12, 0x8080C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8080C4 --
  mov r12, 0x8080C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8080C8 --
  mov r12, 0x8080C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8080CC --
  mov r12, 0x8080CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TSB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8080D0 --
  mov r12, 0x8080D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 8080D4 --
  mov r12, 0x8080D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 8080D8 --
  mov r12, 0x8080D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 8080DC --
  mov r12, 0x8080DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 8080E0 --
  mov r12, 0x8080E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 8
  ; -- 8080E4 --
  mov r12, 0x8080E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 8
  ; -- 8080E8 --
  mov r12, 0x8080E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8080EC --
  mov r12, 0x8080EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8080F0 --
  mov r12, 0x8080F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8080F4 --
  mov r12, 0x8080F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8080F8 --
  mov r12, 0x8080F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 8080FC --
  mov r12, 0x8080FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_NMI
Label_NMI:
  global Label_808100
Label_808100:
  ; -- 808100 --
  mov r12, 0x808100
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_808114
  ; -- 808104 --
  mov r12, 0x808104
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_808118
  ; -- 808108 --
  mov r12, 0x808108
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_80811C
  ; -- 80810C --
  mov r12, 0x80810C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_808120
  ; -- 808110 --
  mov r12, 0x808110
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5

  global Label_808114
Label_808114:
  ; -- 808114 --
  mov r12, 0x808114
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5

  global Label_808118
Label_808118:
  ; -- 808118 --
  mov r12, 0x808118
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4

  global Label_80811C
Label_80811C:
  ; -- 80811C --
  mov r12, 0x80811C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4

  global Label_808120
Label_808120:
  ; -- 808120 --
  mov r12, 0x808120
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808124 --
  mov r12, 0x808124
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808128 --
  mov r12, 0x808128
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80812C --
  mov r12, 0x80812C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808130 --
  mov r12, 0x808130
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808134 --
  mov r12, 0x808134
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808138 --
  mov r12, 0x808138
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80813C --
  mov r12, 0x80813C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808140 --
  mov r12, 0x808140
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808144 --
  mov r12, 0x808144
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808148 --
  mov r12, 0x808148
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80814C --
  mov r12, 0x80814C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808150 --
  mov r12, 0x808150
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808154 --
  mov r12, 0x808154
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808158 --
  mov r12, 0x808158
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80815C --
  mov r12, 0x80815C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808160 --
  mov r12, 0x808160
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 8
  ; -- 808164 --
  mov r12, 0x808164
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 8
  ; -- 808168 --
  mov r12, 0x808168
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 80816C --
  mov r12, 0x80816C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808170 --
  mov r12, 0x808170
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808174 --
  mov r12, 0x808174
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808178 --
  mov r12, 0x808178
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80817C --
  mov r12, 0x80817C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808180 --
  mov r12, 0x808180
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808184 --
  mov r12, 0x808184
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808188 --
  mov r12, 0x808188
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 80818C --
  mov r12, 0x80818C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808190 --
  mov r12, 0x808190
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808194 --
  mov r12, 0x808194
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808198 --
  mov r12, 0x808198
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80819C --
  mov r12, 0x80819C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8081A0 --
  mov r12, 0x8081A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  add rax, 0x1
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8081A4 --
  mov r12, 0x8081A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  add rax, 0x1
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8081A8 --
  mov r12, 0x8081A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  add rax, 0x1
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8081AC --
  mov r12, 0x8081AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  add rax, 0x1
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8081B0 --
  mov r12, 0x8081B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8081B4 --
  mov r12, 0x8081B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8081B8 --
  mov r12, 0x8081B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8081BC --
  mov r12, 0x8081BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8081C0 --
  mov r12, 0x8081C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8081C4 --
  mov r12, 0x8081C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8081C8 --
  mov r12, 0x8081C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8081CC --
  mov r12, 0x8081CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __TRB
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8081D0 --
  mov r12, 0x8081D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8081D4 --
  mov r12, 0x8081D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8081D8 --
  mov r12, 0x8081D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8081DC --
  mov r12, 0x8081DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8081E0 --
  mov r12, 0x8081E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 9
  ; -- 8081E4 --
  mov r12, 0x8081E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 9
  ; -- 8081E8 --
  mov r12, 0x8081E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 8081EC --
  mov r12, 0x8081EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ASL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 8081F0 --
  mov r12, 0x8081F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8081F4 --
  mov r12, 0x8081F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  or rcx, rax
  mov word [rel regA], cx
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8081F8 --
  mov r12, 0x8081F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 8081FC --
  mov r12, 0x8081FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  or rcx, rax
  mov byte [rel regA], cl
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_BRK
Label_BRK:
  global Label_808200
Label_808200:
  ; -- 808200 --
  mov r12, 0x808200
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x02
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x803412
  mov rbx, 0x808200
  jmp __CALL_ADDRESS
  ; -- 808204 --
  mov r12, 0x808204
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x06
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x803412
  mov rbx, 0x808204
  jmp __CALL_ADDRESS
  ; -- 808208 --
  mov r12, 0x808208
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x0A
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x803412
  mov rbx, 0x808208
  jmp __CALL_ADDRESS
  ; -- 80820C --
  mov r12, 0x80820C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x0E
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x803412
  mov rbx, 0x80820C
  jmp __CALL_ADDRESS
  ; -- 808210 --
  mov r12, 0x808210
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808214 --
  mov r12, 0x808214
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808218 --
  mov r12, 0x808218
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 80821C --
  mov r12, 0x80821C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808220 --
  mov r12, 0x808220
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 8
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x23
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x563412
  mov rbx, 0x808220
  jmp __CALL_ADDRESS
  ; -- 808224 --
  mov r12, 0x808224
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 8
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x27
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x563412
  mov rbx, 0x808224
  jmp __CALL_ADDRESS
  ; -- 808228 --
  mov r12, 0x808228
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 8
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x2B
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x563412
  mov rbx, 0x808228
  jmp __CALL_ADDRESS
  ; -- 80822C --
  mov r12, 0x80822C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 8
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x82
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x2F
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0x563412
  mov rbx, 0x80822C
  jmp __CALL_ADDRESS
  ; -- 808230 --
  mov r12, 0x808230
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808234 --
  mov r12, 0x808234
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808238 --
  mov r12, 0x808238
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80823C --
  mov r12, 0x80823C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808240 --
  mov r12, 0x808240
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808244 --
  mov r12, 0x808244
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808248 --
  mov r12, 0x808248
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80824C --
  mov r12, 0x80824C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808250 --
  mov r12, 0x808250
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808254 --
  mov r12, 0x808254
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808258 --
  mov r12, 0x808258
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 80825C --
  mov r12, 0x80825C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808260 --
  mov r12, 0x808260
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808264 --
  mov r12, 0x808264
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808268 --
  mov r12, 0x808268
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80826C --
  mov r12, 0x80826C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808270 --
  mov r12, 0x808270
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808274 --
  mov r12, 0x808274
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808278 --
  mov r12, 0x808278
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80827C --
  mov r12, 0x80827C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808280 --
  mov r12, 0x808280
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808284 --
  mov r12, 0x808284
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808288 --
  mov r12, 0x808288
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80828C --
  mov r12, 0x80828C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808290 --
  mov r12, 0x808290
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  and rax, 0x3412
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808294 --
  mov r12, 0x808294
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  and rax, 0x3412
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808298 --
  mov r12, 0x808298
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  and rax, 0x12
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 80829C --
  mov r12, 0x80829C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  and rax, 0x12
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8082A0 --
  mov r12, 0x8082A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8082A4 --
  mov r12, 0x8082A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8082A8 --
  mov r12, 0x8082A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8082AC --
  mov r12, 0x8082AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8082B0 --
  mov r12, 0x8082B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8082B4 --
  mov r12, 0x8082B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8082B8 --
  mov r12, 0x8082B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8082BC --
  mov r12, 0x8082BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8082C0 --
  mov r12, 0x8082C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8082C4 --
  mov r12, 0x8082C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8082C8 --
  mov r12, 0x8082C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8082CC --
  mov r12, 0x8082CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8082D0 --
  mov r12, 0x8082D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8082D4 --
  mov r12, 0x8082D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8082D8 --
  mov r12, 0x8082D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8082DC --
  mov r12, 0x8082DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8082E0 --
  mov r12, 0x8082E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8082E4 --
  mov r12, 0x8082E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8082E8 --
  mov r12, 0x8082E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8082EC --
  mov r12, 0x8082EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8082F0 --
  mov r12, 0x8082F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8082F4 --
  mov r12, 0x8082F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8082F8 --
  mov r12, 0x8082F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 8082FC --
  mov r12, 0x8082FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_COP
Label_COP:
  global Label_808300
Label_808300:
  ; -- 808300 --
  mov r12, 0x808300
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_808314
  ; -- 808304 --
  mov r12, 0x808304
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_808318
  ; -- 808308 --
  mov r12, 0x808308
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_80831C
  ; -- 80830C --
  mov r12, 0x80830C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_808320
  ; -- 808310 --
  mov r12, 0x808310
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7

  global Label_808314
Label_808314:
  ; -- 808314 --
  mov r12, 0x808314
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7

  global Label_808318
Label_808318:
  ; -- 808318 --
  mov r12, 0x808318
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6

  global Label_80831C
Label_80831C:
  ; -- 80831C --
  mov r12, 0x80831C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6

  global Label_808320
Label_808320:
  ; -- 808320 --
  mov r12, 0x808320
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808324 --
  mov r12, 0x808324
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808328 --
  mov r12, 0x808328
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 80832C --
  mov r12, 0x80832C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808330 --
  mov r12, 0x808330
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regY]
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  or rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808334 --
  mov r12, 0x808334
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regY]
  and rcx, 0xFF
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  or rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808338 --
  mov r12, 0x808338
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regY]
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  or rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 7
  ; -- 80833C --
  mov r12, 0x80833C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regY]
  and rcx, 0xFF
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  or rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 7
  ; -- 808340 --
  mov r12, 0x808340
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808344 --
  mov r12, 0x808344
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808348 --
  mov r12, 0x808348
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80834C --
  mov r12, 0x80834C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808350 --
  mov r12, 0x808350
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808354 --
  mov r12, 0x808354
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808358 --
  mov r12, 0x808358
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80835C --
  mov r12, 0x80835C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808360 --
  mov r12, 0x808360
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808364 --
  mov r12, 0x808364
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808368 --
  mov r12, 0x808368
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80836C --
  mov r12, 0x80836C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808370 --
  mov r12, 0x808370
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808374 --
  mov r12, 0x808374
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808378 --
  mov r12, 0x808378
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80837C --
  mov r12, 0x80837C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808380 --
  mov r12, 0x808380
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808384 --
  mov r12, 0x808384
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808388 --
  mov r12, 0x808388
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 80838C --
  mov r12, 0x80838C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808390 --
  mov r12, 0x808390
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808394 --
  mov r12, 0x808394
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808398 --
  mov r12, 0x808398
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80839C --
  mov r12, 0x80839C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8083A0 --
  mov r12, 0x8083A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  sub rax, 0x1
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8083A4 --
  mov r12, 0x8083A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  sub rax, 0x1
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8083A8 --
  mov r12, 0x8083A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  sub rax, 0x1
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8083AC --
  mov r12, 0x8083AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  sub rax, 0x1
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8083B0 --
  mov r12, 0x8083B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8083B4 --
  mov r12, 0x8083B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8083B8 --
  mov r12, 0x8083B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8083BC --
  mov r12, 0x8083BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8083C0 --
  mov r12, 0x8083C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8083C4 --
  mov r12, 0x8083C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8083C8 --
  mov r12, 0x8083C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8083CC --
  mov r12, 0x8083CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __BIT8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8083D0 --
  mov r12, 0x8083D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8083D4 --
  mov r12, 0x8083D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8083D8 --
  mov r12, 0x8083D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8083DC --
  mov r12, 0x8083DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8083E0 --
  mov r12, 0x8083E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8083E4 --
  mov r12, 0x8083E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8083E8 --
  mov r12, 0x8083E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8083EC --
  mov r12, 0x8083EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROL8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8083F0 --
  mov r12, 0x8083F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8083F4 --
  mov r12, 0x8083F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  and r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8083F8 --
  mov r12, 0x8083F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 8083FC --
  mov r12, 0x8083FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  and r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_808400
Label_808400:
  ; -- 808400 --
  mov r12, 0x808400
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel inNMI], 0x00
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PLP
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  shl rax, 8
  or rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x808400
  jmp __CALL_ADDRESS
  ; -- 808404 --
  mov r12, 0x808404
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel inNMI], 0x00
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PLP
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  shl rax, 8
  or rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x808404
  jmp __CALL_ADDRESS
  ; -- 808408 --
  mov r12, 0x808408
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel inNMI], 0x00
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PLP
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  shl rax, 8
  or rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x808408
  jmp __CALL_ADDRESS
  ; -- 80840C --
  mov r12, 0x80840C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel inNMI], 0x00
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PLP
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  shl rax, 8
  or rbx, rax
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x80840C
  jmp __CALL_ADDRESS
  ; -- 808410 --
  mov r12, 0x808410
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808414 --
  mov r12, 0x808414
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808418 --
  mov r12, 0x808418
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80841C --
  mov r12, 0x80841C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808420 --
  mov r12, 0x808420
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM
  ; -- 808424 --
  mov r12, 0x808424
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM
  ; -- 808428 --
  mov r12, 0x808428
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM
  ; -- 80842C --
  mov r12, 0x80842C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM
  ; -- 808430 --
  mov r12, 0x808430
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808434 --
  mov r12, 0x808434
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808438 --
  mov r12, 0x808438
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 80843C --
  mov r12, 0x80843C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808440 --
  mov r12, 0x808440
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVP
  add rsp, 32
  ; -- 808444 --
  mov r12, 0x808444
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVP
  add rsp, 32
  ; -- 808448 --
  mov r12, 0x808448
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVP
  add rsp, 32
  ; -- 80844C --
  mov r12, 0x80844C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVP
  add rsp, 32
  ; -- 808450 --
  mov r12, 0x808450
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808454 --
  mov r12, 0x808454
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808458 --
  mov r12, 0x808458
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 80845C --
  mov r12, 0x80845C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808460 --
  mov r12, 0x808460
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808464 --
  mov r12, 0x808464
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808468 --
  mov r12, 0x808468
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80846C --
  mov r12, 0x80846C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808470 --
  mov r12, 0x808470
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808474 --
  mov r12, 0x808474
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808478 --
  mov r12, 0x808478
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80847C --
  mov r12, 0x80847C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808480 --
  mov r12, 0x808480
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808484 --
  mov r12, 0x808484
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808488 --
  mov r12, 0x808488
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80848C --
  mov r12, 0x80848C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808490 --
  mov r12, 0x808490
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  xor rax, 0x3412
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808494 --
  mov r12, 0x808494
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  xor rax, 0x3412
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808498 --
  mov r12, 0x808498
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  xor rax, 0x12
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 80849C --
  mov r12, 0x80849C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  xor rax, 0x12
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8084A0 --
  mov r12, 0x8084A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8084A4 --
  mov r12, 0x8084A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8084A8 --
  mov r12, 0x8084A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8084AC --
  mov r12, 0x8084AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8084B0 --
  mov r12, 0x8084B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8084B4 --
  mov r12, 0x8084B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8084B8 --
  mov r12, 0x8084B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8084BC --
  mov r12, 0x8084BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8084C0 --
  mov r12, 0x8084C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x803412
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8084C0
  jmp __CALL_ADDRESS
  ; -- 8084C4 --
  mov r12, 0x8084C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x803412
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8084C4
  jmp __CALL_ADDRESS
  ; -- 8084C8 --
  mov r12, 0x8084C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x803412
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8084C8
  jmp __CALL_ADDRESS
  ; -- 8084CC --
  mov r12, 0x8084CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x803412
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8084CC
  jmp __CALL_ADDRESS
  ; -- 8084D0 --
  mov r12, 0x8084D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8084D4 --
  mov r12, 0x8084D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8084D8 --
  mov r12, 0x8084D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8084DC --
  mov r12, 0x8084DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8084E0 --
  mov r12, 0x8084E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8084E4 --
  mov r12, 0x8084E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8084E8 --
  mov r12, 0x8084E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8084EC --
  mov r12, 0x8084EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8084F0 --
  mov r12, 0x8084F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8084F4 --
  mov r12, 0x8084F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8084F8 --
  mov r12, 0x8084F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 8084FC --
  mov r12, 0x8084FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808500 --
  mov r12, 0x808500
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_808514
  ; -- 808504 --
  mov r12, 0x808504
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_808518
  ; -- 808508 --
  mov r12, 0x808508
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_80851C
  ; -- 80850C --
  mov r12, 0x80850C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_808520
  ; -- 808510 --
  mov r12, 0x808510
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7

  global Label_808514
Label_808514:
  ; -- 808514 --
  mov r12, 0x808514
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7

  global Label_808518
Label_808518:
  ; -- 808518 --
  mov r12, 0x808518
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6

  global Label_80851C
Label_80851C:
  ; -- 80851C --
  mov r12, 0x80851C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6

  global Label_808520
Label_808520:
  ; -- 808520 --
  mov r12, 0x808520
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808524 --
  mov r12, 0x808524
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808528 --
  mov r12, 0x808528
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 80852C --
  mov r12, 0x80852C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808530 --
  mov r12, 0x808530
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 8
  ; -- 808534 --
  mov r12, 0x808534
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 8
  ; -- 808538 --
  mov r12, 0x808538
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 7
  ; -- 80853C --
  mov r12, 0x80853C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 7
  ; -- 808540 --
  mov r12, 0x808540
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVN
  add rsp, 32
  ; -- 808544 --
  mov r12, 0x808544
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVN
  add rsp, 32
  ; -- 808548 --
  mov r12, 0x808548
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVN
  add rsp, 32
  ; -- 80854C --
  mov r12, 0x80854C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x34
  mov rdx, 0x12
  sub rsp, 32
  call __MVN
  add rsp, 32
  ; -- 808550 --
  mov r12, 0x808550
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808554 --
  mov r12, 0x808554
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808558 --
  mov r12, 0x808558
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80855C --
  mov r12, 0x80855C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808560 --
  mov r12, 0x808560
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808564 --
  mov r12, 0x808564
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808568 --
  mov r12, 0x808568
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80856C --
  mov r12, 0x80856C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808570 --
  mov r12, 0x808570
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808574 --
  mov r12, 0x808574
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808578 --
  mov r12, 0x808578
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 80857C --
  mov r12, 0x80857C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808580 --
  mov r12, 0x808580
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808584 --
  mov r12, 0x808584
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808588 --
  mov r12, 0x808588
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 80858C --
  mov r12, 0x80858C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808590 --
  mov r12, 0x808590
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808594 --
  mov r12, 0x808594
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808598 --
  mov r12, 0x808598
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80859C --
  mov r12, 0x80859C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8085A0 --
  mov r12, 0x8085A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8085A4 --
  mov r12, 0x8085A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8085A8 --
  mov r12, 0x8085A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8085AC --
  mov r12, 0x8085AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8085B0 --
  mov r12, 0x8085B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 8085B4 --
  mov r12, 0x8085B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 8085B8 --
  mov r12, 0x8085B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 8085BC --
  mov r12, 0x8085BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regDP], ax
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 8085C0 --
  mov r12, 0x8085C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085C0
  jmp __CALL_ADDRESS
  ; -- 8085C4 --
  mov r12, 0x8085C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085C4
  jmp __CALL_ADDRESS
  ; -- 8085C8 --
  mov r12, 0x8085C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085C8
  jmp __CALL_ADDRESS
  ; -- 8085CC --
  mov r12, 0x8085CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085CC
  jmp __CALL_ADDRESS
  ; -- 8085D0 --
  mov r12, 0x8085D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8085D4 --
  mov r12, 0x8085D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 8085D8 --
  mov r12, 0x8085D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8085DC --
  mov r12, 0x8085DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 8085E0 --
  mov r12, 0x8085E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8085E4 --
  mov r12, 0x8085E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8085E8 --
  mov r12, 0x8085E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8085EC --
  mov r12, 0x8085EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __LSR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8085F0 --
  mov r12, 0x8085F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8085F4 --
  mov r12, 0x8085F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx r12, word [rel regA]
  xor r12, rax
  mov word [rel regA], r12w
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 8085F8 --
  mov r12, 0x8085F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 8085FC --
  mov r12, 0x8085FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx r12, byte [rel regA]
  xor r12, rax
  mov byte [rel regA], r12b
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808600 --
  mov r12, 0x808600
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x808600
  jmp __CALL_ADDRESS
  ; -- 808604 --
  mov r12, 0x808604
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x808604
  jmp __CALL_ADDRESS
  ; -- 808608 --
  mov r12, 0x808608
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x808608
  jmp __CALL_ADDRESS
  ; -- 80860C --
  mov r12, 0x80860C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x80860C
  jmp __CALL_ADDRESS
  ; -- 808610 --
  mov r12, 0x808610
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808614 --
  mov r12, 0x808614
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808618 --
  mov r12, 0x808618
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 80861C --
  mov r12, 0x80861C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808620 --
  mov r12, 0x808620
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80BE35
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808624 --
  mov r12, 0x808624
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80BE3D
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808628 --
  mov r12, 0x808628
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80BE3D
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80862C --
  mov r12, 0x80862C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x80BE6D
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808630 --
  mov r12, 0x808630
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 808634 --
  mov r12, 0x808634
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 808638 --
  mov r12, 0x808638
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 80863C --
  mov r12, 0x80863C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 808640 --
  mov r12, 0x808640
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808644 --
  mov r12, 0x808644
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808648 --
  mov r12, 0x808648
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80864C --
  mov r12, 0x80864C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808650 --
  mov r12, 0x808650
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 808654 --
  mov r12, 0x808654
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 808658 --
  mov r12, 0x808658
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 3
  ; -- 80865C --
  mov r12, 0x80865C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 3
  ; -- 808660 --
  mov r12, 0x808660
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808664 --
  mov r12, 0x808664
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808668 --
  mov r12, 0x808668
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80866C --
  mov r12, 0x80866C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808670 --
  mov r12, 0x808670
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808674 --
  mov r12, 0x808674
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808678 --
  mov r12, 0x808678
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 80867C --
  mov r12, 0x80867C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808680 --
  mov r12, 0x808680
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808684 --
  mov r12, 0x808684
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808688 --
  mov r12, 0x808688
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 80868C --
  mov r12, 0x80868C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808690 --
  mov r12, 0x808690
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 3
  ; -- 808694 --
  mov r12, 0x808694
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 3
  ; -- 808698 --
  mov r12, 0x808698
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x12
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 80869C --
  mov r12, 0x80869C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x12
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8086A0 --
  mov r12, 0x8086A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8086A4 --
  mov r12, 0x8086A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 2
  ; -- 8086A8 --
  mov r12, 0x8086A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8086AC --
  mov r12, 0x8086AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 8086B0 --
  mov r12, 0x8086B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  movzx rcx, al
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086B0
  jmp __CALL_ADDRESS
  ; -- 8086B4 --
  mov r12, 0x8086B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  movzx rcx, al
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086B4
  jmp __CALL_ADDRESS
  ; -- 8086B8 --
  mov r12, 0x8086B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  movzx rcx, al
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086B8
  jmp __CALL_ADDRESS
  ; -- 8086BC --
  mov r12, 0x8086BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bl, al
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov bh, al
  inc bx
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  movzx rcx, al
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086BC
  jmp __CALL_ADDRESS
  ; -- 8086C0 --
  mov r12, 0x8086C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 5
  mov rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  or rax, 0x800000
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8086C0
  jmp __CALL_ADDRESS
  ; -- 8086C4 --
  mov r12, 0x8086C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 5
  mov rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  or rax, 0x800000
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8086C4
  jmp __CALL_ADDRESS
  ; -- 8086C8 --
  mov r12, 0x8086C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 5
  mov rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  or rax, 0x800000
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8086C8
  jmp __CALL_ADDRESS
  ; -- 8086CC --
  mov r12, 0x8086CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 5
  mov rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  or rax, 0x800000
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x8086CC
  jmp __CALL_ADDRESS
  ; -- 8086D0 --
  mov r12, 0x8086D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 8086D4 --
  mov r12, 0x8086D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 8086D8 --
  mov r12, 0x8086D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 3
  ; -- 8086DC --
  mov r12, 0x8086DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 3
  ; -- 8086E0 --
  mov r12, 0x8086E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8086E4 --
  mov r12, 0x8086E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8086E8 --
  mov r12, 0x8086E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8086EC --
  mov r12, 0x8086EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8086F0 --
  mov r12, 0x8086F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 8086F4 --
  mov r12, 0x8086F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 8086F8 --
  mov r12, 0x8086F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 8086FC --
  mov r12, 0x8086FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 808700 --
  mov r12, 0x808700
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_808714
  ; -- 808704 --
  mov r12, 0x808704
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_808718
  ; -- 808708 --
  mov r12, 0x808708
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_80871C
  ; -- 80870C --
  mov r12, 0x80870C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_808720
  ; -- 808710 --
  mov r12, 0x808710
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6

  global Label_808714
Label_808714:
  ; -- 808714 --
  mov r12, 0x808714
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7

  global Label_808718
Label_808718:
  ; -- 808718 --
  mov r12, 0x808718
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5

  global Label_80871C
Label_80871C:
  ; -- 80871C --
  mov r12, 0x80871C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6

  global Label_808720
Label_808720:
  ; -- 808720 --
  mov r12, 0x808720
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808724 --
  mov r12, 0x808724
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808728 --
  mov r12, 0x808728
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 80872C --
  mov r12, 0x80872C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808730 --
  mov r12, 0x808730
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  ; -- 808734 --
  mov r12, 0x808734
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  ; -- 808738 --
  mov r12, 0x808738
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  ; -- 80873C --
  mov r12, 0x80873C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  ; -- 808740 --
  mov r12, 0x808740
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808744 --
  mov r12, 0x808744
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808748 --
  mov r12, 0x808748
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80874C --
  mov r12, 0x80874C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808750 --
  mov r12, 0x808750
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 808754 --
  mov r12, 0x808754
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 808758 --
  mov r12, 0x808758
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 80875C --
  mov r12, 0x80875C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 808760 --
  mov r12, 0x808760
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808764 --
  mov r12, 0x808764
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808768 --
  mov r12, 0x808768
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80876C --
  mov r12, 0x80876C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808770 --
  mov r12, 0x808770
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808774 --
  mov r12, 0x808774
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808778 --
  mov r12, 0x808778
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 80877C --
  mov r12, 0x80877C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808780 --
  mov r12, 0x808780
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808784 --
  mov r12, 0x808784
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808788 --
  mov r12, 0x808788
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 80878C --
  mov r12, 0x80878C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808790 --
  mov r12, 0x808790
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 808794 --
  mov r12, 0x808794
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 808798 --
  mov r12, 0x808798
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 80879C --
  mov r12, 0x80879C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 8087A0 --
  mov r12, 0x8087A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 5
  ; -- 8087A4 --
  mov r12, 0x8087A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 8087A8 --
  mov r12, 0x8087A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 5
  ; -- 8087AC --
  mov r12, 0x8087AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 8087B0 --
  mov r12, 0x8087B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8087B4 --
  mov r12, 0x8087B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8087B8 --
  mov r12, 0x8087B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8087BC --
  mov r12, 0x8087BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8087C0 --
  mov r12, 0x8087C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087C0
  jmp __CALL_ADDRESS
  ; -- 8087C4 --
  mov r12, 0x8087C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087C4
  jmp __CALL_ADDRESS
  ; -- 8087C8 --
  mov r12, 0x8087C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087C8
  jmp __CALL_ADDRESS
  ; -- 8087CC --
  mov r12, 0x8087CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087CC
  jmp __CALL_ADDRESS
  ; -- 8087D0 --
  mov r12, 0x8087D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 8087D4 --
  mov r12, 0x8087D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 8087D8 --
  mov r12, 0x8087D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 8087DC --
  mov r12, 0x8087DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 8087E0 --
  mov r12, 0x8087E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8087E4 --
  mov r12, 0x8087E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8087E8 --
  mov r12, 0x8087E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8087EC --
  mov r12, 0x8087EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __ROR8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8087F0 --
  mov r12, 0x8087F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 8087F4 --
  mov r12, 0x8087F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __ADC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 5
  ; -- 8087F8 --
  mov r12, 0x8087F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 8087FC --
  mov r12, 0x8087FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __ADC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5

  global Label_808800
Label_808800:
  ; -- 808800 --
  mov r12, 0x808800
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_808814
  ; -- 808804 --
  mov r12, 0x808804
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_808818
  ; -- 808808 --
  mov r12, 0x808808
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_80881C
  ; -- 80880C --
  mov r12, 0x80880C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_808820
  ; -- 808810 --
  mov r12, 0x808810
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808814
Label_808814:
  ; -- 808814 --
  mov r12, 0x808814
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808818
Label_808818:
  ; -- 808818 --
  mov r12, 0x808818
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_80881C
Label_80881C:
  ; -- 80881C --
  mov r12, 0x80881C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_808820
Label_808820:
  ; -- 808820 --
  mov r12, 0x808820
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC35
  ; -- 808824 --
  mov r12, 0x808824
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC39
  ; -- 808828 --
  mov r12, 0x808828
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC3D
  ; -- 80882C --
  mov r12, 0x80882C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC41
  ; -- 808830 --
  mov r12, 0x808830
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808834 --
  mov r12, 0x808834
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808838 --
  mov r12, 0x808838
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80883C --
  mov r12, 0x80883C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808840 --
  mov r12, 0x808840
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808844 --
  mov r12, 0x808844
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808848 --
  mov r12, 0x808848
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80884C --
  mov r12, 0x80884C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808850 --
  mov r12, 0x808850
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808854 --
  mov r12, 0x808854
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808858 --
  mov r12, 0x808858
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80885C --
  mov r12, 0x80885C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808860 --
  mov r12, 0x808860
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808864 --
  mov r12, 0x808864
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808868 --
  mov r12, 0x808868
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80886C --
  mov r12, 0x80886C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808870 --
  mov r12, 0x808870
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808874 --
  mov r12, 0x808874
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808878 --
  mov r12, 0x808878
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 80887C --
  mov r12, 0x80887C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808880 --
  mov r12, 0x808880
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regY]
  dec ax
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 808884 --
  mov r12, 0x808884
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regY]
  dec ax
  mov word [rel regY], ax
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 808888 --
  mov r12, 0x808888
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regY]
  dec ax
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 80888C --
  mov r12, 0x80888C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regY]
  dec ax
  mov word [rel regY], ax
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 808890 --
  mov r12, 0x808890
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  and rcx, rdx
  cmp rcx, 0x0
  sete byte [rel Z_Flag]
  add qword [rel CycleCount], 3
  ; -- 808894 --
  mov r12, 0x808894
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  and rcx, rdx
  cmp rcx, 0x0
  sete byte [rel Z_Flag]
  add qword [rel CycleCount], 3
  ; -- 808898 --
  mov r12, 0x808898
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, 0x12
  and rcx, rdx
  cmp rcx, 0x0
  sete byte [rel Z_Flag]
  add qword [rel CycleCount], 2
  ; -- 80889C --
  mov r12, 0x80889C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, 0x12
  and rcx, rdx
  cmp rcx, 0x0
  sete byte [rel Z_Flag]
  add qword [rel CycleCount], 2
  ; -- 8088A0 --
  mov r12, 0x8088A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8088A4 --
  mov r12, 0x8088A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 8088A8 --
  mov r12, 0x8088A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8088AC --
  mov r12, 0x8088AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 8088B0 --
  mov r12, 0x8088B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8088B4 --
  mov r12, 0x8088B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8088B8 --
  mov r12, 0x8088B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8088BC --
  mov r12, 0x8088BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 8088C0 --
  mov r12, 0x8088C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regY]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088C4 --
  mov r12, 0x8088C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regY]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8088C8 --
  mov r12, 0x8088C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regY]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088CC --
  mov r12, 0x8088CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regY]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8088D0 --
  mov r12, 0x8088D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088D4 --
  mov r12, 0x8088D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088D8 --
  mov r12, 0x8088D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8088DC --
  mov r12, 0x8088DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8088E0 --
  mov r12, 0x8088E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regX]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088E4 --
  mov r12, 0x8088E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regX]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8088E8 --
  mov r12, 0x8088E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regX]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088EC --
  mov r12, 0x8088EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rdx, word [rel regX]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8088F0 --
  mov r12, 0x8088F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8088F4 --
  mov r12, 0x8088F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8088F8 --
  mov r12, 0x8088F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8088FC --
  mov r12, 0x8088FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808900 --
  mov r12, 0x808900
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_808914
  ; -- 808904 --
  mov r12, 0x808904
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_808918
  ; -- 808908 --
  mov r12, 0x808908
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_80891C
  ; -- 80890C --
  mov r12, 0x80890C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_808920
  ; -- 808910 --
  mov r12, 0x808910
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808914
Label_808914:
  ; -- 808914 --
  mov r12, 0x808914
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808918
Label_808918:
  ; -- 808918 --
  mov r12, 0x808918
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_80891C
Label_80891C:
  ; -- 80891C --
  mov r12, 0x80891C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_808920
Label_808920:
  ; -- 808920 --
  mov r12, 0x808920
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808924 --
  mov r12, 0x808924
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808928 --
  mov r12, 0x808928
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80892C --
  mov r12, 0x80892C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808930 --
  mov r12, 0x808930
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808934 --
  mov r12, 0x808934
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808938 --
  mov r12, 0x808938
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 80893C --
  mov r12, 0x80893C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808940 --
  mov r12, 0x808940
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808944 --
  mov r12, 0x808944
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808948 --
  mov r12, 0x808948
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80894C --
  mov r12, 0x80894C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regY]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808950 --
  mov r12, 0x808950
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808954 --
  mov r12, 0x808954
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808958 --
  mov r12, 0x808958
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80895C --
  mov r12, 0x80895C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808960 --
  mov r12, 0x808960
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808964 --
  mov r12, 0x808964
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808968 --
  mov r12, 0x808968
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 80896C --
  mov r12, 0x80896C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  movzx rdx, word [rel regX]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808970 --
  mov r12, 0x808970
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808974 --
  mov r12, 0x808974
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808978 --
  mov r12, 0x808978
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 80897C --
  mov r12, 0x80897C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808980 --
  mov r12, 0x808980
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 808984 --
  mov r12, 0x808984
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2
  ; -- 808988 --
  mov r12, 0x808988
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 80898C --
  mov r12, 0x80898C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 808990 --
  mov r12, 0x808990
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808994 --
  mov r12, 0x808994
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808998 --
  mov r12, 0x808998
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 80899C --
  mov r12, 0x80899C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089A0 --
  mov r12, 0x8089A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8089A4 --
  mov r12, 0x8089A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8089A8 --
  mov r12, 0x8089A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8089AC --
  mov r12, 0x8089AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2
  ; -- 8089B0 --
  mov r12, 0x8089B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 8089B4 --
  mov r12, 0x8089B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 8089B8 --
  mov r12, 0x8089B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 8089BC --
  mov r12, 0x8089BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 8089C0 --
  mov r12, 0x8089C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089C4 --
  mov r12, 0x8089C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089C8 --
  mov r12, 0x8089C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8089CC --
  mov r12, 0x8089CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 8089D0 --
  mov r12, 0x8089D0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8089D4 --
  mov r12, 0x8089D4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8089D8 --
  mov r12, 0x8089D8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089DC --
  mov r12, 0x8089DC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, byte [rel regA]
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089E0 --
  mov r12, 0x8089E0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8089E4 --
  mov r12, 0x8089E4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8089E8 --
  mov r12, 0x8089E8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089EC --
  mov r12, 0x8089EC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov rdx, 0x0
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089F0 --
  mov r12, 0x8089F0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8089F4 --
  mov r12, 0x8089F4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 8089F8 --
  mov r12, 0x8089F8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 8089FC --
  mov r12, 0x8089FC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  movzx rdx, word [rel regA]
  and rdx, 0xFF
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808A00 --
  mov r12, 0x808A00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regY], 0x3412
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 808A04 --
  mov r12, 0x808A04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regY], 0x12
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 808A08 --
  mov r12, 0x808A08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regY], 0x3412
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 808A0C --
  mov r12, 0x808A0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regY], 0x12
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 808A10 --
  mov r12, 0x808A10
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808A14 --
  mov r12, 0x808A14
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808A18 --
  mov r12, 0x808A18
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808A1C --
  mov r12, 0x808A1C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808A20 --
  mov r12, 0x808A20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regX], 0x3412
  call __UpdateNZ_X16
  add qword [rel CycleCount], 3
  ; -- 808A24 --
  mov r12, 0x808A24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regX], 0x12
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808A28 --
  mov r12, 0x808A28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regX], 0x3412
  call __UpdateNZ_X16
  add qword [rel CycleCount], 3
  ; -- 808A2C --
  mov r12, 0x808A2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regX], 0x12
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808A30 --
  mov r12, 0x808A30
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808A34 --
  mov r12, 0x808A34
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808A38 --
  mov r12, 0x808A38
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808A3C --
  mov r12, 0x808A3C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808A40 --
  mov r12, 0x808A40
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 3
  ; -- 808A44 --
  mov r12, 0x808A44
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 3
  ; -- 808A48 --
  mov r12, 0x808A48
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 3
  ; -- 808A4C --
  mov r12, 0x808A4C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 3
  ; -- 808A50 --
  mov r12, 0x808A50
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808A54 --
  mov r12, 0x808A54
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808A58 --
  mov r12, 0x808A58
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808A5C --
  mov r12, 0x808A5C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808A60 --
  mov r12, 0x808A60
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 4
  ; -- 808A64 --
  mov r12, 0x808A64
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 3
  ; -- 808A68 --
  mov r12, 0x808A68
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 4
  ; -- 808A6C --
  mov r12, 0x808A6C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 3
  ; -- 808A70 --
  mov r12, 0x808A70
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808A74 --
  mov r12, 0x808A74
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808A78 --
  mov r12, 0x808A78
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808A7C --
  mov r12, 0x808A7C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808A80 --
  mov r12, 0x808A80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 808A84 --
  mov r12, 0x808A84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 808A88 --
  mov r12, 0x808A88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2
  ; -- 808A8C --
  mov r12, 0x808A8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2
  ; -- 808A90 --
  mov r12, 0x808A90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regA], 0x3412
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808A94 --
  mov r12, 0x808A94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regA], 0x3412
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3
  ; -- 808A98 --
  mov r12, 0x808A98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regA], 0x12
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 808A9C --
  mov r12, 0x808A9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regA], 0x12
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2
  ; -- 808AA0 --
  mov r12, 0x808AA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808AA4 --
  mov r12, 0x808AA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808AA8 --
  mov r12, 0x808AA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808AAC --
  mov r12, 0x808AAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808AB0 --
  mov r12, 0x808AB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regDBR], al
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808AB4 --
  mov r12, 0x808AB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regDBR], al
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808AB8 --
  mov r12, 0x808AB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regDBR], al
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808ABC --
  mov r12, 0x808ABC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regDBR], al
  mov rcx, rax
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808AC0 --
  mov r12, 0x808AC0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 4
  ; -- 808AC4 --
  mov r12, 0x808AC4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 808AC8 --
  mov r12, 0x808AC8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 4
  ; -- 808ACC --
  mov r12, 0x808ACC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 808AD0 --
  mov r12, 0x808AD0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808AD4 --
  mov r12, 0x808AD4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808AD8 --
  mov r12, 0x808AD8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808ADC --
  mov r12, 0x808ADC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808AE0 --
  mov r12, 0x808AE0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 4
  ; -- 808AE4 --
  mov r12, 0x808AE4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808AE8 --
  mov r12, 0x808AE8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 4
  ; -- 808AEC --
  mov r12, 0x808AEC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808AF0 --
  mov r12, 0x808AF0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808AF4 --
  mov r12, 0x808AF4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808AF8 --
  mov r12, 0x808AF8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808AFC --
  mov r12, 0x808AFC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808B00 --
  mov r12, 0x808B00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B14
  ; -- 808B04 --
  mov r12, 0x808B04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B18
  ; -- 808B08 --
  mov r12, 0x808B08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B1C
  ; -- 808B0C --
  mov r12, 0x808B0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B20
  ; -- 808B10 --
  mov r12, 0x808B10
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6

  global Label_808B14
Label_808B14:
  ; -- 808B14 --
  mov r12, 0x808B14
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6

  global Label_808B18
Label_808B18:
  ; -- 808B18 --
  mov r12, 0x808B18
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_808B1C
Label_808B1C:
  ; -- 808B1C --
  mov r12, 0x808B1C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_808B20
Label_808B20:
  ; -- 808B20 --
  mov r12, 0x808B20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808B24 --
  mov r12, 0x808B24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 4
  ; -- 808B28 --
  mov r12, 0x808B28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808B2C --
  mov r12, 0x808B2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808B30 --
  mov r12, 0x808B30
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 8
  ; -- 808B34 --
  mov r12, 0x808B34
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 8
  ; -- 808B38 --
  mov r12, 0x808B38
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 7
  ; -- 808B3C --
  mov r12, 0x808B3C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  movzx rax, byte [rel regDBR]
  shl rax, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 7
  ; -- 808B40 --
  mov r12, 0x808B40
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 5
  ; -- 808B44 --
  mov r12, 0x808B44
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 808B48 --
  mov r12, 0x808B48
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 5
  ; -- 808B4C --
  mov r12, 0x808B4C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 808B50 --
  mov r12, 0x808B50
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16

  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808B54 --
  mov r12, 0x808B54
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16

  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808B58 --
  mov r12, 0x808B58
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8

  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808B5C --
  mov r12, 0x808B5C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8

  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808B60 --
  mov r12, 0x808B60
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 5
  ; -- 808B64 --
  mov r12, 0x808B64
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808B68 --
  mov r12, 0x808B68
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 5
  ; -- 808B6C --
  mov r12, 0x808B6C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808B70 --
  mov r12, 0x808B70
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808B74 --
  mov r12, 0x808B74
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808B78 --
  mov r12, 0x808B78
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808B7C --
  mov r12, 0x808B7C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808B80 --
  mov r12, 0x808B80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808B84 --
  mov r12, 0x808B84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808B88 --
  mov r12, 0x808B88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808B8C --
  mov r12, 0x808B8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808B90 --
  mov r12, 0x808B90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808B94 --
  mov r12, 0x808B94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808B98 --
  mov r12, 0x808B98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808B9C --
  mov r12, 0x808B9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808BA0 --
  mov r12, 0x808BA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808BA4 --
  mov r12, 0x808BA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  and rax, 0xFF
  mov word [rel regX], ax
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808BA8 --
  mov r12, 0x808BA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808BAC --
  mov r12, 0x808BAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  and rax, 0xFF
  mov word [rel regX], ax
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808BB0 --
  mov r12, 0x808BB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808BB4 --
  mov r12, 0x808BB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808BB8 --
  mov r12, 0x808BB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808BBC --
  mov r12, 0x808BBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808BC0 --
  mov r12, 0x808BC0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 5
  ; -- 808BC4 --
  mov r12, 0x808BC4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 808BC8 --
  mov r12, 0x808BC8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 5
  ; -- 808BCC --
  mov r12, 0x808BCC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 4
  ; -- 808BD0 --
  mov r12, 0x808BD0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808BD4 --
  mov r12, 0x808BD4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 5
  ; -- 808BD8 --
  mov r12, 0x808BD8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808BDC --
  mov r12, 0x808BDC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 4
  ; -- 808BE0 --
  mov r12, 0x808BE0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 5
  ; -- 808BE4 --
  mov r12, 0x808BE4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808BE8 --
  mov r12, 0x808BE8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 5
  ; -- 808BEC --
  mov r12, 0x808BEC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808BF0 --
  mov r12, 0x808BF0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808BF4 --
  mov r12, 0x808BF4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 6
  ; -- 808BF8 --
  mov r12, 0x808BF8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5
  ; -- 808BFC --
  mov r12, 0x808BFC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 5

  global Label_808C00
Label_808C00:
  ; -- 808C00 --
  mov r12, 0x808C00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  mov rdx, 0x3412
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C04 --
  mov r12, 0x808C04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  mov rdx, 0x12
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808C08 --
  mov r12, 0x808C08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  mov rdx, 0x3412
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C0C --
  mov r12, 0x808C0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  mov rdx, 0x12
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808C10 --
  mov r12, 0x808C10
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808C14 --
  mov r12, 0x808C14
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808C18 --
  mov r12, 0x808C18
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808C1C --
  mov r12, 0x808C1C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808C20 --
  mov r12, 0x808C20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __REP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C24 --
  mov r12, 0x808C24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __REP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C28 --
  mov r12, 0x808C28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __REP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C2C --
  mov r12, 0x808C2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __REP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C30 --
  mov r12, 0x808C30
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808C34 --
  mov r12, 0x808C34
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808C38 --
  mov r12, 0x808C38
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808C3C --
  mov r12, 0x808C3C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808C40 --
  mov r12, 0x808C40
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808C44 --
  mov r12, 0x808C44
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regY]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C48 --
  mov r12, 0x808C48
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808C4C --
  mov r12, 0x808C4C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regY]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C50 --
  mov r12, 0x808C50
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808C54 --
  mov r12, 0x808C54
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808C58 --
  mov r12, 0x808C58
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C5C --
  mov r12, 0x808C5C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C60 --
  mov r12, 0x808C60
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808C64 --
  mov r12, 0x808C64
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808C68 --
  mov r12, 0x808C68
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808C6C --
  mov r12, 0x808C6C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808C70 --
  mov r12, 0x808C70
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808C74 --
  mov r12, 0x808C74
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808C78 --
  mov r12, 0x808C78
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808C7C --
  mov r12, 0x808C7C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808C80 --
  mov r12, 0x808C80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov word [rel regY], ax
  add qword [rel CycleCount], 2
  ; -- 808C84 --
  mov r12, 0x808C84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regY]
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov byte [rel regY], al
  add qword [rel CycleCount], 2
  ; -- 808C88 --
  mov r12, 0x808C88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov word [rel regY], ax
  add qword [rel CycleCount], 2
  ; -- 808C8C --
  mov r12, 0x808C8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regY]
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov byte [rel regY], al
  add qword [rel CycleCount], 2
  ; -- 808C90 --
  mov r12, 0x808C90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C94 --
  mov r12, 0x808C94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808C98 --
  mov r12, 0x808C98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x12
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808C9C --
  mov r12, 0x808C9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x12
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808CA0 --
  mov r12, 0x808CA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regX]
  dec ax
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808CA4 --
  mov r12, 0x808CA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regX]
  dec ax
  mov word [rel regX], ax
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808CA8 --
  mov r12, 0x808CA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regX]
  dec ax
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2
  ; -- 808CAC --
  mov r12, 0x808CAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regX]
  dec ax
  mov word [rel regX], ax
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2
  ; -- 808CB0 --
  mov r12, 0x808CB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI
  ; -- 808CB4 --
  mov r12, 0x808CB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI
  ; -- 808CB8 --
  mov r12, 0x808CB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI
  ; -- 808CBC --
  mov r12, 0x808CBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI
  ; -- 808CC0 --
  mov r12, 0x808CC0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808CC4 --
  mov r12, 0x808CC4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regY]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808CC8 --
  mov r12, 0x808CC8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regY]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808CCC --
  mov r12, 0x808CCC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regY]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808CD0 --
  mov r12, 0x808CD0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808CD4 --
  mov r12, 0x808CD4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808CD8 --
  mov r12, 0x808CD8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808CDC --
  mov r12, 0x808CDC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808CE0 --
  mov r12, 0x808CE0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808CE4 --
  mov r12, 0x808CE4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808CE8 --
  mov r12, 0x808CE8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808CEC --
  mov r12, 0x808CEC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808CF0 --
  mov r12, 0x808CF0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808CF4 --
  mov r12, 0x808CF4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808CF8 --
  mov r12, 0x808CF8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808CFC --
  mov r12, 0x808CFC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D00 --
  mov r12, 0x808D00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D14
  ; -- 808D04 --
  mov r12, 0x808D04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D18
  ; -- 808D08 --
  mov r12, 0x808D08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D1C
  ; -- 808D0C --
  mov r12, 0x808D0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D20
  ; -- 808D10 --
  mov r12, 0x808D10
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7

  global Label_808D14
Label_808D14:
  ; -- 808D14 --
  mov r12, 0x808D14
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7

  global Label_808D18
Label_808D18:
  ; -- 808D18 --
  mov r12, 0x808D18
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6

  global Label_808D1C
Label_808D1C:
  ; -- 808D1C --
  mov r12, 0x808D1C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6

  global Label_808D20
Label_808D20:
  ; -- 808D20 --
  mov r12, 0x808D20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808D24 --
  mov r12, 0x808D24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808D28 --
  mov r12, 0x808D28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D2C --
  mov r12, 0x808D2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D30 --
  mov r12, 0x808D30
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808D34 --
  mov r12, 0x808D34
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808D38 --
  mov r12, 0x808D38
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808D3C --
  mov r12, 0x808D3C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808D40 --
  mov r12, 0x808D40
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D44 --
  mov r12, 0x808D44
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D48 --
  mov r12, 0x808D48
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D4C --
  mov r12, 0x808D4C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D50 --
  mov r12, 0x808D50
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808D54 --
  mov r12, 0x808D54
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808D58 --
  mov r12, 0x808D58
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808D5C --
  mov r12, 0x808D5C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808D60 --
  mov r12, 0x808D60
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808D64 --
  mov r12, 0x808D64
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808D68 --
  mov r12, 0x808D68
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D6C --
  mov r12, 0x808D6C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D70 --
  mov r12, 0x808D70
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808D74 --
  mov r12, 0x808D74
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808D78 --
  mov r12, 0x808D78
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D7C --
  mov r12, 0x808D7C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D80 --
  mov r12, 0x808D80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808D84 --
  mov r12, 0x808D84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808D88 --
  mov r12, 0x808D88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808D8C --
  mov r12, 0x808D8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2
  ; -- 808D90 --
  mov r12, 0x808D90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D94 --
  mov r12, 0x808D94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808D98 --
  mov r12, 0x808D98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808D9C --
  mov r12, 0x808D9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808DA0 --
  mov r12, 0x808DA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808DA4 --
  mov r12, 0x808DA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808DA8 --
  mov r12, 0x808DA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808DAC --
  mov r12, 0x808DAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808DB0 --
  mov r12, 0x808DB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DB0
  mov rdx, 0xDB123456
  call __PRINT_INS
  ; -- 808DB4 --
  mov r12, 0x808DB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DB4
  mov rdx, 0xDB123456
  call __PRINT_INS
  ; -- 808DB8 --
  mov r12, 0x808DB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DB8
  mov rdx, 0xDB123456
  call __PRINT_INS
  ; -- 808DBC --
  mov r12, 0x808DBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DBC
  mov rdx, 0xDB123456
  call __PRINT_INS
  ; -- 808DC0 --
  mov r12, 0x808DC0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808DC0
  jmp __CALL_ADDRESS
  ; -- 808DC4 --
  mov r12, 0x808DC4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808DC4
  jmp __CALL_ADDRESS
  ; -- 808DC8 --
  mov r12, 0x808DC8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808DC8
  jmp __CALL_ADDRESS
  ; -- 808DCC --
  mov r12, 0x808DCC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  mov rcx, 0x3412
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808DCC
  jmp __CALL_ADDRESS
  ; -- 808DD0 --
  mov r12, 0x808DD0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808DD4 --
  mov r12, 0x808DD4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808DD8 --
  mov r12, 0x808DD8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808DDC --
  mov r12, 0x808DDC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808DE0 --
  mov r12, 0x808DE0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808DE4 --
  mov r12, 0x808DE4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808DE8 --
  mov r12, 0x808DE8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808DEC --
  mov r12, 0x808DEC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  sub rax, 0x1
  mov rcx, r12
  mov rdx, rax
  mov rbx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  mov rcx, rbx
  sub rsp, 32
  call __TESTNZ8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808DF0 --
  mov r12, 0x808DF0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808DF4 --
  mov r12, 0x808DF4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regA]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808DF8 --
  mov r12, 0x808DF8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808DFC --
  mov r12, 0x808DFC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regA]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808E00 --
  mov r12, 0x808E00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  mov rdx, 0x3412
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E04 --
  mov r12, 0x808E04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  mov rdx, 0x12
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808E08 --
  mov r12, 0x808E08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  mov rdx, 0x3412
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E0C --
  mov r12, 0x808E0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  mov rdx, 0x12
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808E10 --
  mov r12, 0x808E10
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808E14 --
  mov r12, 0x808E14
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 7
  ; -- 808E18 --
  mov r12, 0x808E18
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808E1C --
  mov r12, 0x808E1C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 6
  ; -- 808E20 --
  mov r12, 0x808E20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __SEP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E24 --
  mov r12, 0x808E24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __SEP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E28 --
  mov r12, 0x808E28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __SEP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E2C --
  mov r12, 0x808E2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x12
  sub rsp, 32
  call __SEP
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E30 --
  mov r12, 0x808E30
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 808E34 --
  mov r12, 0x808E34
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 4
  ; -- 808E38 --
  mov r12, 0x808E38
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 808E3C --
  mov r12, 0x808E3C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 4
  ; -- 808E40 --
  mov r12, 0x808E40
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808E44 --
  mov r12, 0x808E44
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regX]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E48 --
  mov r12, 0x808E48
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808E4C --
  mov r12, 0x808E4C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regX]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E50 --
  mov r12, 0x808E50
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808E54 --
  mov r12, 0x808E54
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808E58 --
  mov r12, 0x808E58
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808E5C --
  mov r12, 0x808E5C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808E60 --
  mov r12, 0x808E60
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E64 --
  mov r12, 0x808E64
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 3
  ; -- 808E68 --
  mov r12, 0x808E68
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808E6C --
  mov r12, 0x808E6C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808E70 --
  mov r12, 0x808E70
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808E74 --
  mov r12, 0x808E74
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808E78 --
  mov r12, 0x808E78
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808E7C --
  mov r12, 0x808E7C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808E80 --
  mov r12, 0x808E80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov word [rel regX], ax
  add qword [rel CycleCount], 2
  ; -- 808E84 --
  mov r12, 0x808E84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regX]
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov byte [rel regX], al
  add qword [rel CycleCount], 2
  ; -- 808E88 --
  mov r12, 0x808E88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov word [rel regX], ax
  add qword [rel CycleCount], 2
  ; -- 808E8C --
  mov r12, 0x808E8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regX]
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov byte [rel regX], al
  add qword [rel CycleCount], 2
  ; -- 808E90 --
  mov r12, 0x808E90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 3
  ; -- 808E94 --
  mov r12, 0x808E94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x3412
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 3
  ; -- 808E98 --
  mov r12, 0x808E98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x12
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 808E9C --
  mov r12, 0x808E9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, 0x12
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 2
  ; -- 808EA0 --
  mov r12, 0x808EA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2
  ; -- 808EA4 --
  mov r12, 0x808EA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2
  ; -- 808EA8 --
  mov r12, 0x808EA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2
  ; -- 808EAC --
  mov r12, 0x808EAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2
  ; -- 808EB0 --
  mov r12, 0x808EB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regA]
  mov bl, al
  mov al, ah
  mov ah, bl
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808EB4 --
  mov r12, 0x808EB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regA]
  mov bl, al
  mov al, ah
  mov ah, bl
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808EB8 --
  mov r12, 0x808EB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regA]
  mov bl, al
  mov al, ah
  mov ah, bl
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808EBC --
  mov r12, 0x808EBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov ax, word [rel regA]
  mov bl, al
  mov al, ah
  mov ah, bl
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3
  ; -- 808EC0 --
  mov r12, 0x808EC0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808EC4 --
  mov r12, 0x808EC4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regX]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808EC8 --
  mov r12, 0x808EC8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rdx, rax
  movzx rcx, word [rel regX]
  sub rsp, 32
  call __COMPARE16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808ECC --
  mov r12, 0x808ECC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rdx, rax
  movzx rcx, byte [rel regX]
  sub rsp, 32
  call __COMPARE8
  add rsp, 32
  add qword [rel CycleCount], 4
  ; -- 808ED0 --
  mov r12, 0x808ED0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808ED4 --
  mov r12, 0x808ED4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808ED8 --
  mov r12, 0x808ED8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808EDC --
  mov r12, 0x808EDC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808EE0 --
  mov r12, 0x808EE0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808EE4 --
  mov r12, 0x808EE4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808EE8 --
  mov r12, 0x808EE8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808EEC --
  mov r12, 0x808EEC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808EF0 --
  mov r12, 0x808EF0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808EF4 --
  mov r12, 0x808EF4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808EF8 --
  mov r12, 0x808EF8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808EFC --
  mov r12, 0x808EFC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808F00 --
  mov r12, 0x808F00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F14
  ; -- 808F04 --
  mov r12, 0x808F04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F18
  ; -- 808F08 --
  mov r12, 0x808F08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F1C
  ; -- 808F0C --
  mov r12, 0x808F0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F20
  ; -- 808F10 --
  mov r12, 0x808F10
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6

  global Label_808F14
Label_808F14:
  ; -- 808F14 --
  mov r12, 0x808F14
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6

  global Label_808F18
Label_808F18:
  ; -- 808F18 --
  mov r12, 0x808F18
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5

  global Label_808F1C
Label_808F1C:
  ; -- 808F1C --
  mov r12, 0x808F1C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5

  global Label_808F20
Label_808F20:
  ; -- 808F20 --
  mov r12, 0x808F20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808F24 --
  mov r12, 0x808F24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808F28 --
  mov r12, 0x808F28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808F2C --
  mov r12, 0x808F2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808F30 --
  mov r12, 0x808F30
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  ; -- 808F34 --
  mov r12, 0x808F34
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  ; -- 808F38 --
  mov r12, 0x808F38
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  ; -- 808F3C --
  mov r12, 0x808F3C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regS]
  add rcx, 0x12
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  ; -- 808F40 --
  mov r12, 0x808F40
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x3412
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808F44 --
  mov r12, 0x808F44
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x3412
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808F48 --
  mov r12, 0x808F48
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x3412
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808F4C --
  mov r12, 0x808F4C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x3412
  sub rsp, 32
  call __PUSH16
  add rsp, 32
  add qword [rel CycleCount], 5
  ; -- 808F50 --
  mov r12, 0x808F50
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808F54 --
  mov r12, 0x808F54
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808F58 --
  mov r12, 0x808F58
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808F5C --
  mov r12, 0x808F5C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808F60 --
  mov r12, 0x808F60
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808F64 --
  mov r12, 0x808F64
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, byte [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808F68 --
  mov r12, 0x808F68
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808F6C --
  mov r12, 0x808F6C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  movzx rax, byte [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 6
  ; -- 808F70 --
  mov r12, 0x808F70
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808F74 --
  mov r12, 0x808F74
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 7
  ; -- 808F78 --
  mov r12, 0x808F78
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808F7C --
  mov r12, 0x808F7C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, word [rel regDP]
  add rcx, 0x12
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ24
  add rsp, 32
  mov rcx, rax
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 6
  ; -- 808F80 --
  mov r12, 0x808F80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808F84 --
  mov r12, 0x808F84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808F88 --
  mov r12, 0x808F88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808F8C --
  mov r12, 0x808F8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2
  ; -- 808F90 --
  mov r12, 0x808F90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808F94 --
  mov r12, 0x808F94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808F98 --
  mov r12, 0x808F98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808F9C --
  mov r12, 0x808F9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regY]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808FA0 --
  mov r12, 0x808FA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 5
  ; -- 808FA4 --
  mov r12, 0x808FA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808FA8 --
  mov r12, 0x808FA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL16
  add rsp, 32
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 5
  ; -- 808FAC --
  mov r12, 0x808FAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 4
  ; -- 808FB0 --
  mov r12, 0x808FB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808FB4 --
  mov r12, 0x808FB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808FB8 --
  mov r12, 0x808FB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808FBC --
  mov r12, 0x808FBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2
  ; -- 808FC0 --
  mov r12, 0x808FC0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, 0x800000
  or rcx, rax
  mov r12, rcx
  mov rcx, 0x8F
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0xC2
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, r12
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808FC0
  jmp __CALL_ADDRESS
  ; -- 808FC4 --
  mov r12, 0x808FC4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, 0x800000
  or rcx, rax
  mov r12, rcx
  mov rcx, 0x8F
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0xC6
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, r12
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808FC4
  jmp __CALL_ADDRESS
  ; -- 808FC8 --
  mov r12, 0x808FC8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, 0x800000
  or rcx, rax
  mov r12, rcx
  mov rcx, 0x8F
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0xCA
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, r12
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808FC8
  jmp __CALL_ADDRESS
  ; -- 808FCC --
  mov r12, 0x808FCC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  mov rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  and rcx, 0xFFFF
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, 0x800000
  or rcx, rax
  mov r12, rcx
  mov rcx, 0x8F
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, 0xCE
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, r12
  sub rsp, 32
  call pc_map
  add rsp, 32
  mov rcx, rax
  mov rbx, 0x808FCC
  jmp __CALL_ADDRESS
  ; -- 808FD0 --
  mov r12, 0x808FD0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808FD4 --
  mov r12, 0x808FD4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808FD8 --
  mov r12, 0x808FD8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808FDC --
  mov r12, 0x808FDC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808FE0 --
  mov r12, 0x808FE0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 8
  ; -- 808FE4 --
  mov r12, 0x808FE4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC16
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE16
  add rsp, 32
  add qword [rel CycleCount], 8
  ; -- 808FE8 --
  mov r12, 0x808FE8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808FEC --
  mov r12, 0x808FEC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rcx, byte [rel regDBR]
  shl rcx, 16
  add rcx, 0x3412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  mov r12, rcx
  sub rsp, 32
  call __READ8
  add rsp, 32
  mov rcx, rax
  sub rsp, 32
  call __INC8
  add rsp, 32
  mov rcx, r12
  mov rdx, rax
  sub rsp, 32
  call __WRITE8
  add rsp, 32
  add qword [rel CycleCount], 7
  ; -- 808FF0 --
  mov r12, 0x808FF0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808FF4 --
  mov r12, 0x808FF4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ16
  add rsp, 32
  movzx rcx, word [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC16
  add rsp, 32
  mov word [rel regA], ax
  add qword [rel CycleCount], 6
  ; -- 808FF8 --
  mov r12, 0x808FF8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
  ; -- 808FFC --
  mov r12, 0x808FFC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov rcx, 0x563412
  movzx rax, word [rel regX]
  and rax, 0xFF
  add rcx, rax
  sub rsp, 32
  call __READ8
  add rsp, 32
  movzx rcx, byte [rel regA]
  mov rdx, rax
  sub rsp, 32
  call __SBC8
  add rsp, 32
  mov byte [rel regA], al
  add qword [rel CycleCount], 5
