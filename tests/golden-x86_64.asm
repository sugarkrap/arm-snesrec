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
  cmp rcx, 0x808800
  jae .hi_0
  cmp rcx, 0x808400
  jae .hi_1
  cmp rcx, 0x808200
  jae .hi_2
  cmp rcx, 0x808100
  jae .hi_3
  cmp rcx, 0x808080
  jae .hi_4
  cmp rcx, 0x808040
  jae .hi_5
  cmp rcx, 0x808020
  jae .hi_6
  cmp rcx, 0x808010
  jae .hi_7
  cmp rcx, 0x808000
  jne .next_8
  jmp Label_808000
.next_8:
  cmp rcx, 0x808004
  jne .next_9
  jmp Label_808004
.next_9:
  cmp rcx, 0x808008
  jne .next_10
  jmp Label_808008
.next_10:
  cmp rcx, 0x80800C
  jne .next_11
  jmp Label_80800C
.next_11:
  jmp .miss_7
.hi_7:
  cmp rcx, 0x808010
  jne .next_12
  jmp Label_808010
.next_12:
  cmp rcx, 0x808014
  jne .next_13
  jmp Label_808014
.next_13:
  cmp rcx, 0x808018
  jne .next_14
  jmp Label_808018
.next_14:
  cmp rcx, 0x80801C
  jne .next_15
  jmp Label_80801C
.next_15:
.miss_7:
  jmp .miss_6
.hi_6:
  cmp rcx, 0x808030
  jae .hi_16
  cmp rcx, 0x808020
  jne .next_17
  jmp Label_808020
.next_17:
  cmp rcx, 0x808024
  jne .next_18
  jmp Label_808024
.next_18:
  cmp rcx, 0x808028
  jne .next_19
  jmp Label_808028
.next_19:
  cmp rcx, 0x80802C
  jne .next_20
  jmp Label_80802C
.next_20:
  jmp .miss_16
.hi_16:
  cmp rcx, 0x808030
  jne .next_21
  jmp Label_808030
.next_21:
  cmp rcx, 0x808034
  jne .next_22
  jmp Label_808034
.next_22:
  cmp rcx, 0x808038
  jne .next_23
  jmp Label_808038
.next_23:
  cmp rcx, 0x80803C
  jne .next_24
  jmp Label_80803C
.next_24:
.miss_16:
.miss_6:
  jmp .miss_5
.hi_5:
  cmp rcx, 0x808060
  jae .hi_25
  cmp rcx, 0x808050
  jae .hi_26
  cmp rcx, 0x808040
  jne .next_27
  jmp Label_808040
.next_27:
  cmp rcx, 0x808044
  jne .next_28
  jmp Label_808044
.next_28:
  cmp rcx, 0x808048
  jne .next_29
  jmp Label_808048
.next_29:
  cmp rcx, 0x80804C
  jne .next_30
  jmp Label_80804C
.next_30:
  jmp .miss_26
.hi_26:
  cmp rcx, 0x808050
  jne .next_31
  jmp Label_808050
.next_31:
  cmp rcx, 0x808054
  jne .next_32
  jmp Label_808054
.next_32:
  cmp rcx, 0x808058
  jne .next_33
  jmp Label_808058
.next_33:
  cmp rcx, 0x80805C
  jne .next_34
  jmp Label_80805C
.next_34:
.miss_26:
  jmp .miss_25
.hi_25:
  cmp rcx, 0x808070
  jae .hi_35
  cmp rcx, 0x808060
  jne .next_36
  jmp Label_808060
.next_36:
  cmp rcx, 0x808064
  jne .next_37
  jmp Label_808064
.next_37:
  cmp rcx, 0x808068
  jne .next_38
  jmp Label_808068
.next_38:
  cmp rcx, 0x80806C
  jne .next_39
  jmp Label_80806C
.next_39:
  jmp .miss_35
.hi_35:
  cmp rcx, 0x808070
  jne .next_40
  jmp Label_808070
.next_40:
  cmp rcx, 0x808074
  jne .next_41
  jmp Label_808074
.next_41:
  cmp rcx, 0x808078
  jne .next_42
  jmp Label_808078
.next_42:
  cmp rcx, 0x80807C
  jne .next_43
  jmp Label_80807C
.next_43:
.miss_35:
.miss_25:
.miss_5:
  jmp .miss_4
.hi_4:
  cmp rcx, 0x8080C0
  jae .hi_44
  cmp rcx, 0x8080A0
  jae .hi_45
  cmp rcx, 0x808090
  jae .hi_46
  cmp rcx, 0x808080
  jne .next_47
  jmp Label_808080
.next_47:
  cmp rcx, 0x808084
  jne .next_48
  jmp Label_808084
.next_48:
  cmp rcx, 0x808088
  jne .next_49
  jmp Label_808088
.next_49:
  cmp rcx, 0x80808C
  jne .next_50
  jmp Label_80808C
.next_50:
  jmp .miss_46
.hi_46:
  cmp rcx, 0x808090
  jne .next_51
  jmp Label_808090
.next_51:
  cmp rcx, 0x808094
  jne .next_52
  jmp Label_808094
.next_52:
  cmp rcx, 0x808098
  jne .next_53
  jmp Label_808098
.next_53:
  cmp rcx, 0x80809C
  jne .next_54
  jmp Label_80809C
.next_54:
.miss_46:
  jmp .miss_45
.hi_45:
  cmp rcx, 0x8080B0
  jae .hi_55
  cmp rcx, 0x8080A0
  jne .next_56
  jmp Label_8080A0
.next_56:
  cmp rcx, 0x8080A4
  jne .next_57
  jmp Label_8080A4
.next_57:
  cmp rcx, 0x8080A8
  jne .next_58
  jmp Label_8080A8
.next_58:
  cmp rcx, 0x8080AC
  jne .next_59
  jmp Label_8080AC
.next_59:
  jmp .miss_55
.hi_55:
  cmp rcx, 0x8080B0
  jne .next_60
  jmp Label_8080B0
.next_60:
  cmp rcx, 0x8080B4
  jne .next_61
  jmp Label_8080B4
.next_61:
  cmp rcx, 0x8080B8
  jne .next_62
  jmp Label_8080B8
.next_62:
  cmp rcx, 0x8080BC
  jne .next_63
  jmp Label_8080BC
.next_63:
.miss_55:
.miss_45:
  jmp .miss_44
.hi_44:
  cmp rcx, 0x8080E0
  jae .hi_64
  cmp rcx, 0x8080D0
  jae .hi_65
  cmp rcx, 0x8080C0
  jne .next_66
  jmp Label_8080C0
.next_66:
  cmp rcx, 0x8080C4
  jne .next_67
  jmp Label_8080C4
.next_67:
  cmp rcx, 0x8080C8
  jne .next_68
  jmp Label_8080C8
.next_68:
  cmp rcx, 0x8080CC
  jne .next_69
  jmp Label_8080CC
.next_69:
  jmp .miss_65
.hi_65:
  cmp rcx, 0x8080D0
  jne .next_70
  jmp Label_8080D0
.next_70:
  cmp rcx, 0x8080D4
  jne .next_71
  jmp Label_8080D4
.next_71:
  cmp rcx, 0x8080D8
  jne .next_72
  jmp Label_8080D8
.next_72:
  cmp rcx, 0x8080DC
  jne .next_73
  jmp Label_8080DC
.next_73:
.miss_65:
  jmp .miss_64
.hi_64:
  cmp rcx, 0x8080F0
  jae .hi_74
  cmp rcx, 0x8080E0
  jne .next_75
  jmp Label_8080E0
.next_75:
  cmp rcx, 0x8080E4
  jne .next_76
  jmp Label_8080E4
.next_76:
  cmp rcx, 0x8080E8
  jne .next_77
  jmp Label_8080E8
.next_77:
  cmp rcx, 0x8080EC
  jne .next_78
  jmp Label_8080EC
.next_78:
  jmp .miss_74
.hi_74:
  cmp rcx, 0x8080F0
  jne .next_79
  jmp Label_8080F0
.next_79:
  cmp rcx, 0x8080F4
  jne .next_80
  jmp Label_8080F4
.next_80:
  cmp rcx, 0x8080F8
  jne .next_81
  jmp Label_8080F8
.next_81:
  cmp rcx, 0x8080FC
  jne .next_82
  jmp Label_8080FC
.next_82:
.miss_74:
.miss_64:
.miss_44:
.miss_4:
  jmp .miss_3
.hi_3:
  cmp rcx, 0x808180
  jae .hi_83
  cmp rcx, 0x808140
  jae .hi_84
  cmp rcx, 0x808120
  jae .hi_85
  cmp rcx, 0x808110
  jae .hi_86
  cmp rcx, 0x808100
  jne .next_87
  jmp Label_808100
.next_87:
  cmp rcx, 0x808104
  jne .next_88
  jmp Label_808104
.next_88:
  cmp rcx, 0x808108
  jne .next_89
  jmp Label_808108
.next_89:
  cmp rcx, 0x80810C
  jne .next_90
  jmp Label_80810C
.next_90:
  jmp .miss_86
.hi_86:
  cmp rcx, 0x808110
  jne .next_91
  jmp Label_808110
.next_91:
  cmp rcx, 0x808114
  jne .next_92
  jmp Label_808114
.next_92:
  cmp rcx, 0x808118
  jne .next_93
  jmp Label_808118
.next_93:
  cmp rcx, 0x80811C
  jne .next_94
  jmp Label_80811C
.next_94:
.miss_86:
  jmp .miss_85
.hi_85:
  cmp rcx, 0x808130
  jae .hi_95
  cmp rcx, 0x808120
  jne .next_96
  jmp Label_808120
.next_96:
  cmp rcx, 0x808124
  jne .next_97
  jmp Label_808124
.next_97:
  cmp rcx, 0x808128
  jne .next_98
  jmp Label_808128
.next_98:
  cmp rcx, 0x80812C
  jne .next_99
  jmp Label_80812C
.next_99:
  jmp .miss_95
.hi_95:
  cmp rcx, 0x808130
  jne .next_100
  jmp Label_808130
.next_100:
  cmp rcx, 0x808134
  jne .next_101
  jmp Label_808134
.next_101:
  cmp rcx, 0x808138
  jne .next_102
  jmp Label_808138
.next_102:
  cmp rcx, 0x80813C
  jne .next_103
  jmp Label_80813C
.next_103:
.miss_95:
.miss_85:
  jmp .miss_84
.hi_84:
  cmp rcx, 0x808160
  jae .hi_104
  cmp rcx, 0x808150
  jae .hi_105
  cmp rcx, 0x808140
  jne .next_106
  jmp Label_808140
.next_106:
  cmp rcx, 0x808144
  jne .next_107
  jmp Label_808144
.next_107:
  cmp rcx, 0x808148
  jne .next_108
  jmp Label_808148
.next_108:
  cmp rcx, 0x80814C
  jne .next_109
  jmp Label_80814C
.next_109:
  jmp .miss_105
.hi_105:
  cmp rcx, 0x808150
  jne .next_110
  jmp Label_808150
.next_110:
  cmp rcx, 0x808154
  jne .next_111
  jmp Label_808154
.next_111:
  cmp rcx, 0x808158
  jne .next_112
  jmp Label_808158
.next_112:
  cmp rcx, 0x80815C
  jne .next_113
  jmp Label_80815C
.next_113:
.miss_105:
  jmp .miss_104
.hi_104:
  cmp rcx, 0x808170
  jae .hi_114
  cmp rcx, 0x808160
  jne .next_115
  jmp Label_808160
.next_115:
  cmp rcx, 0x808164
  jne .next_116
  jmp Label_808164
.next_116:
  cmp rcx, 0x808168
  jne .next_117
  jmp Label_808168
.next_117:
  cmp rcx, 0x80816C
  jne .next_118
  jmp Label_80816C
.next_118:
  jmp .miss_114
.hi_114:
  cmp rcx, 0x808170
  jne .next_119
  jmp Label_808170
.next_119:
  cmp rcx, 0x808174
  jne .next_120
  jmp Label_808174
.next_120:
  cmp rcx, 0x808178
  jne .next_121
  jmp Label_808178
.next_121:
  cmp rcx, 0x80817C
  jne .next_122
  jmp Label_80817C
.next_122:
.miss_114:
.miss_104:
.miss_84:
  jmp .miss_83
.hi_83:
  cmp rcx, 0x8081C0
  jae .hi_123
  cmp rcx, 0x8081A0
  jae .hi_124
  cmp rcx, 0x808190
  jae .hi_125
  cmp rcx, 0x808180
  jne .next_126
  jmp Label_808180
.next_126:
  cmp rcx, 0x808184
  jne .next_127
  jmp Label_808184
.next_127:
  cmp rcx, 0x808188
  jne .next_128
  jmp Label_808188
.next_128:
  cmp rcx, 0x80818C
  jne .next_129
  jmp Label_80818C
.next_129:
  jmp .miss_125
.hi_125:
  cmp rcx, 0x808190
  jne .next_130
  jmp Label_808190
.next_130:
  cmp rcx, 0x808194
  jne .next_131
  jmp Label_808194
.next_131:
  cmp rcx, 0x808198
  jne .next_132
  jmp Label_808198
.next_132:
  cmp rcx, 0x80819C
  jne .next_133
  jmp Label_80819C
.next_133:
.miss_125:
  jmp .miss_124
.hi_124:
  cmp rcx, 0x8081B0
  jae .hi_134
  cmp rcx, 0x8081A0
  jne .next_135
  jmp Label_8081A0
.next_135:
  cmp rcx, 0x8081A4
  jne .next_136
  jmp Label_8081A4
.next_136:
  cmp rcx, 0x8081A8
  jne .next_137
  jmp Label_8081A8
.next_137:
  cmp rcx, 0x8081AC
  jne .next_138
  jmp Label_8081AC
.next_138:
  jmp .miss_134
.hi_134:
  cmp rcx, 0x8081B0
  jne .next_139
  jmp Label_8081B0
.next_139:
  cmp rcx, 0x8081B4
  jne .next_140
  jmp Label_8081B4
.next_140:
  cmp rcx, 0x8081B8
  jne .next_141
  jmp Label_8081B8
.next_141:
  cmp rcx, 0x8081BC
  jne .next_142
  jmp Label_8081BC
.next_142:
.miss_134:
.miss_124:
  jmp .miss_123
.hi_123:
  cmp rcx, 0x8081E0
  jae .hi_143
  cmp rcx, 0x8081D0
  jae .hi_144
  cmp rcx, 0x8081C0
  jne .next_145
  jmp Label_8081C0
.next_145:
  cmp rcx, 0x8081C4
  jne .next_146
  jmp Label_8081C4
.next_146:
  cmp rcx, 0x8081C8
  jne .next_147
  jmp Label_8081C8
.next_147:
  cmp rcx, 0x8081CC
  jne .next_148
  jmp Label_8081CC
.next_148:
  jmp .miss_144
.hi_144:
  cmp rcx, 0x8081D0
  jne .next_149
  jmp Label_8081D0
.next_149:
  cmp rcx, 0x8081D4
  jne .next_150
  jmp Label_8081D4
.next_150:
  cmp rcx, 0x8081D8
  jne .next_151
  jmp Label_8081D8
.next_151:
  cmp rcx, 0x8081DC
  jne .next_152
  jmp Label_8081DC
.next_152:
.miss_144:
  jmp .miss_143
.hi_143:
  cmp rcx, 0x8081F0
  jae .hi_153
  cmp rcx, 0x8081E0
  jne .next_154
  jmp Label_8081E0
.next_154:
  cmp rcx, 0x8081E4
  jne .next_155
  jmp Label_8081E4
.next_155:
  cmp rcx, 0x8081E8
  jne .next_156
  jmp Label_8081E8
.next_156:
  cmp rcx, 0x8081EC
  jne .next_157
  jmp Label_8081EC
.next_157:
  jmp .miss_153
.hi_153:
  cmp rcx, 0x8081F0
  jne .next_158
  jmp Label_8081F0
.next_158:
  cmp rcx, 0x8081F4
  jne .next_159
  jmp Label_8081F4
.next_159:
  cmp rcx, 0x8081F8
  jne .next_160
  jmp Label_8081F8
.next_160:
  cmp rcx, 0x8081FC
  jne .next_161
  jmp Label_8081FC
.next_161:
.miss_153:
.miss_143:
.miss_123:
.miss_83:
.miss_3:
  jmp .miss_2
.hi_2:
  cmp rcx, 0x808300
  jae .hi_162
  cmp rcx, 0x808280
  jae .hi_163
  cmp rcx, 0x808240
  jae .hi_164
  cmp rcx, 0x808220
  jae .hi_165
  cmp rcx, 0x808210
  jae .hi_166
  cmp rcx, 0x808200
  jne .next_167
  jmp Label_808200
.next_167:
  cmp rcx, 0x808204
  jne .next_168
  jmp Label_808204
.next_168:
  cmp rcx, 0x808208
  jne .next_169
  jmp Label_808208
.next_169:
  cmp rcx, 0x80820C
  jne .next_170
  jmp Label_80820C
.next_170:
  jmp .miss_166
.hi_166:
  cmp rcx, 0x808210
  jne .next_171
  jmp Label_808210
.next_171:
  cmp rcx, 0x808214
  jne .next_172
  jmp Label_808214
.next_172:
  cmp rcx, 0x808218
  jne .next_173
  jmp Label_808218
.next_173:
  cmp rcx, 0x80821C
  jne .next_174
  jmp Label_80821C
.next_174:
.miss_166:
  jmp .miss_165
.hi_165:
  cmp rcx, 0x808230
  jae .hi_175
  cmp rcx, 0x808220
  jne .next_176
  jmp Label_808220
.next_176:
  cmp rcx, 0x808224
  jne .next_177
  jmp Label_808224
.next_177:
  cmp rcx, 0x808228
  jne .next_178
  jmp Label_808228
.next_178:
  cmp rcx, 0x80822C
  jne .next_179
  jmp Label_80822C
.next_179:
  jmp .miss_175
.hi_175:
  cmp rcx, 0x808230
  jne .next_180
  jmp Label_808230
.next_180:
  cmp rcx, 0x808234
  jne .next_181
  jmp Label_808234
.next_181:
  cmp rcx, 0x808238
  jne .next_182
  jmp Label_808238
.next_182:
  cmp rcx, 0x80823C
  jne .next_183
  jmp Label_80823C
.next_183:
.miss_175:
.miss_165:
  jmp .miss_164
.hi_164:
  cmp rcx, 0x808260
  jae .hi_184
  cmp rcx, 0x808250
  jae .hi_185
  cmp rcx, 0x808240
  jne .next_186
  jmp Label_808240
.next_186:
  cmp rcx, 0x808244
  jne .next_187
  jmp Label_808244
.next_187:
  cmp rcx, 0x808248
  jne .next_188
  jmp Label_808248
.next_188:
  cmp rcx, 0x80824C
  jne .next_189
  jmp Label_80824C
.next_189:
  jmp .miss_185
.hi_185:
  cmp rcx, 0x808250
  jne .next_190
  jmp Label_808250
.next_190:
  cmp rcx, 0x808254
  jne .next_191
  jmp Label_808254
.next_191:
  cmp rcx, 0x808258
  jne .next_192
  jmp Label_808258
.next_192:
  cmp rcx, 0x80825C
  jne .next_193
  jmp Label_80825C
.next_193:
.miss_185:
  jmp .miss_184
.hi_184:
  cmp rcx, 0x808270
  jae .hi_194
  cmp rcx, 0x808260
  jne .next_195
  jmp Label_808260
.next_195:
  cmp rcx, 0x808264
  jne .next_196
  jmp Label_808264
.next_196:
  cmp rcx, 0x808268
  jne .next_197
  jmp Label_808268
.next_197:
  cmp rcx, 0x80826C
  jne .next_198
  jmp Label_80826C
.next_198:
  jmp .miss_194
.hi_194:
  cmp rcx, 0x808270
  jne .next_199
  jmp Label_808270
.next_199:
  cmp rcx, 0x808274
  jne .next_200
  jmp Label_808274
.next_200:
  cmp rcx, 0x808278
  jne .next_201
  jmp Label_808278
.next_201:
  cmp rcx, 0x80827C
  jne .next_202
  jmp Label_80827C
.next_202:
.miss_194:
.miss_184:
.miss_164:
  jmp .miss_163
.hi_163:
  cmp rcx, 0x8082C0
  jae .hi_203
  cmp rcx, 0x8082A0
  jae .hi_204
  cmp rcx, 0x808290
  jae .hi_205
  cmp rcx, 0x808280
  jne .next_206
  jmp Label_808280
.next_206:
  cmp rcx, 0x808284
  jne .next_207
  jmp Label_808284
.next_207:
  cmp rcx, 0x808288
  jne .next_208
  jmp Label_808288
.next_208:
  cmp rcx, 0x80828C
  jne .next_209
  jmp Label_80828C
.next_209:
  jmp .miss_205
.hi_205:
  cmp rcx, 0x808290
  jne .next_210
  jmp Label_808290
.next_210:
  cmp rcx, 0x808294
  jne .next_211
  jmp Label_808294
.next_211:
  cmp rcx, 0x808298
  jne .next_212
  jmp Label_808298
.next_212:
  cmp rcx, 0x80829C
  jne .next_213
  jmp Label_80829C
.next_213:
.miss_205:
  jmp .miss_204
.hi_204:
  cmp rcx, 0x8082B0
  jae .hi_214
  cmp rcx, 0x8082A0
  jne .next_215
  jmp Label_8082A0
.next_215:
  cmp rcx, 0x8082A4
  jne .next_216
  jmp Label_8082A4
.next_216:
  cmp rcx, 0x8082A8
  jne .next_217
  jmp Label_8082A8
.next_217:
  cmp rcx, 0x8082AC
  jne .next_218
  jmp Label_8082AC
.next_218:
  jmp .miss_214
.hi_214:
  cmp rcx, 0x8082B0
  jne .next_219
  jmp Label_8082B0
.next_219:
  cmp rcx, 0x8082B4
  jne .next_220
  jmp Label_8082B4
.next_220:
  cmp rcx, 0x8082B8
  jne .next_221
  jmp Label_8082B8
.next_221:
  cmp rcx, 0x8082BC
  jne .next_222
  jmp Label_8082BC
.next_222:
.miss_214:
.miss_204:
  jmp .miss_203
.hi_203:
  cmp rcx, 0x8082E0
  jae .hi_223
  cmp rcx, 0x8082D0
  jae .hi_224
  cmp rcx, 0x8082C0
  jne .next_225
  jmp Label_8082C0
.next_225:
  cmp rcx, 0x8082C4
  jne .next_226
  jmp Label_8082C4
.next_226:
  cmp rcx, 0x8082C8
  jne .next_227
  jmp Label_8082C8
.next_227:
  cmp rcx, 0x8082CC
  jne .next_228
  jmp Label_8082CC
.next_228:
  jmp .miss_224
.hi_224:
  cmp rcx, 0x8082D0
  jne .next_229
  jmp Label_8082D0
.next_229:
  cmp rcx, 0x8082D4
  jne .next_230
  jmp Label_8082D4
.next_230:
  cmp rcx, 0x8082D8
  jne .next_231
  jmp Label_8082D8
.next_231:
  cmp rcx, 0x8082DC
  jne .next_232
  jmp Label_8082DC
.next_232:
.miss_224:
  jmp .miss_223
.hi_223:
  cmp rcx, 0x8082F0
  jae .hi_233
  cmp rcx, 0x8082E0
  jne .next_234
  jmp Label_8082E0
.next_234:
  cmp rcx, 0x8082E4
  jne .next_235
  jmp Label_8082E4
.next_235:
  cmp rcx, 0x8082E8
  jne .next_236
  jmp Label_8082E8
.next_236:
  cmp rcx, 0x8082EC
  jne .next_237
  jmp Label_8082EC
.next_237:
  jmp .miss_233
.hi_233:
  cmp rcx, 0x8082F0
  jne .next_238
  jmp Label_8082F0
.next_238:
  cmp rcx, 0x8082F4
  jne .next_239
  jmp Label_8082F4
.next_239:
  cmp rcx, 0x8082F8
  jne .next_240
  jmp Label_8082F8
.next_240:
  cmp rcx, 0x8082FC
  jne .next_241
  jmp Label_8082FC
.next_241:
.miss_233:
.miss_223:
.miss_203:
.miss_163:
  jmp .miss_162
.hi_162:
  cmp rcx, 0x808380
  jae .hi_242
  cmp rcx, 0x808340
  jae .hi_243
  cmp rcx, 0x808320
  jae .hi_244
  cmp rcx, 0x808310
  jae .hi_245
  cmp rcx, 0x808300
  jne .next_246
  jmp Label_808300
.next_246:
  cmp rcx, 0x808304
  jne .next_247
  jmp Label_808304
.next_247:
  cmp rcx, 0x808308
  jne .next_248
  jmp Label_808308
.next_248:
  cmp rcx, 0x80830C
  jne .next_249
  jmp Label_80830C
.next_249:
  jmp .miss_245
.hi_245:
  cmp rcx, 0x808310
  jne .next_250
  jmp Label_808310
.next_250:
  cmp rcx, 0x808314
  jne .next_251
  jmp Label_808314
.next_251:
  cmp rcx, 0x808318
  jne .next_252
  jmp Label_808318
.next_252:
  cmp rcx, 0x80831C
  jne .next_253
  jmp Label_80831C
.next_253:
.miss_245:
  jmp .miss_244
.hi_244:
  cmp rcx, 0x808330
  jae .hi_254
  cmp rcx, 0x808320
  jne .next_255
  jmp Label_808320
.next_255:
  cmp rcx, 0x808324
  jne .next_256
  jmp Label_808324
.next_256:
  cmp rcx, 0x808328
  jne .next_257
  jmp Label_808328
.next_257:
  cmp rcx, 0x80832C
  jne .next_258
  jmp Label_80832C
.next_258:
  jmp .miss_254
.hi_254:
  cmp rcx, 0x808330
  jne .next_259
  jmp Label_808330
.next_259:
  cmp rcx, 0x808334
  jne .next_260
  jmp Label_808334
.next_260:
  cmp rcx, 0x808338
  jne .next_261
  jmp Label_808338
.next_261:
  cmp rcx, 0x80833C
  jne .next_262
  jmp Label_80833C
.next_262:
.miss_254:
.miss_244:
  jmp .miss_243
.hi_243:
  cmp rcx, 0x808360
  jae .hi_263
  cmp rcx, 0x808350
  jae .hi_264
  cmp rcx, 0x808340
  jne .next_265
  jmp Label_808340
.next_265:
  cmp rcx, 0x808344
  jne .next_266
  jmp Label_808344
.next_266:
  cmp rcx, 0x808348
  jne .next_267
  jmp Label_808348
.next_267:
  cmp rcx, 0x80834C
  jne .next_268
  jmp Label_80834C
.next_268:
  jmp .miss_264
.hi_264:
  cmp rcx, 0x808350
  jne .next_269
  jmp Label_808350
.next_269:
  cmp rcx, 0x808354
  jne .next_270
  jmp Label_808354
.next_270:
  cmp rcx, 0x808358
  jne .next_271
  jmp Label_808358
.next_271:
  cmp rcx, 0x80835C
  jne .next_272
  jmp Label_80835C
.next_272:
.miss_264:
  jmp .miss_263
.hi_263:
  cmp rcx, 0x808370
  jae .hi_273
  cmp rcx, 0x808360
  jne .next_274
  jmp Label_808360
.next_274:
  cmp rcx, 0x808364
  jne .next_275
  jmp Label_808364
.next_275:
  cmp rcx, 0x808368
  jne .next_276
  jmp Label_808368
.next_276:
  cmp rcx, 0x80836C
  jne .next_277
  jmp Label_80836C
.next_277:
  jmp .miss_273
.hi_273:
  cmp rcx, 0x808370
  jne .next_278
  jmp Label_808370
.next_278:
  cmp rcx, 0x808374
  jne .next_279
  jmp Label_808374
.next_279:
  cmp rcx, 0x808378
  jne .next_280
  jmp Label_808378
.next_280:
  cmp rcx, 0x80837C
  jne .next_281
  jmp Label_80837C
.next_281:
.miss_273:
.miss_263:
.miss_243:
  jmp .miss_242
.hi_242:
  cmp rcx, 0x8083C0
  jae .hi_282
  cmp rcx, 0x8083A0
  jae .hi_283
  cmp rcx, 0x808390
  jae .hi_284
  cmp rcx, 0x808380
  jne .next_285
  jmp Label_808380
.next_285:
  cmp rcx, 0x808384
  jne .next_286
  jmp Label_808384
.next_286:
  cmp rcx, 0x808388
  jne .next_287
  jmp Label_808388
.next_287:
  cmp rcx, 0x80838C
  jne .next_288
  jmp Label_80838C
.next_288:
  jmp .miss_284
.hi_284:
  cmp rcx, 0x808390
  jne .next_289
  jmp Label_808390
.next_289:
  cmp rcx, 0x808394
  jne .next_290
  jmp Label_808394
.next_290:
  cmp rcx, 0x808398
  jne .next_291
  jmp Label_808398
.next_291:
  cmp rcx, 0x80839C
  jne .next_292
  jmp Label_80839C
.next_292:
.miss_284:
  jmp .miss_283
.hi_283:
  cmp rcx, 0x8083B0
  jae .hi_293
  cmp rcx, 0x8083A0
  jne .next_294
  jmp Label_8083A0
.next_294:
  cmp rcx, 0x8083A4
  jne .next_295
  jmp Label_8083A4
.next_295:
  cmp rcx, 0x8083A8
  jne .next_296
  jmp Label_8083A8
.next_296:
  cmp rcx, 0x8083AC
  jne .next_297
  jmp Label_8083AC
.next_297:
  jmp .miss_293
.hi_293:
  cmp rcx, 0x8083B0
  jne .next_298
  jmp Label_8083B0
.next_298:
  cmp rcx, 0x8083B4
  jne .next_299
  jmp Label_8083B4
.next_299:
  cmp rcx, 0x8083B8
  jne .next_300
  jmp Label_8083B8
.next_300:
  cmp rcx, 0x8083BC
  jne .next_301
  jmp Label_8083BC
.next_301:
.miss_293:
.miss_283:
  jmp .miss_282
.hi_282:
  cmp rcx, 0x8083E0
  jae .hi_302
  cmp rcx, 0x8083D0
  jae .hi_303
  cmp rcx, 0x8083C0
  jne .next_304
  jmp Label_8083C0
.next_304:
  cmp rcx, 0x8083C4
  jne .next_305
  jmp Label_8083C4
.next_305:
  cmp rcx, 0x8083C8
  jne .next_306
  jmp Label_8083C8
.next_306:
  cmp rcx, 0x8083CC
  jne .next_307
  jmp Label_8083CC
.next_307:
  jmp .miss_303
.hi_303:
  cmp rcx, 0x8083D0
  jne .next_308
  jmp Label_8083D0
.next_308:
  cmp rcx, 0x8083D4
  jne .next_309
  jmp Label_8083D4
.next_309:
  cmp rcx, 0x8083D8
  jne .next_310
  jmp Label_8083D8
.next_310:
  cmp rcx, 0x8083DC
  jne .next_311
  jmp Label_8083DC
.next_311:
.miss_303:
  jmp .miss_302
.hi_302:
  cmp rcx, 0x8083F0
  jae .hi_312
  cmp rcx, 0x8083E0
  jne .next_313
  jmp Label_8083E0
.next_313:
  cmp rcx, 0x8083E4
  jne .next_314
  jmp Label_8083E4
.next_314:
  cmp rcx, 0x8083E8
  jne .next_315
  jmp Label_8083E8
.next_315:
  cmp rcx, 0x8083EC
  jne .next_316
  jmp Label_8083EC
.next_316:
  jmp .miss_312
.hi_312:
  cmp rcx, 0x8083F0
  jne .next_317
  jmp Label_8083F0
.next_317:
  cmp rcx, 0x8083F4
  jne .next_318
  jmp Label_8083F4
.next_318:
  cmp rcx, 0x8083F8
  jne .next_319
  jmp Label_8083F8
.next_319:
  cmp rcx, 0x8083FC
  jne .next_320
  jmp Label_8083FC
.next_320:
.miss_312:
.miss_302:
.miss_282:
.miss_242:
.miss_162:
.miss_2:
  jmp .miss_1
.hi_1:
  cmp rcx, 0x808600
  jae .hi_321
  cmp rcx, 0x808500
  jae .hi_322
  cmp rcx, 0x808480
  jae .hi_323
  cmp rcx, 0x808440
  jae .hi_324
  cmp rcx, 0x808420
  jae .hi_325
  cmp rcx, 0x808410
  jae .hi_326
  cmp rcx, 0x808400
  jne .next_327
  jmp Label_808400
.next_327:
  cmp rcx, 0x808404
  jne .next_328
  jmp Label_808404
.next_328:
  cmp rcx, 0x808408
  jne .next_329
  jmp Label_808408
.next_329:
  cmp rcx, 0x80840C
  jne .next_330
  jmp Label_80840C
.next_330:
  jmp .miss_326
.hi_326:
  cmp rcx, 0x808410
  jne .next_331
  jmp Label_808410
.next_331:
  cmp rcx, 0x808414
  jne .next_332
  jmp Label_808414
.next_332:
  cmp rcx, 0x808418
  jne .next_333
  jmp Label_808418
.next_333:
  cmp rcx, 0x80841C
  jne .next_334
  jmp Label_80841C
.next_334:
.miss_326:
  jmp .miss_325
.hi_325:
  cmp rcx, 0x808430
  jae .hi_335
  cmp rcx, 0x808420
  jne .next_336
  jmp Label_808420
.next_336:
  cmp rcx, 0x808424
  jne .next_337
  jmp Label_808424
.next_337:
  cmp rcx, 0x808428
  jne .next_338
  jmp Label_808428
.next_338:
  cmp rcx, 0x80842C
  jne .next_339
  jmp Label_80842C
.next_339:
  jmp .miss_335
.hi_335:
  cmp rcx, 0x808430
  jne .next_340
  jmp Label_808430
.next_340:
  cmp rcx, 0x808434
  jne .next_341
  jmp Label_808434
.next_341:
  cmp rcx, 0x808438
  jne .next_342
  jmp Label_808438
.next_342:
  cmp rcx, 0x80843C
  jne .next_343
  jmp Label_80843C
.next_343:
.miss_335:
.miss_325:
  jmp .miss_324
.hi_324:
  cmp rcx, 0x808460
  jae .hi_344
  cmp rcx, 0x808450
  jae .hi_345
  cmp rcx, 0x808440
  jne .next_346
  jmp Label_808440
.next_346:
  cmp rcx, 0x808444
  jne .next_347
  jmp Label_808444
.next_347:
  cmp rcx, 0x808448
  jne .next_348
  jmp Label_808448
.next_348:
  cmp rcx, 0x80844C
  jne .next_349
  jmp Label_80844C
.next_349:
  jmp .miss_345
.hi_345:
  cmp rcx, 0x808450
  jne .next_350
  jmp Label_808450
.next_350:
  cmp rcx, 0x808454
  jne .next_351
  jmp Label_808454
.next_351:
  cmp rcx, 0x808458
  jne .next_352
  jmp Label_808458
.next_352:
  cmp rcx, 0x80845C
  jne .next_353
  jmp Label_80845C
.next_353:
.miss_345:
  jmp .miss_344
.hi_344:
  cmp rcx, 0x808470
  jae .hi_354
  cmp rcx, 0x808460
  jne .next_355
  jmp Label_808460
.next_355:
  cmp rcx, 0x808464
  jne .next_356
  jmp Label_808464
.next_356:
  cmp rcx, 0x808468
  jne .next_357
  jmp Label_808468
.next_357:
  cmp rcx, 0x80846C
  jne .next_358
  jmp Label_80846C
.next_358:
  jmp .miss_354
.hi_354:
  cmp rcx, 0x808470
  jne .next_359
  jmp Label_808470
.next_359:
  cmp rcx, 0x808474
  jne .next_360
  jmp Label_808474
.next_360:
  cmp rcx, 0x808478
  jne .next_361
  jmp Label_808478
.next_361:
  cmp rcx, 0x80847C
  jne .next_362
  jmp Label_80847C
.next_362:
.miss_354:
.miss_344:
.miss_324:
  jmp .miss_323
.hi_323:
  cmp rcx, 0x8084C0
  jae .hi_363
  cmp rcx, 0x8084A0
  jae .hi_364
  cmp rcx, 0x808490
  jae .hi_365
  cmp rcx, 0x808480
  jne .next_366
  jmp Label_808480
.next_366:
  cmp rcx, 0x808484
  jne .next_367
  jmp Label_808484
.next_367:
  cmp rcx, 0x808488
  jne .next_368
  jmp Label_808488
.next_368:
  cmp rcx, 0x80848C
  jne .next_369
  jmp Label_80848C
.next_369:
  jmp .miss_365
.hi_365:
  cmp rcx, 0x808490
  jne .next_370
  jmp Label_808490
.next_370:
  cmp rcx, 0x808494
  jne .next_371
  jmp Label_808494
.next_371:
  cmp rcx, 0x808498
  jne .next_372
  jmp Label_808498
.next_372:
  cmp rcx, 0x80849C
  jne .next_373
  jmp Label_80849C
.next_373:
.miss_365:
  jmp .miss_364
.hi_364:
  cmp rcx, 0x8084B0
  jae .hi_374
  cmp rcx, 0x8084A0
  jne .next_375
  jmp Label_8084A0
.next_375:
  cmp rcx, 0x8084A4
  jne .next_376
  jmp Label_8084A4
.next_376:
  cmp rcx, 0x8084A8
  jne .next_377
  jmp Label_8084A8
.next_377:
  cmp rcx, 0x8084AC
  jne .next_378
  jmp Label_8084AC
.next_378:
  jmp .miss_374
.hi_374:
  cmp rcx, 0x8084B0
  jne .next_379
  jmp Label_8084B0
.next_379:
  cmp rcx, 0x8084B4
  jne .next_380
  jmp Label_8084B4
.next_380:
  cmp rcx, 0x8084B8
  jne .next_381
  jmp Label_8084B8
.next_381:
  cmp rcx, 0x8084BC
  jne .next_382
  jmp Label_8084BC
.next_382:
.miss_374:
.miss_364:
  jmp .miss_363
.hi_363:
  cmp rcx, 0x8084E0
  jae .hi_383
  cmp rcx, 0x8084D0
  jae .hi_384
  cmp rcx, 0x8084C0
  jne .next_385
  jmp Label_8084C0
.next_385:
  cmp rcx, 0x8084C4
  jne .next_386
  jmp Label_8084C4
.next_386:
  cmp rcx, 0x8084C8
  jne .next_387
  jmp Label_8084C8
.next_387:
  cmp rcx, 0x8084CC
  jne .next_388
  jmp Label_8084CC
.next_388:
  jmp .miss_384
.hi_384:
  cmp rcx, 0x8084D0
  jne .next_389
  jmp Label_8084D0
.next_389:
  cmp rcx, 0x8084D4
  jne .next_390
  jmp Label_8084D4
.next_390:
  cmp rcx, 0x8084D8
  jne .next_391
  jmp Label_8084D8
.next_391:
  cmp rcx, 0x8084DC
  jne .next_392
  jmp Label_8084DC
.next_392:
.miss_384:
  jmp .miss_383
.hi_383:
  cmp rcx, 0x8084F0
  jae .hi_393
  cmp rcx, 0x8084E0
  jne .next_394
  jmp Label_8084E0
.next_394:
  cmp rcx, 0x8084E4
  jne .next_395
  jmp Label_8084E4
.next_395:
  cmp rcx, 0x8084E8
  jne .next_396
  jmp Label_8084E8
.next_396:
  cmp rcx, 0x8084EC
  jne .next_397
  jmp Label_8084EC
.next_397:
  jmp .miss_393
.hi_393:
  cmp rcx, 0x8084F0
  jne .next_398
  jmp Label_8084F0
.next_398:
  cmp rcx, 0x8084F4
  jne .next_399
  jmp Label_8084F4
.next_399:
  cmp rcx, 0x8084F8
  jne .next_400
  jmp Label_8084F8
.next_400:
  cmp rcx, 0x8084FC
  jne .next_401
  jmp Label_8084FC
.next_401:
.miss_393:
.miss_383:
.miss_363:
.miss_323:
  jmp .miss_322
.hi_322:
  cmp rcx, 0x808580
  jae .hi_402
  cmp rcx, 0x808540
  jae .hi_403
  cmp rcx, 0x808520
  jae .hi_404
  cmp rcx, 0x808510
  jae .hi_405
  cmp rcx, 0x808500
  jne .next_406
  jmp Label_808500
.next_406:
  cmp rcx, 0x808504
  jne .next_407
  jmp Label_808504
.next_407:
  cmp rcx, 0x808508
  jne .next_408
  jmp Label_808508
.next_408:
  cmp rcx, 0x80850C
  jne .next_409
  jmp Label_80850C
.next_409:
  jmp .miss_405
.hi_405:
  cmp rcx, 0x808510
  jne .next_410
  jmp Label_808510
.next_410:
  cmp rcx, 0x808514
  jne .next_411
  jmp Label_808514
.next_411:
  cmp rcx, 0x808518
  jne .next_412
  jmp Label_808518
.next_412:
  cmp rcx, 0x80851C
  jne .next_413
  jmp Label_80851C
.next_413:
.miss_405:
  jmp .miss_404
.hi_404:
  cmp rcx, 0x808530
  jae .hi_414
  cmp rcx, 0x808520
  jne .next_415
  jmp Label_808520
.next_415:
  cmp rcx, 0x808524
  jne .next_416
  jmp Label_808524
.next_416:
  cmp rcx, 0x808528
  jne .next_417
  jmp Label_808528
.next_417:
  cmp rcx, 0x80852C
  jne .next_418
  jmp Label_80852C
.next_418:
  jmp .miss_414
.hi_414:
  cmp rcx, 0x808530
  jne .next_419
  jmp Label_808530
.next_419:
  cmp rcx, 0x808534
  jne .next_420
  jmp Label_808534
.next_420:
  cmp rcx, 0x808538
  jne .next_421
  jmp Label_808538
.next_421:
  cmp rcx, 0x80853C
  jne .next_422
  jmp Label_80853C
.next_422:
.miss_414:
.miss_404:
  jmp .miss_403
.hi_403:
  cmp rcx, 0x808560
  jae .hi_423
  cmp rcx, 0x808550
  jae .hi_424
  cmp rcx, 0x808540
  jne .next_425
  jmp Label_808540
.next_425:
  cmp rcx, 0x808544
  jne .next_426
  jmp Label_808544
.next_426:
  cmp rcx, 0x808548
  jne .next_427
  jmp Label_808548
.next_427:
  cmp rcx, 0x80854C
  jne .next_428
  jmp Label_80854C
.next_428:
  jmp .miss_424
.hi_424:
  cmp rcx, 0x808550
  jne .next_429
  jmp Label_808550
.next_429:
  cmp rcx, 0x808554
  jne .next_430
  jmp Label_808554
.next_430:
  cmp rcx, 0x808558
  jne .next_431
  jmp Label_808558
.next_431:
  cmp rcx, 0x80855C
  jne .next_432
  jmp Label_80855C
.next_432:
.miss_424:
  jmp .miss_423
.hi_423:
  cmp rcx, 0x808570
  jae .hi_433
  cmp rcx, 0x808560
  jne .next_434
  jmp Label_808560
.next_434:
  cmp rcx, 0x808564
  jne .next_435
  jmp Label_808564
.next_435:
  cmp rcx, 0x808568
  jne .next_436
  jmp Label_808568
.next_436:
  cmp rcx, 0x80856C
  jne .next_437
  jmp Label_80856C
.next_437:
  jmp .miss_433
.hi_433:
  cmp rcx, 0x808570
  jne .next_438
  jmp Label_808570
.next_438:
  cmp rcx, 0x808574
  jne .next_439
  jmp Label_808574
.next_439:
  cmp rcx, 0x808578
  jne .next_440
  jmp Label_808578
.next_440:
  cmp rcx, 0x80857C
  jne .next_441
  jmp Label_80857C
.next_441:
.miss_433:
.miss_423:
.miss_403:
  jmp .miss_402
.hi_402:
  cmp rcx, 0x8085C0
  jae .hi_442
  cmp rcx, 0x8085A0
  jae .hi_443
  cmp rcx, 0x808590
  jae .hi_444
  cmp rcx, 0x808580
  jne .next_445
  jmp Label_808580
.next_445:
  cmp rcx, 0x808584
  jne .next_446
  jmp Label_808584
.next_446:
  cmp rcx, 0x808588
  jne .next_447
  jmp Label_808588
.next_447:
  cmp rcx, 0x80858C
  jne .next_448
  jmp Label_80858C
.next_448:
  jmp .miss_444
.hi_444:
  cmp rcx, 0x808590
  jne .next_449
  jmp Label_808590
.next_449:
  cmp rcx, 0x808594
  jne .next_450
  jmp Label_808594
.next_450:
  cmp rcx, 0x808598
  jne .next_451
  jmp Label_808598
.next_451:
  cmp rcx, 0x80859C
  jne .next_452
  jmp Label_80859C
.next_452:
.miss_444:
  jmp .miss_443
.hi_443:
  cmp rcx, 0x8085B0
  jae .hi_453
  cmp rcx, 0x8085A0
  jne .next_454
  jmp Label_8085A0
.next_454:
  cmp rcx, 0x8085A4
  jne .next_455
  jmp Label_8085A4
.next_455:
  cmp rcx, 0x8085A8
  jne .next_456
  jmp Label_8085A8
.next_456:
  cmp rcx, 0x8085AC
  jne .next_457
  jmp Label_8085AC
.next_457:
  jmp .miss_453
.hi_453:
  cmp rcx, 0x8085B0
  jne .next_458
  jmp Label_8085B0
.next_458:
  cmp rcx, 0x8085B4
  jne .next_459
  jmp Label_8085B4
.next_459:
  cmp rcx, 0x8085B8
  jne .next_460
  jmp Label_8085B8
.next_460:
  cmp rcx, 0x8085BC
  jne .next_461
  jmp Label_8085BC
.next_461:
.miss_453:
.miss_443:
  jmp .miss_442
.hi_442:
  cmp rcx, 0x8085E0
  jae .hi_462
  cmp rcx, 0x8085D0
  jae .hi_463
  cmp rcx, 0x8085C0
  jne .next_464
  jmp Label_8085C0
.next_464:
  cmp rcx, 0x8085C4
  jne .next_465
  jmp Label_8085C4
.next_465:
  cmp rcx, 0x8085C8
  jne .next_466
  jmp Label_8085C8
.next_466:
  cmp rcx, 0x8085CC
  jne .next_467
  jmp Label_8085CC
.next_467:
  jmp .miss_463
.hi_463:
  cmp rcx, 0x8085D0
  jne .next_468
  jmp Label_8085D0
.next_468:
  cmp rcx, 0x8085D4
  jne .next_469
  jmp Label_8085D4
.next_469:
  cmp rcx, 0x8085D8
  jne .next_470
  jmp Label_8085D8
.next_470:
  cmp rcx, 0x8085DC
  jne .next_471
  jmp Label_8085DC
.next_471:
.miss_463:
  jmp .miss_462
.hi_462:
  cmp rcx, 0x8085F0
  jae .hi_472
  cmp rcx, 0x8085E0
  jne .next_473
  jmp Label_8085E0
.next_473:
  cmp rcx, 0x8085E4
  jne .next_474
  jmp Label_8085E4
.next_474:
  cmp rcx, 0x8085E8
  jne .next_475
  jmp Label_8085E8
.next_475:
  cmp rcx, 0x8085EC
  jne .next_476
  jmp Label_8085EC
.next_476:
  jmp .miss_472
.hi_472:
  cmp rcx, 0x8085F0
  jne .next_477
  jmp Label_8085F0
.next_477:
  cmp rcx, 0x8085F4
  jne .next_478
  jmp Label_8085F4
.next_478:
  cmp rcx, 0x8085F8
  jne .next_479
  jmp Label_8085F8
.next_479:
  cmp rcx, 0x8085FC
  jne .next_480
  jmp Label_8085FC
.next_480:
.miss_472:
.miss_462:
.miss_442:
.miss_402:
.miss_322:
  jmp .miss_321
.hi_321:
  cmp rcx, 0x808700
  jae .hi_481
  cmp rcx, 0x808680
  jae .hi_482
  cmp rcx, 0x808640
  jae .hi_483
  cmp rcx, 0x808620
  jae .hi_484
  cmp rcx, 0x808610
  jae .hi_485
  cmp rcx, 0x808600
  jne .next_486
  jmp Label_808600
.next_486:
  cmp rcx, 0x808604
  jne .next_487
  jmp Label_808604
.next_487:
  cmp rcx, 0x808608
  jne .next_488
  jmp Label_808608
.next_488:
  cmp rcx, 0x80860C
  jne .next_489
  jmp Label_80860C
.next_489:
  jmp .miss_485
.hi_485:
  cmp rcx, 0x808610
  jne .next_490
  jmp Label_808610
.next_490:
  cmp rcx, 0x808614
  jne .next_491
  jmp Label_808614
.next_491:
  cmp rcx, 0x808618
  jne .next_492
  jmp Label_808618
.next_492:
  cmp rcx, 0x80861C
  jne .next_493
  jmp Label_80861C
.next_493:
.miss_485:
  jmp .miss_484
.hi_484:
  cmp rcx, 0x808630
  jae .hi_494
  cmp rcx, 0x808620
  jne .next_495
  jmp Label_808620
.next_495:
  cmp rcx, 0x808624
  jne .next_496
  jmp Label_808624
.next_496:
  cmp rcx, 0x808628
  jne .next_497
  jmp Label_808628
.next_497:
  cmp rcx, 0x80862C
  jne .next_498
  jmp Label_80862C
.next_498:
  jmp .miss_494
.hi_494:
  cmp rcx, 0x808630
  jne .next_499
  jmp Label_808630
.next_499:
  cmp rcx, 0x808634
  jne .next_500
  jmp Label_808634
.next_500:
  cmp rcx, 0x808638
  jne .next_501
  jmp Label_808638
.next_501:
  cmp rcx, 0x80863C
  jne .next_502
  jmp Label_80863C
.next_502:
.miss_494:
.miss_484:
  jmp .miss_483
.hi_483:
  cmp rcx, 0x808660
  jae .hi_503
  cmp rcx, 0x808650
  jae .hi_504
  cmp rcx, 0x808640
  jne .next_505
  jmp Label_808640
.next_505:
  cmp rcx, 0x808644
  jne .next_506
  jmp Label_808644
.next_506:
  cmp rcx, 0x808648
  jne .next_507
  jmp Label_808648
.next_507:
  cmp rcx, 0x80864C
  jne .next_508
  jmp Label_80864C
.next_508:
  jmp .miss_504
.hi_504:
  cmp rcx, 0x808650
  jne .next_509
  jmp Label_808650
.next_509:
  cmp rcx, 0x808654
  jne .next_510
  jmp Label_808654
.next_510:
  cmp rcx, 0x808658
  jne .next_511
  jmp Label_808658
.next_511:
  cmp rcx, 0x80865C
  jne .next_512
  jmp Label_80865C
.next_512:
.miss_504:
  jmp .miss_503
.hi_503:
  cmp rcx, 0x808670
  jae .hi_513
  cmp rcx, 0x808660
  jne .next_514
  jmp Label_808660
.next_514:
  cmp rcx, 0x808664
  jne .next_515
  jmp Label_808664
.next_515:
  cmp rcx, 0x808668
  jne .next_516
  jmp Label_808668
.next_516:
  cmp rcx, 0x80866C
  jne .next_517
  jmp Label_80866C
.next_517:
  jmp .miss_513
.hi_513:
  cmp rcx, 0x808670
  jne .next_518
  jmp Label_808670
.next_518:
  cmp rcx, 0x808674
  jne .next_519
  jmp Label_808674
.next_519:
  cmp rcx, 0x808678
  jne .next_520
  jmp Label_808678
.next_520:
  cmp rcx, 0x80867C
  jne .next_521
  jmp Label_80867C
.next_521:
.miss_513:
.miss_503:
.miss_483:
  jmp .miss_482
.hi_482:
  cmp rcx, 0x8086C0
  jae .hi_522
  cmp rcx, 0x8086A0
  jae .hi_523
  cmp rcx, 0x808690
  jae .hi_524
  cmp rcx, 0x808680
  jne .next_525
  jmp Label_808680
.next_525:
  cmp rcx, 0x808684
  jne .next_526
  jmp Label_808684
.next_526:
  cmp rcx, 0x808688
  jne .next_527
  jmp Label_808688
.next_527:
  cmp rcx, 0x80868C
  jne .next_528
  jmp Label_80868C
.next_528:
  jmp .miss_524
.hi_524:
  cmp rcx, 0x808690
  jne .next_529
  jmp Label_808690
.next_529:
  cmp rcx, 0x808694
  jne .next_530
  jmp Label_808694
.next_530:
  cmp rcx, 0x808698
  jne .next_531
  jmp Label_808698
.next_531:
  cmp rcx, 0x80869C
  jne .next_532
  jmp Label_80869C
.next_532:
.miss_524:
  jmp .miss_523
.hi_523:
  cmp rcx, 0x8086B0
  jae .hi_533
  cmp rcx, 0x8086A0
  jne .next_534
  jmp Label_8086A0
.next_534:
  cmp rcx, 0x8086A4
  jne .next_535
  jmp Label_8086A4
.next_535:
  cmp rcx, 0x8086A8
  jne .next_536
  jmp Label_8086A8
.next_536:
  cmp rcx, 0x8086AC
  jne .next_537
  jmp Label_8086AC
.next_537:
  jmp .miss_533
.hi_533:
  cmp rcx, 0x8086B0
  jne .next_538
  jmp Label_8086B0
.next_538:
  cmp rcx, 0x8086B4
  jne .next_539
  jmp Label_8086B4
.next_539:
  cmp rcx, 0x8086B8
  jne .next_540
  jmp Label_8086B8
.next_540:
  cmp rcx, 0x8086BC
  jne .next_541
  jmp Label_8086BC
.next_541:
.miss_533:
.miss_523:
  jmp .miss_522
.hi_522:
  cmp rcx, 0x8086E0
  jae .hi_542
  cmp rcx, 0x8086D0
  jae .hi_543
  cmp rcx, 0x8086C0
  jne .next_544
  jmp Label_8086C0
.next_544:
  cmp rcx, 0x8086C4
  jne .next_545
  jmp Label_8086C4
.next_545:
  cmp rcx, 0x8086C8
  jne .next_546
  jmp Label_8086C8
.next_546:
  cmp rcx, 0x8086CC
  jne .next_547
  jmp Label_8086CC
.next_547:
  jmp .miss_543
.hi_543:
  cmp rcx, 0x8086D0
  jne .next_548
  jmp Label_8086D0
.next_548:
  cmp rcx, 0x8086D4
  jne .next_549
  jmp Label_8086D4
.next_549:
  cmp rcx, 0x8086D8
  jne .next_550
  jmp Label_8086D8
.next_550:
  cmp rcx, 0x8086DC
  jne .next_551
  jmp Label_8086DC
.next_551:
.miss_543:
  jmp .miss_542
.hi_542:
  cmp rcx, 0x8086F0
  jae .hi_552
  cmp rcx, 0x8086E0
  jne .next_553
  jmp Label_8086E0
.next_553:
  cmp rcx, 0x8086E4
  jne .next_554
  jmp Label_8086E4
.next_554:
  cmp rcx, 0x8086E8
  jne .next_555
  jmp Label_8086E8
.next_555:
  cmp rcx, 0x8086EC
  jne .next_556
  jmp Label_8086EC
.next_556:
  jmp .miss_552
.hi_552:
  cmp rcx, 0x8086F0
  jne .next_557
  jmp Label_8086F0
.next_557:
  cmp rcx, 0x8086F4
  jne .next_558
  jmp Label_8086F4
.next_558:
  cmp rcx, 0x8086F8
  jne .next_559
  jmp Label_8086F8
.next_559:
  cmp rcx, 0x8086FC
  jne .next_560
  jmp Label_8086FC
.next_560:
.miss_552:
.miss_542:
.miss_522:
.miss_482:
  jmp .miss_481
.hi_481:
  cmp rcx, 0x808780
  jae .hi_561
  cmp rcx, 0x808740
  jae .hi_562
  cmp rcx, 0x808720
  jae .hi_563
  cmp rcx, 0x808710
  jae .hi_564
  cmp rcx, 0x808700
  jne .next_565
  jmp Label_808700
.next_565:
  cmp rcx, 0x808704
  jne .next_566
  jmp Label_808704
.next_566:
  cmp rcx, 0x808708
  jne .next_567
  jmp Label_808708
.next_567:
  cmp rcx, 0x80870C
  jne .next_568
  jmp Label_80870C
.next_568:
  jmp .miss_564
.hi_564:
  cmp rcx, 0x808710
  jne .next_569
  jmp Label_808710
.next_569:
  cmp rcx, 0x808714
  jne .next_570
  jmp Label_808714
.next_570:
  cmp rcx, 0x808718
  jne .next_571
  jmp Label_808718
.next_571:
  cmp rcx, 0x80871C
  jne .next_572
  jmp Label_80871C
.next_572:
.miss_564:
  jmp .miss_563
.hi_563:
  cmp rcx, 0x808730
  jae .hi_573
  cmp rcx, 0x808720
  jne .next_574
  jmp Label_808720
.next_574:
  cmp rcx, 0x808724
  jne .next_575
  jmp Label_808724
.next_575:
  cmp rcx, 0x808728
  jne .next_576
  jmp Label_808728
.next_576:
  cmp rcx, 0x80872C
  jne .next_577
  jmp Label_80872C
.next_577:
  jmp .miss_573
.hi_573:
  cmp rcx, 0x808730
  jne .next_578
  jmp Label_808730
.next_578:
  cmp rcx, 0x808734
  jne .next_579
  jmp Label_808734
.next_579:
  cmp rcx, 0x808738
  jne .next_580
  jmp Label_808738
.next_580:
  cmp rcx, 0x80873C
  jne .next_581
  jmp Label_80873C
.next_581:
.miss_573:
.miss_563:
  jmp .miss_562
.hi_562:
  cmp rcx, 0x808760
  jae .hi_582
  cmp rcx, 0x808750
  jae .hi_583
  cmp rcx, 0x808740
  jne .next_584
  jmp Label_808740
.next_584:
  cmp rcx, 0x808744
  jne .next_585
  jmp Label_808744
.next_585:
  cmp rcx, 0x808748
  jne .next_586
  jmp Label_808748
.next_586:
  cmp rcx, 0x80874C
  jne .next_587
  jmp Label_80874C
.next_587:
  jmp .miss_583
.hi_583:
  cmp rcx, 0x808750
  jne .next_588
  jmp Label_808750
.next_588:
  cmp rcx, 0x808754
  jne .next_589
  jmp Label_808754
.next_589:
  cmp rcx, 0x808758
  jne .next_590
  jmp Label_808758
.next_590:
  cmp rcx, 0x80875C
  jne .next_591
  jmp Label_80875C
.next_591:
.miss_583:
  jmp .miss_582
.hi_582:
  cmp rcx, 0x808770
  jae .hi_592
  cmp rcx, 0x808760
  jne .next_593
  jmp Label_808760
.next_593:
  cmp rcx, 0x808764
  jne .next_594
  jmp Label_808764
.next_594:
  cmp rcx, 0x808768
  jne .next_595
  jmp Label_808768
.next_595:
  cmp rcx, 0x80876C
  jne .next_596
  jmp Label_80876C
.next_596:
  jmp .miss_592
.hi_592:
  cmp rcx, 0x808770
  jne .next_597
  jmp Label_808770
.next_597:
  cmp rcx, 0x808774
  jne .next_598
  jmp Label_808774
.next_598:
  cmp rcx, 0x808778
  jne .next_599
  jmp Label_808778
.next_599:
  cmp rcx, 0x80877C
  jne .next_600
  jmp Label_80877C
.next_600:
.miss_592:
.miss_582:
.miss_562:
  jmp .miss_561
.hi_561:
  cmp rcx, 0x8087C0
  jae .hi_601
  cmp rcx, 0x8087A0
  jae .hi_602
  cmp rcx, 0x808790
  jae .hi_603
  cmp rcx, 0x808780
  jne .next_604
  jmp Label_808780
.next_604:
  cmp rcx, 0x808784
  jne .next_605
  jmp Label_808784
.next_605:
  cmp rcx, 0x808788
  jne .next_606
  jmp Label_808788
.next_606:
  cmp rcx, 0x80878C
  jne .next_607
  jmp Label_80878C
.next_607:
  jmp .miss_603
.hi_603:
  cmp rcx, 0x808790
  jne .next_608
  jmp Label_808790
.next_608:
  cmp rcx, 0x808794
  jne .next_609
  jmp Label_808794
.next_609:
  cmp rcx, 0x808798
  jne .next_610
  jmp Label_808798
.next_610:
  cmp rcx, 0x80879C
  jne .next_611
  jmp Label_80879C
.next_611:
.miss_603:
  jmp .miss_602
.hi_602:
  cmp rcx, 0x8087B0
  jae .hi_612
  cmp rcx, 0x8087A0
  jne .next_613
  jmp Label_8087A0
.next_613:
  cmp rcx, 0x8087A4
  jne .next_614
  jmp Label_8087A4
.next_614:
  cmp rcx, 0x8087A8
  jne .next_615
  jmp Label_8087A8
.next_615:
  cmp rcx, 0x8087AC
  jne .next_616
  jmp Label_8087AC
.next_616:
  jmp .miss_612
.hi_612:
  cmp rcx, 0x8087B0
  jne .next_617
  jmp Label_8087B0
.next_617:
  cmp rcx, 0x8087B4
  jne .next_618
  jmp Label_8087B4
.next_618:
  cmp rcx, 0x8087B8
  jne .next_619
  jmp Label_8087B8
.next_619:
  cmp rcx, 0x8087BC
  jne .next_620
  jmp Label_8087BC
.next_620:
.miss_612:
.miss_602:
  jmp .miss_601
.hi_601:
  cmp rcx, 0x8087E0
  jae .hi_621
  cmp rcx, 0x8087D0
  jae .hi_622
  cmp rcx, 0x8087C0
  jne .next_623
  jmp Label_8087C0
.next_623:
  cmp rcx, 0x8087C4
  jne .next_624
  jmp Label_8087C4
.next_624:
  cmp rcx, 0x8087C8
  jne .next_625
  jmp Label_8087C8
.next_625:
  cmp rcx, 0x8087CC
  jne .next_626
  jmp Label_8087CC
.next_626:
  jmp .miss_622
.hi_622:
  cmp rcx, 0x8087D0
  jne .next_627
  jmp Label_8087D0
.next_627:
  cmp rcx, 0x8087D4
  jne .next_628
  jmp Label_8087D4
.next_628:
  cmp rcx, 0x8087D8
  jne .next_629
  jmp Label_8087D8
.next_629:
  cmp rcx, 0x8087DC
  jne .next_630
  jmp Label_8087DC
.next_630:
.miss_622:
  jmp .miss_621
.hi_621:
  cmp rcx, 0x8087F0
  jae .hi_631
  cmp rcx, 0x8087E0
  jne .next_632
  jmp Label_8087E0
.next_632:
  cmp rcx, 0x8087E4
  jne .next_633
  jmp Label_8087E4
.next_633:
  cmp rcx, 0x8087E8
  jne .next_634
  jmp Label_8087E8
.next_634:
  cmp rcx, 0x8087EC
  jne .next_635
  jmp Label_8087EC
.next_635:
  jmp .miss_631
.hi_631:
  cmp rcx, 0x8087F0
  jne .next_636
  jmp Label_8087F0
.next_636:
  cmp rcx, 0x8087F4
  jne .next_637
  jmp Label_8087F4
.next_637:
  cmp rcx, 0x8087F8
  jne .next_638
  jmp Label_8087F8
.next_638:
  cmp rcx, 0x8087FC
  jne .next_639
  jmp Label_8087FC
.next_639:
.miss_631:
.miss_621:
.miss_601:
.miss_561:
.miss_481:
.miss_321:
.miss_1:
  jmp .miss_0
.hi_0:
  cmp rcx, 0x808C00
  jae .hi_640
  cmp rcx, 0x808A00
  jae .hi_641
  cmp rcx, 0x808900
  jae .hi_642
  cmp rcx, 0x808880
  jae .hi_643
  cmp rcx, 0x808840
  jae .hi_644
  cmp rcx, 0x808820
  jae .hi_645
  cmp rcx, 0x808810
  jae .hi_646
  cmp rcx, 0x808800
  jne .next_647
  jmp Label_808800
.next_647:
  cmp rcx, 0x808804
  jne .next_648
  jmp Label_808804
.next_648:
  cmp rcx, 0x808808
  jne .next_649
  jmp Label_808808
.next_649:
  cmp rcx, 0x80880C
  jne .next_650
  jmp Label_80880C
.next_650:
  jmp .miss_646
.hi_646:
  cmp rcx, 0x808810
  jne .next_651
  jmp Label_808810
.next_651:
  cmp rcx, 0x808814
  jne .next_652
  jmp Label_808814
.next_652:
  cmp rcx, 0x808818
  jne .next_653
  jmp Label_808818
.next_653:
  cmp rcx, 0x80881C
  jne .next_654
  jmp Label_80881C
.next_654:
.miss_646:
  jmp .miss_645
.hi_645:
  cmp rcx, 0x808830
  jae .hi_655
  cmp rcx, 0x808820
  jne .next_656
  jmp Label_808820
.next_656:
  cmp rcx, 0x808824
  jne .next_657
  jmp Label_808824
.next_657:
  cmp rcx, 0x808828
  jne .next_658
  jmp Label_808828
.next_658:
  cmp rcx, 0x80882C
  jne .next_659
  jmp Label_80882C
.next_659:
  jmp .miss_655
.hi_655:
  cmp rcx, 0x808830
  jne .next_660
  jmp Label_808830
.next_660:
  cmp rcx, 0x808834
  jne .next_661
  jmp Label_808834
.next_661:
  cmp rcx, 0x808838
  jne .next_662
  jmp Label_808838
.next_662:
  cmp rcx, 0x80883C
  jne .next_663
  jmp Label_80883C
.next_663:
.miss_655:
.miss_645:
  jmp .miss_644
.hi_644:
  cmp rcx, 0x808860
  jae .hi_664
  cmp rcx, 0x808850
  jae .hi_665
  cmp rcx, 0x808840
  jne .next_666
  jmp Label_808840
.next_666:
  cmp rcx, 0x808844
  jne .next_667
  jmp Label_808844
.next_667:
  cmp rcx, 0x808848
  jne .next_668
  jmp Label_808848
.next_668:
  cmp rcx, 0x80884C
  jne .next_669
  jmp Label_80884C
.next_669:
  jmp .miss_665
.hi_665:
  cmp rcx, 0x808850
  jne .next_670
  jmp Label_808850
.next_670:
  cmp rcx, 0x808854
  jne .next_671
  jmp Label_808854
.next_671:
  cmp rcx, 0x808858
  jne .next_672
  jmp Label_808858
.next_672:
  cmp rcx, 0x80885C
  jne .next_673
  jmp Label_80885C
.next_673:
.miss_665:
  jmp .miss_664
.hi_664:
  cmp rcx, 0x808870
  jae .hi_674
  cmp rcx, 0x808860
  jne .next_675
  jmp Label_808860
.next_675:
  cmp rcx, 0x808864
  jne .next_676
  jmp Label_808864
.next_676:
  cmp rcx, 0x808868
  jne .next_677
  jmp Label_808868
.next_677:
  cmp rcx, 0x80886C
  jne .next_678
  jmp Label_80886C
.next_678:
  jmp .miss_674
.hi_674:
  cmp rcx, 0x808870
  jne .next_679
  jmp Label_808870
.next_679:
  cmp rcx, 0x808874
  jne .next_680
  jmp Label_808874
.next_680:
  cmp rcx, 0x808878
  jne .next_681
  jmp Label_808878
.next_681:
  cmp rcx, 0x80887C
  jne .next_682
  jmp Label_80887C
.next_682:
.miss_674:
.miss_664:
.miss_644:
  jmp .miss_643
.hi_643:
  cmp rcx, 0x8088C0
  jae .hi_683
  cmp rcx, 0x8088A0
  jae .hi_684
  cmp rcx, 0x808890
  jae .hi_685
  cmp rcx, 0x808880
  jne .next_686
  jmp Label_808880
.next_686:
  cmp rcx, 0x808884
  jne .next_687
  jmp Label_808884
.next_687:
  cmp rcx, 0x808888
  jne .next_688
  jmp Label_808888
.next_688:
  cmp rcx, 0x80888C
  jne .next_689
  jmp Label_80888C
.next_689:
  jmp .miss_685
.hi_685:
  cmp rcx, 0x808890
  jne .next_690
  jmp Label_808890
.next_690:
  cmp rcx, 0x808894
  jne .next_691
  jmp Label_808894
.next_691:
  cmp rcx, 0x808898
  jne .next_692
  jmp Label_808898
.next_692:
  cmp rcx, 0x80889C
  jne .next_693
  jmp Label_80889C
.next_693:
.miss_685:
  jmp .miss_684
.hi_684:
  cmp rcx, 0x8088B0
  jae .hi_694
  cmp rcx, 0x8088A0
  jne .next_695
  jmp Label_8088A0
.next_695:
  cmp rcx, 0x8088A4
  jne .next_696
  jmp Label_8088A4
.next_696:
  cmp rcx, 0x8088A8
  jne .next_697
  jmp Label_8088A8
.next_697:
  cmp rcx, 0x8088AC
  jne .next_698
  jmp Label_8088AC
.next_698:
  jmp .miss_694
.hi_694:
  cmp rcx, 0x8088B0
  jne .next_699
  jmp Label_8088B0
.next_699:
  cmp rcx, 0x8088B4
  jne .next_700
  jmp Label_8088B4
.next_700:
  cmp rcx, 0x8088B8
  jne .next_701
  jmp Label_8088B8
.next_701:
  cmp rcx, 0x8088BC
  jne .next_702
  jmp Label_8088BC
.next_702:
.miss_694:
.miss_684:
  jmp .miss_683
.hi_683:
  cmp rcx, 0x8088E0
  jae .hi_703
  cmp rcx, 0x8088D0
  jae .hi_704
  cmp rcx, 0x8088C0
  jne .next_705
  jmp Label_8088C0
.next_705:
  cmp rcx, 0x8088C4
  jne .next_706
  jmp Label_8088C4
.next_706:
  cmp rcx, 0x8088C8
  jne .next_707
  jmp Label_8088C8
.next_707:
  cmp rcx, 0x8088CC
  jne .next_708
  jmp Label_8088CC
.next_708:
  jmp .miss_704
.hi_704:
  cmp rcx, 0x8088D0
  jne .next_709
  jmp Label_8088D0
.next_709:
  cmp rcx, 0x8088D4
  jne .next_710
  jmp Label_8088D4
.next_710:
  cmp rcx, 0x8088D8
  jne .next_711
  jmp Label_8088D8
.next_711:
  cmp rcx, 0x8088DC
  jne .next_712
  jmp Label_8088DC
.next_712:
.miss_704:
  jmp .miss_703
.hi_703:
  cmp rcx, 0x8088F0
  jae .hi_713
  cmp rcx, 0x8088E0
  jne .next_714
  jmp Label_8088E0
.next_714:
  cmp rcx, 0x8088E4
  jne .next_715
  jmp Label_8088E4
.next_715:
  cmp rcx, 0x8088E8
  jne .next_716
  jmp Label_8088E8
.next_716:
  cmp rcx, 0x8088EC
  jne .next_717
  jmp Label_8088EC
.next_717:
  jmp .miss_713
.hi_713:
  cmp rcx, 0x8088F0
  jne .next_718
  jmp Label_8088F0
.next_718:
  cmp rcx, 0x8088F4
  jne .next_719
  jmp Label_8088F4
.next_719:
  cmp rcx, 0x8088F8
  jne .next_720
  jmp Label_8088F8
.next_720:
  cmp rcx, 0x8088FC
  jne .next_721
  jmp Label_8088FC
.next_721:
.miss_713:
.miss_703:
.miss_683:
.miss_643:
  jmp .miss_642
.hi_642:
  cmp rcx, 0x808980
  jae .hi_722
  cmp rcx, 0x808940
  jae .hi_723
  cmp rcx, 0x808920
  jae .hi_724
  cmp rcx, 0x808910
  jae .hi_725
  cmp rcx, 0x808900
  jne .next_726
  jmp Label_808900
.next_726:
  cmp rcx, 0x808904
  jne .next_727
  jmp Label_808904
.next_727:
  cmp rcx, 0x808908
  jne .next_728
  jmp Label_808908
.next_728:
  cmp rcx, 0x80890C
  jne .next_729
  jmp Label_80890C
.next_729:
  jmp .miss_725
.hi_725:
  cmp rcx, 0x808910
  jne .next_730
  jmp Label_808910
.next_730:
  cmp rcx, 0x808914
  jne .next_731
  jmp Label_808914
.next_731:
  cmp rcx, 0x808918
  jne .next_732
  jmp Label_808918
.next_732:
  cmp rcx, 0x80891C
  jne .next_733
  jmp Label_80891C
.next_733:
.miss_725:
  jmp .miss_724
.hi_724:
  cmp rcx, 0x808930
  jae .hi_734
  cmp rcx, 0x808920
  jne .next_735
  jmp Label_808920
.next_735:
  cmp rcx, 0x808924
  jne .next_736
  jmp Label_808924
.next_736:
  cmp rcx, 0x808928
  jne .next_737
  jmp Label_808928
.next_737:
  cmp rcx, 0x80892C
  jne .next_738
  jmp Label_80892C
.next_738:
  jmp .miss_734
.hi_734:
  cmp rcx, 0x808930
  jne .next_739
  jmp Label_808930
.next_739:
  cmp rcx, 0x808934
  jne .next_740
  jmp Label_808934
.next_740:
  cmp rcx, 0x808938
  jne .next_741
  jmp Label_808938
.next_741:
  cmp rcx, 0x80893C
  jne .next_742
  jmp Label_80893C
.next_742:
.miss_734:
.miss_724:
  jmp .miss_723
.hi_723:
  cmp rcx, 0x808960
  jae .hi_743
  cmp rcx, 0x808950
  jae .hi_744
  cmp rcx, 0x808940
  jne .next_745
  jmp Label_808940
.next_745:
  cmp rcx, 0x808944
  jne .next_746
  jmp Label_808944
.next_746:
  cmp rcx, 0x808948
  jne .next_747
  jmp Label_808948
.next_747:
  cmp rcx, 0x80894C
  jne .next_748
  jmp Label_80894C
.next_748:
  jmp .miss_744
.hi_744:
  cmp rcx, 0x808950
  jne .next_749
  jmp Label_808950
.next_749:
  cmp rcx, 0x808954
  jne .next_750
  jmp Label_808954
.next_750:
  cmp rcx, 0x808958
  jne .next_751
  jmp Label_808958
.next_751:
  cmp rcx, 0x80895C
  jne .next_752
  jmp Label_80895C
.next_752:
.miss_744:
  jmp .miss_743
.hi_743:
  cmp rcx, 0x808970
  jae .hi_753
  cmp rcx, 0x808960
  jne .next_754
  jmp Label_808960
.next_754:
  cmp rcx, 0x808964
  jne .next_755
  jmp Label_808964
.next_755:
  cmp rcx, 0x808968
  jne .next_756
  jmp Label_808968
.next_756:
  cmp rcx, 0x80896C
  jne .next_757
  jmp Label_80896C
.next_757:
  jmp .miss_753
.hi_753:
  cmp rcx, 0x808970
  jne .next_758
  jmp Label_808970
.next_758:
  cmp rcx, 0x808974
  jne .next_759
  jmp Label_808974
.next_759:
  cmp rcx, 0x808978
  jne .next_760
  jmp Label_808978
.next_760:
  cmp rcx, 0x80897C
  jne .next_761
  jmp Label_80897C
.next_761:
.miss_753:
.miss_743:
.miss_723:
  jmp .miss_722
.hi_722:
  cmp rcx, 0x8089C0
  jae .hi_762
  cmp rcx, 0x8089A0
  jae .hi_763
  cmp rcx, 0x808990
  jae .hi_764
  cmp rcx, 0x808980
  jne .next_765
  jmp Label_808980
.next_765:
  cmp rcx, 0x808984
  jne .next_766
  jmp Label_808984
.next_766:
  cmp rcx, 0x808988
  jne .next_767
  jmp Label_808988
.next_767:
  cmp rcx, 0x80898C
  jne .next_768
  jmp Label_80898C
.next_768:
  jmp .miss_764
.hi_764:
  cmp rcx, 0x808990
  jne .next_769
  jmp Label_808990
.next_769:
  cmp rcx, 0x808994
  jne .next_770
  jmp Label_808994
.next_770:
  cmp rcx, 0x808998
  jne .next_771
  jmp Label_808998
.next_771:
  cmp rcx, 0x80899C
  jne .next_772
  jmp Label_80899C
.next_772:
.miss_764:
  jmp .miss_763
.hi_763:
  cmp rcx, 0x8089B0
  jae .hi_773
  cmp rcx, 0x8089A0
  jne .next_774
  jmp Label_8089A0
.next_774:
  cmp rcx, 0x8089A4
  jne .next_775
  jmp Label_8089A4
.next_775:
  cmp rcx, 0x8089A8
  jne .next_776
  jmp Label_8089A8
.next_776:
  cmp rcx, 0x8089AC
  jne .next_777
  jmp Label_8089AC
.next_777:
  jmp .miss_773
.hi_773:
  cmp rcx, 0x8089B0
  jne .next_778
  jmp Label_8089B0
.next_778:
  cmp rcx, 0x8089B4
  jne .next_779
  jmp Label_8089B4
.next_779:
  cmp rcx, 0x8089B8
  jne .next_780
  jmp Label_8089B8
.next_780:
  cmp rcx, 0x8089BC
  jne .next_781
  jmp Label_8089BC
.next_781:
.miss_773:
.miss_763:
  jmp .miss_762
.hi_762:
  cmp rcx, 0x8089E0
  jae .hi_782
  cmp rcx, 0x8089D0
  jae .hi_783
  cmp rcx, 0x8089C0
  jne .next_784
  jmp Label_8089C0
.next_784:
  cmp rcx, 0x8089C4
  jne .next_785
  jmp Label_8089C4
.next_785:
  cmp rcx, 0x8089C8
  jne .next_786
  jmp Label_8089C8
.next_786:
  cmp rcx, 0x8089CC
  jne .next_787
  jmp Label_8089CC
.next_787:
  jmp .miss_783
.hi_783:
  cmp rcx, 0x8089D0
  jne .next_788
  jmp Label_8089D0
.next_788:
  cmp rcx, 0x8089D4
  jne .next_789
  jmp Label_8089D4
.next_789:
  cmp rcx, 0x8089D8
  jne .next_790
  jmp Label_8089D8
.next_790:
  cmp rcx, 0x8089DC
  jne .next_791
  jmp Label_8089DC
.next_791:
.miss_783:
  jmp .miss_782
.hi_782:
  cmp rcx, 0x8089F0
  jae .hi_792
  cmp rcx, 0x8089E0
  jne .next_793
  jmp Label_8089E0
.next_793:
  cmp rcx, 0x8089E4
  jne .next_794
  jmp Label_8089E4
.next_794:
  cmp rcx, 0x8089E8
  jne .next_795
  jmp Label_8089E8
.next_795:
  cmp rcx, 0x8089EC
  jne .next_796
  jmp Label_8089EC
.next_796:
  jmp .miss_792
.hi_792:
  cmp rcx, 0x8089F0
  jne .next_797
  jmp Label_8089F0
.next_797:
  cmp rcx, 0x8089F4
  jne .next_798
  jmp Label_8089F4
.next_798:
  cmp rcx, 0x8089F8
  jne .next_799
  jmp Label_8089F8
.next_799:
  cmp rcx, 0x8089FC
  jne .next_800
  jmp Label_8089FC
.next_800:
.miss_792:
.miss_782:
.miss_762:
.miss_722:
.miss_642:
  jmp .miss_641
.hi_641:
  cmp rcx, 0x808B00
  jae .hi_801
  cmp rcx, 0x808A80
  jae .hi_802
  cmp rcx, 0x808A40
  jae .hi_803
  cmp rcx, 0x808A20
  jae .hi_804
  cmp rcx, 0x808A10
  jae .hi_805
  cmp rcx, 0x808A00
  jne .next_806
  jmp Label_808A00
.next_806:
  cmp rcx, 0x808A04
  jne .next_807
  jmp Label_808A04
.next_807:
  cmp rcx, 0x808A08
  jne .next_808
  jmp Label_808A08
.next_808:
  cmp rcx, 0x808A0C
  jne .next_809
  jmp Label_808A0C
.next_809:
  jmp .miss_805
.hi_805:
  cmp rcx, 0x808A10
  jne .next_810
  jmp Label_808A10
.next_810:
  cmp rcx, 0x808A14
  jne .next_811
  jmp Label_808A14
.next_811:
  cmp rcx, 0x808A18
  jne .next_812
  jmp Label_808A18
.next_812:
  cmp rcx, 0x808A1C
  jne .next_813
  jmp Label_808A1C
.next_813:
.miss_805:
  jmp .miss_804
.hi_804:
  cmp rcx, 0x808A30
  jae .hi_814
  cmp rcx, 0x808A20
  jne .next_815
  jmp Label_808A20
.next_815:
  cmp rcx, 0x808A24
  jne .next_816
  jmp Label_808A24
.next_816:
  cmp rcx, 0x808A28
  jne .next_817
  jmp Label_808A28
.next_817:
  cmp rcx, 0x808A2C
  jne .next_818
  jmp Label_808A2C
.next_818:
  jmp .miss_814
.hi_814:
  cmp rcx, 0x808A30
  jne .next_819
  jmp Label_808A30
.next_819:
  cmp rcx, 0x808A34
  jne .next_820
  jmp Label_808A34
.next_820:
  cmp rcx, 0x808A38
  jne .next_821
  jmp Label_808A38
.next_821:
  cmp rcx, 0x808A3C
  jne .next_822
  jmp Label_808A3C
.next_822:
.miss_814:
.miss_804:
  jmp .miss_803
.hi_803:
  cmp rcx, 0x808A60
  jae .hi_823
  cmp rcx, 0x808A50
  jae .hi_824
  cmp rcx, 0x808A40
  jne .next_825
  jmp Label_808A40
.next_825:
  cmp rcx, 0x808A44
  jne .next_826
  jmp Label_808A44
.next_826:
  cmp rcx, 0x808A48
  jne .next_827
  jmp Label_808A48
.next_827:
  cmp rcx, 0x808A4C
  jne .next_828
  jmp Label_808A4C
.next_828:
  jmp .miss_824
.hi_824:
  cmp rcx, 0x808A50
  jne .next_829
  jmp Label_808A50
.next_829:
  cmp rcx, 0x808A54
  jne .next_830
  jmp Label_808A54
.next_830:
  cmp rcx, 0x808A58
  jne .next_831
  jmp Label_808A58
.next_831:
  cmp rcx, 0x808A5C
  jne .next_832
  jmp Label_808A5C
.next_832:
.miss_824:
  jmp .miss_823
.hi_823:
  cmp rcx, 0x808A70
  jae .hi_833
  cmp rcx, 0x808A60
  jne .next_834
  jmp Label_808A60
.next_834:
  cmp rcx, 0x808A64
  jne .next_835
  jmp Label_808A64
.next_835:
  cmp rcx, 0x808A68
  jne .next_836
  jmp Label_808A68
.next_836:
  cmp rcx, 0x808A6C
  jne .next_837
  jmp Label_808A6C
.next_837:
  jmp .miss_833
.hi_833:
  cmp rcx, 0x808A70
  jne .next_838
  jmp Label_808A70
.next_838:
  cmp rcx, 0x808A74
  jne .next_839
  jmp Label_808A74
.next_839:
  cmp rcx, 0x808A78
  jne .next_840
  jmp Label_808A78
.next_840:
  cmp rcx, 0x808A7C
  jne .next_841
  jmp Label_808A7C
.next_841:
.miss_833:
.miss_823:
.miss_803:
  jmp .miss_802
.hi_802:
  cmp rcx, 0x808AC0
  jae .hi_842
  cmp rcx, 0x808AA0
  jae .hi_843
  cmp rcx, 0x808A90
  jae .hi_844
  cmp rcx, 0x808A80
  jne .next_845
  jmp Label_808A80
.next_845:
  cmp rcx, 0x808A84
  jne .next_846
  jmp Label_808A84
.next_846:
  cmp rcx, 0x808A88
  jne .next_847
  jmp Label_808A88
.next_847:
  cmp rcx, 0x808A8C
  jne .next_848
  jmp Label_808A8C
.next_848:
  jmp .miss_844
.hi_844:
  cmp rcx, 0x808A90
  jne .next_849
  jmp Label_808A90
.next_849:
  cmp rcx, 0x808A94
  jne .next_850
  jmp Label_808A94
.next_850:
  cmp rcx, 0x808A98
  jne .next_851
  jmp Label_808A98
.next_851:
  cmp rcx, 0x808A9C
  jne .next_852
  jmp Label_808A9C
.next_852:
.miss_844:
  jmp .miss_843
.hi_843:
  cmp rcx, 0x808AB0
  jae .hi_853
  cmp rcx, 0x808AA0
  jne .next_854
  jmp Label_808AA0
.next_854:
  cmp rcx, 0x808AA4
  jne .next_855
  jmp Label_808AA4
.next_855:
  cmp rcx, 0x808AA8
  jne .next_856
  jmp Label_808AA8
.next_856:
  cmp rcx, 0x808AAC
  jne .next_857
  jmp Label_808AAC
.next_857:
  jmp .miss_853
.hi_853:
  cmp rcx, 0x808AB0
  jne .next_858
  jmp Label_808AB0
.next_858:
  cmp rcx, 0x808AB4
  jne .next_859
  jmp Label_808AB4
.next_859:
  cmp rcx, 0x808AB8
  jne .next_860
  jmp Label_808AB8
.next_860:
  cmp rcx, 0x808ABC
  jne .next_861
  jmp Label_808ABC
.next_861:
.miss_853:
.miss_843:
  jmp .miss_842
.hi_842:
  cmp rcx, 0x808AE0
  jae .hi_862
  cmp rcx, 0x808AD0
  jae .hi_863
  cmp rcx, 0x808AC0
  jne .next_864
  jmp Label_808AC0
.next_864:
  cmp rcx, 0x808AC4
  jne .next_865
  jmp Label_808AC4
.next_865:
  cmp rcx, 0x808AC8
  jne .next_866
  jmp Label_808AC8
.next_866:
  cmp rcx, 0x808ACC
  jne .next_867
  jmp Label_808ACC
.next_867:
  jmp .miss_863
.hi_863:
  cmp rcx, 0x808AD0
  jne .next_868
  jmp Label_808AD0
.next_868:
  cmp rcx, 0x808AD4
  jne .next_869
  jmp Label_808AD4
.next_869:
  cmp rcx, 0x808AD8
  jne .next_870
  jmp Label_808AD8
.next_870:
  cmp rcx, 0x808ADC
  jne .next_871
  jmp Label_808ADC
.next_871:
.miss_863:
  jmp .miss_862
.hi_862:
  cmp rcx, 0x808AF0
  jae .hi_872
  cmp rcx, 0x808AE0
  jne .next_873
  jmp Label_808AE0
.next_873:
  cmp rcx, 0x808AE4
  jne .next_874
  jmp Label_808AE4
.next_874:
  cmp rcx, 0x808AE8
  jne .next_875
  jmp Label_808AE8
.next_875:
  cmp rcx, 0x808AEC
  jne .next_876
  jmp Label_808AEC
.next_876:
  jmp .miss_872
.hi_872:
  cmp rcx, 0x808AF0
  jne .next_877
  jmp Label_808AF0
.next_877:
  cmp rcx, 0x808AF4
  jne .next_878
  jmp Label_808AF4
.next_878:
  cmp rcx, 0x808AF8
  jne .next_879
  jmp Label_808AF8
.next_879:
  cmp rcx, 0x808AFC
  jne .next_880
  jmp Label_808AFC
.next_880:
.miss_872:
.miss_862:
.miss_842:
.miss_802:
  jmp .miss_801
.hi_801:
  cmp rcx, 0x808B80
  jae .hi_881
  cmp rcx, 0x808B40
  jae .hi_882
  cmp rcx, 0x808B20
  jae .hi_883
  cmp rcx, 0x808B10
  jae .hi_884
  cmp rcx, 0x808B00
  jne .next_885
  jmp Label_808B00
.next_885:
  cmp rcx, 0x808B04
  jne .next_886
  jmp Label_808B04
.next_886:
  cmp rcx, 0x808B08
  jne .next_887
  jmp Label_808B08
.next_887:
  cmp rcx, 0x808B0C
  jne .next_888
  jmp Label_808B0C
.next_888:
  jmp .miss_884
.hi_884:
  cmp rcx, 0x808B10
  jne .next_889
  jmp Label_808B10
.next_889:
  cmp rcx, 0x808B14
  jne .next_890
  jmp Label_808B14
.next_890:
  cmp rcx, 0x808B18
  jne .next_891
  jmp Label_808B18
.next_891:
  cmp rcx, 0x808B1C
  jne .next_892
  jmp Label_808B1C
.next_892:
.miss_884:
  jmp .miss_883
.hi_883:
  cmp rcx, 0x808B30
  jae .hi_893
  cmp rcx, 0x808B20
  jne .next_894
  jmp Label_808B20
.next_894:
  cmp rcx, 0x808B24
  jne .next_895
  jmp Label_808B24
.next_895:
  cmp rcx, 0x808B28
  jne .next_896
  jmp Label_808B28
.next_896:
  cmp rcx, 0x808B2C
  jne .next_897
  jmp Label_808B2C
.next_897:
  jmp .miss_893
.hi_893:
  cmp rcx, 0x808B30
  jne .next_898
  jmp Label_808B30
.next_898:
  cmp rcx, 0x808B34
  jne .next_899
  jmp Label_808B34
.next_899:
  cmp rcx, 0x808B38
  jne .next_900
  jmp Label_808B38
.next_900:
  cmp rcx, 0x808B3C
  jne .next_901
  jmp Label_808B3C
.next_901:
.miss_893:
.miss_883:
  jmp .miss_882
.hi_882:
  cmp rcx, 0x808B60
  jae .hi_902
  cmp rcx, 0x808B50
  jae .hi_903
  cmp rcx, 0x808B40
  jne .next_904
  jmp Label_808B40
.next_904:
  cmp rcx, 0x808B44
  jne .next_905
  jmp Label_808B44
.next_905:
  cmp rcx, 0x808B48
  jne .next_906
  jmp Label_808B48
.next_906:
  cmp rcx, 0x808B4C
  jne .next_907
  jmp Label_808B4C
.next_907:
  jmp .miss_903
.hi_903:
  cmp rcx, 0x808B50
  jne .next_908
  jmp Label_808B50
.next_908:
  cmp rcx, 0x808B54
  jne .next_909
  jmp Label_808B54
.next_909:
  cmp rcx, 0x808B58
  jne .next_910
  jmp Label_808B58
.next_910:
  cmp rcx, 0x808B5C
  jne .next_911
  jmp Label_808B5C
.next_911:
.miss_903:
  jmp .miss_902
.hi_902:
  cmp rcx, 0x808B70
  jae .hi_912
  cmp rcx, 0x808B60
  jne .next_913
  jmp Label_808B60
.next_913:
  cmp rcx, 0x808B64
  jne .next_914
  jmp Label_808B64
.next_914:
  cmp rcx, 0x808B68
  jne .next_915
  jmp Label_808B68
.next_915:
  cmp rcx, 0x808B6C
  jne .next_916
  jmp Label_808B6C
.next_916:
  jmp .miss_912
.hi_912:
  cmp rcx, 0x808B70
  jne .next_917
  jmp Label_808B70
.next_917:
  cmp rcx, 0x808B74
  jne .next_918
  jmp Label_808B74
.next_918:
  cmp rcx, 0x808B78
  jne .next_919
  jmp Label_808B78
.next_919:
  cmp rcx, 0x808B7C
  jne .next_920
  jmp Label_808B7C
.next_920:
.miss_912:
.miss_902:
.miss_882:
  jmp .miss_881
.hi_881:
  cmp rcx, 0x808BC0
  jae .hi_921
  cmp rcx, 0x808BA0
  jae .hi_922
  cmp rcx, 0x808B90
  jae .hi_923
  cmp rcx, 0x808B80
  jne .next_924
  jmp Label_808B80
.next_924:
  cmp rcx, 0x808B84
  jne .next_925
  jmp Label_808B84
.next_925:
  cmp rcx, 0x808B88
  jne .next_926
  jmp Label_808B88
.next_926:
  cmp rcx, 0x808B8C
  jne .next_927
  jmp Label_808B8C
.next_927:
  jmp .miss_923
.hi_923:
  cmp rcx, 0x808B90
  jne .next_928
  jmp Label_808B90
.next_928:
  cmp rcx, 0x808B94
  jne .next_929
  jmp Label_808B94
.next_929:
  cmp rcx, 0x808B98
  jne .next_930
  jmp Label_808B98
.next_930:
  cmp rcx, 0x808B9C
  jne .next_931
  jmp Label_808B9C
.next_931:
.miss_923:
  jmp .miss_922
.hi_922:
  cmp rcx, 0x808BB0
  jae .hi_932
  cmp rcx, 0x808BA0
  jne .next_933
  jmp Label_808BA0
.next_933:
  cmp rcx, 0x808BA4
  jne .next_934
  jmp Label_808BA4
.next_934:
  cmp rcx, 0x808BA8
  jne .next_935
  jmp Label_808BA8
.next_935:
  cmp rcx, 0x808BAC
  jne .next_936
  jmp Label_808BAC
.next_936:
  jmp .miss_932
.hi_932:
  cmp rcx, 0x808BB0
  jne .next_937
  jmp Label_808BB0
.next_937:
  cmp rcx, 0x808BB4
  jne .next_938
  jmp Label_808BB4
.next_938:
  cmp rcx, 0x808BB8
  jne .next_939
  jmp Label_808BB8
.next_939:
  cmp rcx, 0x808BBC
  jne .next_940
  jmp Label_808BBC
.next_940:
.miss_932:
.miss_922:
  jmp .miss_921
.hi_921:
  cmp rcx, 0x808BE0
  jae .hi_941
  cmp rcx, 0x808BD0
  jae .hi_942
  cmp rcx, 0x808BC0
  jne .next_943
  jmp Label_808BC0
.next_943:
  cmp rcx, 0x808BC4
  jne .next_944
  jmp Label_808BC4
.next_944:
  cmp rcx, 0x808BC8
  jne .next_945
  jmp Label_808BC8
.next_945:
  cmp rcx, 0x808BCC
  jne .next_946
  jmp Label_808BCC
.next_946:
  jmp .miss_942
.hi_942:
  cmp rcx, 0x808BD0
  jne .next_947
  jmp Label_808BD0
.next_947:
  cmp rcx, 0x808BD4
  jne .next_948
  jmp Label_808BD4
.next_948:
  cmp rcx, 0x808BD8
  jne .next_949
  jmp Label_808BD8
.next_949:
  cmp rcx, 0x808BDC
  jne .next_950
  jmp Label_808BDC
.next_950:
.miss_942:
  jmp .miss_941
.hi_941:
  cmp rcx, 0x808BF0
  jae .hi_951
  cmp rcx, 0x808BE0
  jne .next_952
  jmp Label_808BE0
.next_952:
  cmp rcx, 0x808BE4
  jne .next_953
  jmp Label_808BE4
.next_953:
  cmp rcx, 0x808BE8
  jne .next_954
  jmp Label_808BE8
.next_954:
  cmp rcx, 0x808BEC
  jne .next_955
  jmp Label_808BEC
.next_955:
  jmp .miss_951
.hi_951:
  cmp rcx, 0x808BF0
  jne .next_956
  jmp Label_808BF0
.next_956:
  cmp rcx, 0x808BF4
  jne .next_957
  jmp Label_808BF4
.next_957:
  cmp rcx, 0x808BF8
  jne .next_958
  jmp Label_808BF8
.next_958:
  cmp rcx, 0x808BFC
  jne .next_959
  jmp Label_808BFC
.next_959:
.miss_951:
.miss_941:
.miss_921:
.miss_881:
.miss_801:
.miss_641:
  jmp .miss_640
.hi_640:
  cmp rcx, 0x808E00
  jae .hi_960
  cmp rcx, 0x808D00
  jae .hi_961
  cmp rcx, 0x808C80
  jae .hi_962
  cmp rcx, 0x808C40
  jae .hi_963
  cmp rcx, 0x808C20
  jae .hi_964
  cmp rcx, 0x808C10
  jae .hi_965
  cmp rcx, 0x808C00
  jne .next_966
  jmp Label_808C00
.next_966:
  cmp rcx, 0x808C04
  jne .next_967
  jmp Label_808C04
.next_967:
  cmp rcx, 0x808C08
  jne .next_968
  jmp Label_808C08
.next_968:
  cmp rcx, 0x808C0C
  jne .next_969
  jmp Label_808C0C
.next_969:
  jmp .miss_965
.hi_965:
  cmp rcx, 0x808C10
  jne .next_970
  jmp Label_808C10
.next_970:
  cmp rcx, 0x808C14
  jne .next_971
  jmp Label_808C14
.next_971:
  cmp rcx, 0x808C18
  jne .next_972
  jmp Label_808C18
.next_972:
  cmp rcx, 0x808C1C
  jne .next_973
  jmp Label_808C1C
.next_973:
.miss_965:
  jmp .miss_964
.hi_964:
  cmp rcx, 0x808C30
  jae .hi_974
  cmp rcx, 0x808C20
  jne .next_975
  jmp Label_808C20
.next_975:
  cmp rcx, 0x808C24
  jne .next_976
  jmp Label_808C24
.next_976:
  cmp rcx, 0x808C28
  jne .next_977
  jmp Label_808C28
.next_977:
  cmp rcx, 0x808C2C
  jne .next_978
  jmp Label_808C2C
.next_978:
  jmp .miss_974
.hi_974:
  cmp rcx, 0x808C30
  jne .next_979
  jmp Label_808C30
.next_979:
  cmp rcx, 0x808C34
  jne .next_980
  jmp Label_808C34
.next_980:
  cmp rcx, 0x808C38
  jne .next_981
  jmp Label_808C38
.next_981:
  cmp rcx, 0x808C3C
  jne .next_982
  jmp Label_808C3C
.next_982:
.miss_974:
.miss_964:
  jmp .miss_963
.hi_963:
  cmp rcx, 0x808C60
  jae .hi_983
  cmp rcx, 0x808C50
  jae .hi_984
  cmp rcx, 0x808C40
  jne .next_985
  jmp Label_808C40
.next_985:
  cmp rcx, 0x808C44
  jne .next_986
  jmp Label_808C44
.next_986:
  cmp rcx, 0x808C48
  jne .next_987
  jmp Label_808C48
.next_987:
  cmp rcx, 0x808C4C
  jne .next_988
  jmp Label_808C4C
.next_988:
  jmp .miss_984
.hi_984:
  cmp rcx, 0x808C50
  jne .next_989
  jmp Label_808C50
.next_989:
  cmp rcx, 0x808C54
  jne .next_990
  jmp Label_808C54
.next_990:
  cmp rcx, 0x808C58
  jne .next_991
  jmp Label_808C58
.next_991:
  cmp rcx, 0x808C5C
  jne .next_992
  jmp Label_808C5C
.next_992:
.miss_984:
  jmp .miss_983
.hi_983:
  cmp rcx, 0x808C70
  jae .hi_993
  cmp rcx, 0x808C60
  jne .next_994
  jmp Label_808C60
.next_994:
  cmp rcx, 0x808C64
  jne .next_995
  jmp Label_808C64
.next_995:
  cmp rcx, 0x808C68
  jne .next_996
  jmp Label_808C68
.next_996:
  cmp rcx, 0x808C6C
  jne .next_997
  jmp Label_808C6C
.next_997:
  jmp .miss_993
.hi_993:
  cmp rcx, 0x808C70
  jne .next_998
  jmp Label_808C70
.next_998:
  cmp rcx, 0x808C74
  jne .next_999
  jmp Label_808C74
.next_999:
  cmp rcx, 0x808C78
  jne .next_1000
  jmp Label_808C78
.next_1000:
  cmp rcx, 0x808C7C
  jne .next_1001
  jmp Label_808C7C
.next_1001:
.miss_993:
.miss_983:
.miss_963:
  jmp .miss_962
.hi_962:
  cmp rcx, 0x808CC0
  jae .hi_1002
  cmp rcx, 0x808CA0
  jae .hi_1003
  cmp rcx, 0x808C90
  jae .hi_1004
  cmp rcx, 0x808C80
  jne .next_1005
  jmp Label_808C80
.next_1005:
  cmp rcx, 0x808C84
  jne .next_1006
  jmp Label_808C84
.next_1006:
  cmp rcx, 0x808C88
  jne .next_1007
  jmp Label_808C88
.next_1007:
  cmp rcx, 0x808C8C
  jne .next_1008
  jmp Label_808C8C
.next_1008:
  jmp .miss_1004
.hi_1004:
  cmp rcx, 0x808C90
  jne .next_1009
  jmp Label_808C90
.next_1009:
  cmp rcx, 0x808C94
  jne .next_1010
  jmp Label_808C94
.next_1010:
  cmp rcx, 0x808C98
  jne .next_1011
  jmp Label_808C98
.next_1011:
  cmp rcx, 0x808C9C
  jne .next_1012
  jmp Label_808C9C
.next_1012:
.miss_1004:
  jmp .miss_1003
.hi_1003:
  cmp rcx, 0x808CB0
  jae .hi_1013
  cmp rcx, 0x808CA0
  jne .next_1014
  jmp Label_808CA0
.next_1014:
  cmp rcx, 0x808CA4
  jne .next_1015
  jmp Label_808CA4
.next_1015:
  cmp rcx, 0x808CA8
  jne .next_1016
  jmp Label_808CA8
.next_1016:
  cmp rcx, 0x808CAC
  jne .next_1017
  jmp Label_808CAC
.next_1017:
  jmp .miss_1013
.hi_1013:
  cmp rcx, 0x808CB0
  jne .next_1018
  jmp Label_808CB0
.next_1018:
  cmp rcx, 0x808CB4
  jne .next_1019
  jmp Label_808CB4
.next_1019:
  cmp rcx, 0x808CB8
  jne .next_1020
  jmp Label_808CB8
.next_1020:
  cmp rcx, 0x808CBC
  jne .next_1021
  jmp Label_808CBC
.next_1021:
.miss_1013:
.miss_1003:
  jmp .miss_1002
.hi_1002:
  cmp rcx, 0x808CE0
  jae .hi_1022
  cmp rcx, 0x808CD0
  jae .hi_1023
  cmp rcx, 0x808CC0
  jne .next_1024
  jmp Label_808CC0
.next_1024:
  cmp rcx, 0x808CC4
  jne .next_1025
  jmp Label_808CC4
.next_1025:
  cmp rcx, 0x808CC8
  jne .next_1026
  jmp Label_808CC8
.next_1026:
  cmp rcx, 0x808CCC
  jne .next_1027
  jmp Label_808CCC
.next_1027:
  jmp .miss_1023
.hi_1023:
  cmp rcx, 0x808CD0
  jne .next_1028
  jmp Label_808CD0
.next_1028:
  cmp rcx, 0x808CD4
  jne .next_1029
  jmp Label_808CD4
.next_1029:
  cmp rcx, 0x808CD8
  jne .next_1030
  jmp Label_808CD8
.next_1030:
  cmp rcx, 0x808CDC
  jne .next_1031
  jmp Label_808CDC
.next_1031:
.miss_1023:
  jmp .miss_1022
.hi_1022:
  cmp rcx, 0x808CF0
  jae .hi_1032
  cmp rcx, 0x808CE0
  jne .next_1033
  jmp Label_808CE0
.next_1033:
  cmp rcx, 0x808CE4
  jne .next_1034
  jmp Label_808CE4
.next_1034:
  cmp rcx, 0x808CE8
  jne .next_1035
  jmp Label_808CE8
.next_1035:
  cmp rcx, 0x808CEC
  jne .next_1036
  jmp Label_808CEC
.next_1036:
  jmp .miss_1032
.hi_1032:
  cmp rcx, 0x808CF0
  jne .next_1037
  jmp Label_808CF0
.next_1037:
  cmp rcx, 0x808CF4
  jne .next_1038
  jmp Label_808CF4
.next_1038:
  cmp rcx, 0x808CF8
  jne .next_1039
  jmp Label_808CF8
.next_1039:
  cmp rcx, 0x808CFC
  jne .next_1040
  jmp Label_808CFC
.next_1040:
.miss_1032:
.miss_1022:
.miss_1002:
.miss_962:
  jmp .miss_961
.hi_961:
  cmp rcx, 0x808D80
  jae .hi_1041
  cmp rcx, 0x808D40
  jae .hi_1042
  cmp rcx, 0x808D20
  jae .hi_1043
  cmp rcx, 0x808D10
  jae .hi_1044
  cmp rcx, 0x808D00
  jne .next_1045
  jmp Label_808D00
.next_1045:
  cmp rcx, 0x808D04
  jne .next_1046
  jmp Label_808D04
.next_1046:
  cmp rcx, 0x808D08
  jne .next_1047
  jmp Label_808D08
.next_1047:
  cmp rcx, 0x808D0C
  jne .next_1048
  jmp Label_808D0C
.next_1048:
  jmp .miss_1044
.hi_1044:
  cmp rcx, 0x808D10
  jne .next_1049
  jmp Label_808D10
.next_1049:
  cmp rcx, 0x808D14
  jne .next_1050
  jmp Label_808D14
.next_1050:
  cmp rcx, 0x808D18
  jne .next_1051
  jmp Label_808D18
.next_1051:
  cmp rcx, 0x808D1C
  jne .next_1052
  jmp Label_808D1C
.next_1052:
.miss_1044:
  jmp .miss_1043
.hi_1043:
  cmp rcx, 0x808D30
  jae .hi_1053
  cmp rcx, 0x808D20
  jne .next_1054
  jmp Label_808D20
.next_1054:
  cmp rcx, 0x808D24
  jne .next_1055
  jmp Label_808D24
.next_1055:
  cmp rcx, 0x808D28
  jne .next_1056
  jmp Label_808D28
.next_1056:
  cmp rcx, 0x808D2C
  jne .next_1057
  jmp Label_808D2C
.next_1057:
  jmp .miss_1053
.hi_1053:
  cmp rcx, 0x808D30
  jne .next_1058
  jmp Label_808D30
.next_1058:
  cmp rcx, 0x808D34
  jne .next_1059
  jmp Label_808D34
.next_1059:
  cmp rcx, 0x808D38
  jne .next_1060
  jmp Label_808D38
.next_1060:
  cmp rcx, 0x808D3C
  jne .next_1061
  jmp Label_808D3C
.next_1061:
.miss_1053:
.miss_1043:
  jmp .miss_1042
.hi_1042:
  cmp rcx, 0x808D60
  jae .hi_1062
  cmp rcx, 0x808D50
  jae .hi_1063
  cmp rcx, 0x808D40
  jne .next_1064
  jmp Label_808D40
.next_1064:
  cmp rcx, 0x808D44
  jne .next_1065
  jmp Label_808D44
.next_1065:
  cmp rcx, 0x808D48
  jne .next_1066
  jmp Label_808D48
.next_1066:
  cmp rcx, 0x808D4C
  jne .next_1067
  jmp Label_808D4C
.next_1067:
  jmp .miss_1063
.hi_1063:
  cmp rcx, 0x808D50
  jne .next_1068
  jmp Label_808D50
.next_1068:
  cmp rcx, 0x808D54
  jne .next_1069
  jmp Label_808D54
.next_1069:
  cmp rcx, 0x808D58
  jne .next_1070
  jmp Label_808D58
.next_1070:
  cmp rcx, 0x808D5C
  jne .next_1071
  jmp Label_808D5C
.next_1071:
.miss_1063:
  jmp .miss_1062
.hi_1062:
  cmp rcx, 0x808D70
  jae .hi_1072
  cmp rcx, 0x808D60
  jne .next_1073
  jmp Label_808D60
.next_1073:
  cmp rcx, 0x808D64
  jne .next_1074
  jmp Label_808D64
.next_1074:
  cmp rcx, 0x808D68
  jne .next_1075
  jmp Label_808D68
.next_1075:
  cmp rcx, 0x808D6C
  jne .next_1076
  jmp Label_808D6C
.next_1076:
  jmp .miss_1072
.hi_1072:
  cmp rcx, 0x808D70
  jne .next_1077
  jmp Label_808D70
.next_1077:
  cmp rcx, 0x808D74
  jne .next_1078
  jmp Label_808D74
.next_1078:
  cmp rcx, 0x808D78
  jne .next_1079
  jmp Label_808D78
.next_1079:
  cmp rcx, 0x808D7C
  jne .next_1080
  jmp Label_808D7C
.next_1080:
.miss_1072:
.miss_1062:
.miss_1042:
  jmp .miss_1041
.hi_1041:
  cmp rcx, 0x808DC0
  jae .hi_1081
  cmp rcx, 0x808DA0
  jae .hi_1082
  cmp rcx, 0x808D90
  jae .hi_1083
  cmp rcx, 0x808D80
  jne .next_1084
  jmp Label_808D80
.next_1084:
  cmp rcx, 0x808D84
  jne .next_1085
  jmp Label_808D84
.next_1085:
  cmp rcx, 0x808D88
  jne .next_1086
  jmp Label_808D88
.next_1086:
  cmp rcx, 0x808D8C
  jne .next_1087
  jmp Label_808D8C
.next_1087:
  jmp .miss_1083
.hi_1083:
  cmp rcx, 0x808D90
  jne .next_1088
  jmp Label_808D90
.next_1088:
  cmp rcx, 0x808D94
  jne .next_1089
  jmp Label_808D94
.next_1089:
  cmp rcx, 0x808D98
  jne .next_1090
  jmp Label_808D98
.next_1090:
  cmp rcx, 0x808D9C
  jne .next_1091
  jmp Label_808D9C
.next_1091:
.miss_1083:
  jmp .miss_1082
.hi_1082:
  cmp rcx, 0x808DB0
  jae .hi_1092
  cmp rcx, 0x808DA0
  jne .next_1093
  jmp Label_808DA0
.next_1093:
  cmp rcx, 0x808DA4
  jne .next_1094
  jmp Label_808DA4
.next_1094:
  cmp rcx, 0x808DA8
  jne .next_1095
  jmp Label_808DA8
.next_1095:
  cmp rcx, 0x808DAC
  jne .next_1096
  jmp Label_808DAC
.next_1096:
  jmp .miss_1092
.hi_1092:
  cmp rcx, 0x808DB0
  jne .next_1097
  jmp Label_808DB0
.next_1097:
  cmp rcx, 0x808DB4
  jne .next_1098
  jmp Label_808DB4
.next_1098:
  cmp rcx, 0x808DB8
  jne .next_1099
  jmp Label_808DB8
.next_1099:
  cmp rcx, 0x808DBC
  jne .next_1100
  jmp Label_808DBC
.next_1100:
.miss_1092:
.miss_1082:
  jmp .miss_1081
.hi_1081:
  cmp rcx, 0x808DE0
  jae .hi_1101
  cmp rcx, 0x808DD0
  jae .hi_1102
  cmp rcx, 0x808DC0
  jne .next_1103
  jmp Label_808DC0
.next_1103:
  cmp rcx, 0x808DC4
  jne .next_1104
  jmp Label_808DC4
.next_1104:
  cmp rcx, 0x808DC8
  jne .next_1105
  jmp Label_808DC8
.next_1105:
  cmp rcx, 0x808DCC
  jne .next_1106
  jmp Label_808DCC
.next_1106:
  jmp .miss_1102
.hi_1102:
  cmp rcx, 0x808DD0
  jne .next_1107
  jmp Label_808DD0
.next_1107:
  cmp rcx, 0x808DD4
  jne .next_1108
  jmp Label_808DD4
.next_1108:
  cmp rcx, 0x808DD8
  jne .next_1109
  jmp Label_808DD8
.next_1109:
  cmp rcx, 0x808DDC
  jne .next_1110
  jmp Label_808DDC
.next_1110:
.miss_1102:
  jmp .miss_1101
.hi_1101:
  cmp rcx, 0x808DF0
  jae .hi_1111
  cmp rcx, 0x808DE0
  jne .next_1112
  jmp Label_808DE0
.next_1112:
  cmp rcx, 0x808DE4
  jne .next_1113
  jmp Label_808DE4
.next_1113:
  cmp rcx, 0x808DE8
  jne .next_1114
  jmp Label_808DE8
.next_1114:
  cmp rcx, 0x808DEC
  jne .next_1115
  jmp Label_808DEC
.next_1115:
  jmp .miss_1111
.hi_1111:
  cmp rcx, 0x808DF0
  jne .next_1116
  jmp Label_808DF0
.next_1116:
  cmp rcx, 0x808DF4
  jne .next_1117
  jmp Label_808DF4
.next_1117:
  cmp rcx, 0x808DF8
  jne .next_1118
  jmp Label_808DF8
.next_1118:
  cmp rcx, 0x808DFC
  jne .next_1119
  jmp Label_808DFC
.next_1119:
.miss_1111:
.miss_1101:
.miss_1081:
.miss_1041:
.miss_961:
  jmp .miss_960
.hi_960:
  cmp rcx, 0x808F00
  jae .hi_1120
  cmp rcx, 0x808E80
  jae .hi_1121
  cmp rcx, 0x808E40
  jae .hi_1122
  cmp rcx, 0x808E20
  jae .hi_1123
  cmp rcx, 0x808E10
  jae .hi_1124
  cmp rcx, 0x808E00
  jne .next_1125
  jmp Label_808E00
.next_1125:
  cmp rcx, 0x808E04
  jne .next_1126
  jmp Label_808E04
.next_1126:
  cmp rcx, 0x808E08
  jne .next_1127
  jmp Label_808E08
.next_1127:
  cmp rcx, 0x808E0C
  jne .next_1128
  jmp Label_808E0C
.next_1128:
  jmp .miss_1124
.hi_1124:
  cmp rcx, 0x808E10
  jne .next_1129
  jmp Label_808E10
.next_1129:
  cmp rcx, 0x808E14
  jne .next_1130
  jmp Label_808E14
.next_1130:
  cmp rcx, 0x808E18
  jne .next_1131
  jmp Label_808E18
.next_1131:
  cmp rcx, 0x808E1C
  jne .next_1132
  jmp Label_808E1C
.next_1132:
.miss_1124:
  jmp .miss_1123
.hi_1123:
  cmp rcx, 0x808E30
  jae .hi_1133
  cmp rcx, 0x808E20
  jne .next_1134
  jmp Label_808E20
.next_1134:
  cmp rcx, 0x808E24
  jne .next_1135
  jmp Label_808E24
.next_1135:
  cmp rcx, 0x808E28
  jne .next_1136
  jmp Label_808E28
.next_1136:
  cmp rcx, 0x808E2C
  jne .next_1137
  jmp Label_808E2C
.next_1137:
  jmp .miss_1133
.hi_1133:
  cmp rcx, 0x808E30
  jne .next_1138
  jmp Label_808E30
.next_1138:
  cmp rcx, 0x808E34
  jne .next_1139
  jmp Label_808E34
.next_1139:
  cmp rcx, 0x808E38
  jne .next_1140
  jmp Label_808E38
.next_1140:
  cmp rcx, 0x808E3C
  jne .next_1141
  jmp Label_808E3C
.next_1141:
.miss_1133:
.miss_1123:
  jmp .miss_1122
.hi_1122:
  cmp rcx, 0x808E60
  jae .hi_1142
  cmp rcx, 0x808E50
  jae .hi_1143
  cmp rcx, 0x808E40
  jne .next_1144
  jmp Label_808E40
.next_1144:
  cmp rcx, 0x808E44
  jne .next_1145
  jmp Label_808E44
.next_1145:
  cmp rcx, 0x808E48
  jne .next_1146
  jmp Label_808E48
.next_1146:
  cmp rcx, 0x808E4C
  jne .next_1147
  jmp Label_808E4C
.next_1147:
  jmp .miss_1143
.hi_1143:
  cmp rcx, 0x808E50
  jne .next_1148
  jmp Label_808E50
.next_1148:
  cmp rcx, 0x808E54
  jne .next_1149
  jmp Label_808E54
.next_1149:
  cmp rcx, 0x808E58
  jne .next_1150
  jmp Label_808E58
.next_1150:
  cmp rcx, 0x808E5C
  jne .next_1151
  jmp Label_808E5C
.next_1151:
.miss_1143:
  jmp .miss_1142
.hi_1142:
  cmp rcx, 0x808E70
  jae .hi_1152
  cmp rcx, 0x808E60
  jne .next_1153
  jmp Label_808E60
.next_1153:
  cmp rcx, 0x808E64
  jne .next_1154
  jmp Label_808E64
.next_1154:
  cmp rcx, 0x808E68
  jne .next_1155
  jmp Label_808E68
.next_1155:
  cmp rcx, 0x808E6C
  jne .next_1156
  jmp Label_808E6C
.next_1156:
  jmp .miss_1152
.hi_1152:
  cmp rcx, 0x808E70
  jne .next_1157
  jmp Label_808E70
.next_1157:
  cmp rcx, 0x808E74
  jne .next_1158
  jmp Label_808E74
.next_1158:
  cmp rcx, 0x808E78
  jne .next_1159
  jmp Label_808E78
.next_1159:
  cmp rcx, 0x808E7C
  jne .next_1160
  jmp Label_808E7C
.next_1160:
.miss_1152:
.miss_1142:
.miss_1122:
  jmp .miss_1121
.hi_1121:
  cmp rcx, 0x808EC0
  jae .hi_1161
  cmp rcx, 0x808EA0
  jae .hi_1162
  cmp rcx, 0x808E90
  jae .hi_1163
  cmp rcx, 0x808E80
  jne .next_1164
  jmp Label_808E80
.next_1164:
  cmp rcx, 0x808E84
  jne .next_1165
  jmp Label_808E84
.next_1165:
  cmp rcx, 0x808E88
  jne .next_1166
  jmp Label_808E88
.next_1166:
  cmp rcx, 0x808E8C
  jne .next_1167
  jmp Label_808E8C
.next_1167:
  jmp .miss_1163
.hi_1163:
  cmp rcx, 0x808E90
  jne .next_1168
  jmp Label_808E90
.next_1168:
  cmp rcx, 0x808E94
  jne .next_1169
  jmp Label_808E94
.next_1169:
  cmp rcx, 0x808E98
  jne .next_1170
  jmp Label_808E98
.next_1170:
  cmp rcx, 0x808E9C
  jne .next_1171
  jmp Label_808E9C
.next_1171:
.miss_1163:
  jmp .miss_1162
.hi_1162:
  cmp rcx, 0x808EB0
  jae .hi_1172
  cmp rcx, 0x808EA0
  jne .next_1173
  jmp Label_808EA0
.next_1173:
  cmp rcx, 0x808EA4
  jne .next_1174
  jmp Label_808EA4
.next_1174:
  cmp rcx, 0x808EA8
  jne .next_1175
  jmp Label_808EA8
.next_1175:
  cmp rcx, 0x808EAC
  jne .next_1176
  jmp Label_808EAC
.next_1176:
  jmp .miss_1172
.hi_1172:
  cmp rcx, 0x808EB0
  jne .next_1177
  jmp Label_808EB0
.next_1177:
  cmp rcx, 0x808EB4
  jne .next_1178
  jmp Label_808EB4
.next_1178:
  cmp rcx, 0x808EB8
  jne .next_1179
  jmp Label_808EB8
.next_1179:
  cmp rcx, 0x808EBC
  jne .next_1180
  jmp Label_808EBC
.next_1180:
.miss_1172:
.miss_1162:
  jmp .miss_1161
.hi_1161:
  cmp rcx, 0x808EE0
  jae .hi_1181
  cmp rcx, 0x808ED0
  jae .hi_1182
  cmp rcx, 0x808EC0
  jne .next_1183
  jmp Label_808EC0
.next_1183:
  cmp rcx, 0x808EC4
  jne .next_1184
  jmp Label_808EC4
.next_1184:
  cmp rcx, 0x808EC8
  jne .next_1185
  jmp Label_808EC8
.next_1185:
  cmp rcx, 0x808ECC
  jne .next_1186
  jmp Label_808ECC
.next_1186:
  jmp .miss_1182
.hi_1182:
  cmp rcx, 0x808ED0
  jne .next_1187
  jmp Label_808ED0
.next_1187:
  cmp rcx, 0x808ED4
  jne .next_1188
  jmp Label_808ED4
.next_1188:
  cmp rcx, 0x808ED8
  jne .next_1189
  jmp Label_808ED8
.next_1189:
  cmp rcx, 0x808EDC
  jne .next_1190
  jmp Label_808EDC
.next_1190:
.miss_1182:
  jmp .miss_1181
.hi_1181:
  cmp rcx, 0x808EF0
  jae .hi_1191
  cmp rcx, 0x808EE0
  jne .next_1192
  jmp Label_808EE0
.next_1192:
  cmp rcx, 0x808EE4
  jne .next_1193
  jmp Label_808EE4
.next_1193:
  cmp rcx, 0x808EE8
  jne .next_1194
  jmp Label_808EE8
.next_1194:
  cmp rcx, 0x808EEC
  jne .next_1195
  jmp Label_808EEC
.next_1195:
  jmp .miss_1191
.hi_1191:
  cmp rcx, 0x808EF0
  jne .next_1196
  jmp Label_808EF0
.next_1196:
  cmp rcx, 0x808EF4
  jne .next_1197
  jmp Label_808EF4
.next_1197:
  cmp rcx, 0x808EF8
  jne .next_1198
  jmp Label_808EF8
.next_1198:
  cmp rcx, 0x808EFC
  jne .next_1199
  jmp Label_808EFC
.next_1199:
.miss_1191:
.miss_1181:
.miss_1161:
.miss_1121:
  jmp .miss_1120
.hi_1120:
  cmp rcx, 0x808F80
  jae .hi_1200
  cmp rcx, 0x808F40
  jae .hi_1201
  cmp rcx, 0x808F20
  jae .hi_1202
  cmp rcx, 0x808F10
  jae .hi_1203
  cmp rcx, 0x808F00
  jne .next_1204
  jmp Label_808F00
.next_1204:
  cmp rcx, 0x808F04
  jne .next_1205
  jmp Label_808F04
.next_1205:
  cmp rcx, 0x808F08
  jne .next_1206
  jmp Label_808F08
.next_1206:
  cmp rcx, 0x808F0C
  jne .next_1207
  jmp Label_808F0C
.next_1207:
  jmp .miss_1203
.hi_1203:
  cmp rcx, 0x808F10
  jne .next_1208
  jmp Label_808F10
.next_1208:
  cmp rcx, 0x808F14
  jne .next_1209
  jmp Label_808F14
.next_1209:
  cmp rcx, 0x808F18
  jne .next_1210
  jmp Label_808F18
.next_1210:
  cmp rcx, 0x808F1C
  jne .next_1211
  jmp Label_808F1C
.next_1211:
.miss_1203:
  jmp .miss_1202
.hi_1202:
  cmp rcx, 0x808F30
  jae .hi_1212
  cmp rcx, 0x808F20
  jne .next_1213
  jmp Label_808F20
.next_1213:
  cmp rcx, 0x808F24
  jne .next_1214
  jmp Label_808F24
.next_1214:
  cmp rcx, 0x808F28
  jne .next_1215
  jmp Label_808F28
.next_1215:
  cmp rcx, 0x808F2C
  jne .next_1216
  jmp Label_808F2C
.next_1216:
  jmp .miss_1212
.hi_1212:
  cmp rcx, 0x808F30
  jne .next_1217
  jmp Label_808F30
.next_1217:
  cmp rcx, 0x808F34
  jne .next_1218
  jmp Label_808F34
.next_1218:
  cmp rcx, 0x808F38
  jne .next_1219
  jmp Label_808F38
.next_1219:
  cmp rcx, 0x808F3C
  jne .next_1220
  jmp Label_808F3C
.next_1220:
.miss_1212:
.miss_1202:
  jmp .miss_1201
.hi_1201:
  cmp rcx, 0x808F60
  jae .hi_1221
  cmp rcx, 0x808F50
  jae .hi_1222
  cmp rcx, 0x808F40
  jne .next_1223
  jmp Label_808F40
.next_1223:
  cmp rcx, 0x808F44
  jne .next_1224
  jmp Label_808F44
.next_1224:
  cmp rcx, 0x808F48
  jne .next_1225
  jmp Label_808F48
.next_1225:
  cmp rcx, 0x808F4C
  jne .next_1226
  jmp Label_808F4C
.next_1226:
  jmp .miss_1222
.hi_1222:
  cmp rcx, 0x808F50
  jne .next_1227
  jmp Label_808F50
.next_1227:
  cmp rcx, 0x808F54
  jne .next_1228
  jmp Label_808F54
.next_1228:
  cmp rcx, 0x808F58
  jne .next_1229
  jmp Label_808F58
.next_1229:
  cmp rcx, 0x808F5C
  jne .next_1230
  jmp Label_808F5C
.next_1230:
.miss_1222:
  jmp .miss_1221
.hi_1221:
  cmp rcx, 0x808F70
  jae .hi_1231
  cmp rcx, 0x808F60
  jne .next_1232
  jmp Label_808F60
.next_1232:
  cmp rcx, 0x808F64
  jne .next_1233
  jmp Label_808F64
.next_1233:
  cmp rcx, 0x808F68
  jne .next_1234
  jmp Label_808F68
.next_1234:
  cmp rcx, 0x808F6C
  jne .next_1235
  jmp Label_808F6C
.next_1235:
  jmp .miss_1231
.hi_1231:
  cmp rcx, 0x808F70
  jne .next_1236
  jmp Label_808F70
.next_1236:
  cmp rcx, 0x808F74
  jne .next_1237
  jmp Label_808F74
.next_1237:
  cmp rcx, 0x808F78
  jne .next_1238
  jmp Label_808F78
.next_1238:
  cmp rcx, 0x808F7C
  jne .next_1239
  jmp Label_808F7C
.next_1239:
.miss_1231:
.miss_1221:
.miss_1201:
  jmp .miss_1200
.hi_1200:
  cmp rcx, 0x808FC0
  jae .hi_1240
  cmp rcx, 0x808FA0
  jae .hi_1241
  cmp rcx, 0x808F90
  jae .hi_1242
  cmp rcx, 0x808F80
  jne .next_1243
  jmp Label_808F80
.next_1243:
  cmp rcx, 0x808F84
  jne .next_1244
  jmp Label_808F84
.next_1244:
  cmp rcx, 0x808F88
  jne .next_1245
  jmp Label_808F88
.next_1245:
  cmp rcx, 0x808F8C
  jne .next_1246
  jmp Label_808F8C
.next_1246:
  jmp .miss_1242
.hi_1242:
  cmp rcx, 0x808F90
  jne .next_1247
  jmp Label_808F90
.next_1247:
  cmp rcx, 0x808F94
  jne .next_1248
  jmp Label_808F94
.next_1248:
  cmp rcx, 0x808F98
  jne .next_1249
  jmp Label_808F98
.next_1249:
  cmp rcx, 0x808F9C
  jne .next_1250
  jmp Label_808F9C
.next_1250:
.miss_1242:
  jmp .miss_1241
.hi_1241:
  cmp rcx, 0x808FB0
  jae .hi_1251
  cmp rcx, 0x808FA0
  jne .next_1252
  jmp Label_808FA0
.next_1252:
  cmp rcx, 0x808FA4
  jne .next_1253
  jmp Label_808FA4
.next_1253:
  cmp rcx, 0x808FA8
  jne .next_1254
  jmp Label_808FA8
.next_1254:
  cmp rcx, 0x808FAC
  jne .next_1255
  jmp Label_808FAC
.next_1255:
  jmp .miss_1251
.hi_1251:
  cmp rcx, 0x808FB0
  jne .next_1256
  jmp Label_808FB0
.next_1256:
  cmp rcx, 0x808FB4
  jne .next_1257
  jmp Label_808FB4
.next_1257:
  cmp rcx, 0x808FB8
  jne .next_1258
  jmp Label_808FB8
.next_1258:
  cmp rcx, 0x808FBC
  jne .next_1259
  jmp Label_808FBC
.next_1259:
.miss_1251:
.miss_1241:
  jmp .miss_1240
.hi_1240:
  cmp rcx, 0x808FE0
  jae .hi_1260
  cmp rcx, 0x808FD0
  jae .hi_1261
  cmp rcx, 0x808FC0
  jne .next_1262
  jmp Label_808FC0
.next_1262:
  cmp rcx, 0x808FC4
  jne .next_1263
  jmp Label_808FC4
.next_1263:
  cmp rcx, 0x808FC8
  jne .next_1264
  jmp Label_808FC8
.next_1264:
  cmp rcx, 0x808FCC
  jne .next_1265
  jmp Label_808FCC
.next_1265:
  jmp .miss_1261
.hi_1261:
  cmp rcx, 0x808FD0
  jne .next_1266
  jmp Label_808FD0
.next_1266:
  cmp rcx, 0x808FD4
  jne .next_1267
  jmp Label_808FD4
.next_1267:
  cmp rcx, 0x808FD8
  jne .next_1268
  jmp Label_808FD8
.next_1268:
  cmp rcx, 0x808FDC
  jne .next_1269
  jmp Label_808FDC
.next_1269:
.miss_1261:
  jmp .miss_1260
.hi_1260:
  cmp rcx, 0x808FF0
  jae .hi_1270
  cmp rcx, 0x808FE0
  jne .next_1271
  jmp Label_808FE0
.next_1271:
  cmp rcx, 0x808FE4
  jne .next_1272
  jmp Label_808FE4
.next_1272:
  cmp rcx, 0x808FE8
  jne .next_1273
  jmp Label_808FE8
.next_1273:
  cmp rcx, 0x808FEC
  jne .next_1274
  jmp Label_808FEC
.next_1274:
  jmp .miss_1270
.hi_1270:
  cmp rcx, 0x808FF0
  jne .next_1275
  jmp Label_808FF0
.next_1275:
  cmp rcx, 0x808FF4
  jne .next_1276
  jmp Label_808FF4
.next_1276:
  cmp rcx, 0x808FF8
  jne .next_1277
  jmp Label_808FF8
.next_1277:
  cmp rcx, 0x808FFC
  jne .next_1278
  jmp Label_808FFC
.next_1278:
.miss_1270:
.miss_1260:
.miss_1240:
.miss_1200:
.miss_1120:
.miss_960:
.miss_640:
.miss_0:
  mov rdx, rbx
  call __JUMP_FAILED

__CPUSync:
  sub rsp, 32
  call Render
  add rsp, 32
  
  movzx rax, byte [rel NMI]
  cmp rax, 0x0
  je .return
  
  movzx rax, byte [rel io_RDNMI]
  or rax, 0x80
  mov byte [rel io_RDNMI], al
  
  mov byte [rel NMI], 0x00
  movzx rax, byte [rel io_NMITIMEN]
  and rax, 0x80
  cmp rax, 0x0
  je .return
  
  add rsp, 32
  pop rax ; pop return address
  
  mov byte [rel inNMI], 0x01
  mov rcx, r12
  shr rcx, 16
  and rcx, 0xFF
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, r12
  shr rcx, 8
  and rcx, 0xFF
  sub rsp, 32
  call __PUSH8
  add rsp, 32
  mov rcx, r12
  and rcx, 0xFF
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
  mov byte [rel MapMode], 0x00
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

  global Label_808004
Label_808004:
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

  global Label_808008
Label_808008:
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

  global Label_80800C
Label_80800C:
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

  global Label_808010
Label_808010:
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

  global Label_808014
Label_808014:
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

  global Label_808018
Label_808018:
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

  global Label_80801C
Label_80801C:
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

  global Label_808020
Label_808020:
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

  global Label_808024
Label_808024:
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

  global Label_808028
Label_808028:
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

  global Label_80802C
Label_80802C:
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

  global Label_808030
Label_808030:
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

  global Label_808034
Label_808034:
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

  global Label_808038
Label_808038:
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

  global Label_80803C
Label_80803C:
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

  global Label_808040
Label_808040:
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

  global Label_808044
Label_808044:
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

  global Label_808048
Label_808048:
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

  global Label_80804C
Label_80804C:
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

  global Label_808050
Label_808050:
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

  global Label_808054
Label_808054:
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

  global Label_808058
Label_808058:
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

  global Label_80805C
Label_80805C:
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

  global Label_808060
Label_808060:
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

  global Label_808064
Label_808064:
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

  global Label_808068
Label_808068:
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

  global Label_80806C
Label_80806C:
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

  global Label_808070
Label_808070:
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

  global Label_808074
Label_808074:
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

  global Label_808078
Label_808078:
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

  global Label_80807C
Label_80807C:
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

  global Label_808080
Label_808080:
  ; -- 808080 --
  mov r12, 0x808080
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_808084
Label_808084:
  ; -- 808084 --
  mov r12, 0x808084
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_808088
Label_808088:
  ; -- 808088 --
  mov r12, 0x808088
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_80808C
Label_80808C:
  ; -- 80808C --
  mov r12, 0x80808C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PHP
  add rsp, 32
  add qword [rel CycleCount], 3

  global Label_808090
Label_808090:
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

  global Label_808094
Label_808094:
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

  global Label_808098
Label_808098:
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

  global Label_80809C
Label_80809C:
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

  global Label_8080A0
Label_8080A0:
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

  global Label_8080A4
Label_8080A4:
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

  global Label_8080A8
Label_8080A8:
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

  global Label_8080AC
Label_8080AC:
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

  global Label_8080B0
Label_8080B0:
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

  global Label_8080B4
Label_8080B4:
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

  global Label_8080B8
Label_8080B8:
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

  global Label_8080BC
Label_8080BC:
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

  global Label_8080C0
Label_8080C0:
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

  global Label_8080C4
Label_8080C4:
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

  global Label_8080C8
Label_8080C8:
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

  global Label_8080CC
Label_8080CC:
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

  global Label_8080D0
Label_8080D0:
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

  global Label_8080D4
Label_8080D4:
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

  global Label_8080D8
Label_8080D8:
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

  global Label_8080DC
Label_8080DC:
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

  global Label_8080E0
Label_8080E0:
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

  global Label_8080E4
Label_8080E4:
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

  global Label_8080E8
Label_8080E8:
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

  global Label_8080EC
Label_8080EC:
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

  global Label_8080F0
Label_8080F0:
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

  global Label_8080F4
Label_8080F4:
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

  global Label_8080F8
Label_8080F8:
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

  global Label_8080FC
Label_8080FC:
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

  global Label_808104
Label_808104:
  ; -- 808104 --
  mov r12, 0x808104
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_808118

  global Label_808108
Label_808108:
  ; -- 808108 --
  mov r12, 0x808108
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_80811C

  global Label_80810C
Label_80810C:
  ; -- 80810C --
  mov r12, 0x80810C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 0
  je Label_808120

  global Label_808110
Label_808110:
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

  global Label_808124
Label_808124:
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

  global Label_808128
Label_808128:
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

  global Label_80812C
Label_80812C:
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

  global Label_808130
Label_808130:
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

  global Label_808134
Label_808134:
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

  global Label_808138
Label_808138:
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

  global Label_80813C
Label_80813C:
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

  global Label_808140
Label_808140:
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

  global Label_808144
Label_808144:
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

  global Label_808148
Label_808148:
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

  global Label_80814C
Label_80814C:
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

  global Label_808150
Label_808150:
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

  global Label_808154
Label_808154:
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

  global Label_808158
Label_808158:
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

  global Label_80815C
Label_80815C:
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

  global Label_808160
Label_808160:
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

  global Label_808164
Label_808164:
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

  global Label_808168
Label_808168:
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

  global Label_80816C
Label_80816C:
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

  global Label_808170
Label_808170:
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

  global Label_808174
Label_808174:
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

  global Label_808178
Label_808178:
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

  global Label_80817C
Label_80817C:
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

  global Label_808180
Label_808180:
  ; -- 808180 --
  mov r12, 0x808180
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808184
Label_808184:
  ; -- 808184 --
  mov r12, 0x808184
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808188
Label_808188:
  ; -- 808188 --
  mov r12, 0x808188
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_80818C
Label_80818C:
  ; -- 80818C --
  mov r12, 0x80818C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808190
Label_808190:
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

  global Label_808194
Label_808194:
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

  global Label_808198
Label_808198:
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

  global Label_80819C
Label_80819C:
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

  global Label_8081A0
Label_8081A0:
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

  global Label_8081A4
Label_8081A4:
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

  global Label_8081A8
Label_8081A8:
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

  global Label_8081AC
Label_8081AC:
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

  global Label_8081B0
Label_8081B0:
  ; -- 8081B0 --
  mov r12, 0x8081B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8081B4
Label_8081B4:
  ; -- 8081B4 --
  mov r12, 0x8081B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8081B8
Label_8081B8:
  ; -- 8081B8 --
  mov r12, 0x8081B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8081BC
Label_8081BC:
  ; -- 8081BC --
  mov r12, 0x8081BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8081C0
Label_8081C0:
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

  global Label_8081C4
Label_8081C4:
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

  global Label_8081C8
Label_8081C8:
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

  global Label_8081CC
Label_8081CC:
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

  global Label_8081D0
Label_8081D0:
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

  global Label_8081D4
Label_8081D4:
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

  global Label_8081D8
Label_8081D8:
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

  global Label_8081DC
Label_8081DC:
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

  global Label_8081E0
Label_8081E0:
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

  global Label_8081E4
Label_8081E4:
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

  global Label_8081E8
Label_8081E8:
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

  global Label_8081EC
Label_8081EC:
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

  global Label_8081F0
Label_8081F0:
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

  global Label_8081F4
Label_8081F4:
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

  global Label_8081F8
Label_8081F8:
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

  global Label_8081FC
Label_8081FC:
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

  global Label_808204
Label_808204:
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

  global Label_808208
Label_808208:
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

  global Label_80820C
Label_80820C:
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

  global Label_808210
Label_808210:
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

  global Label_808214
Label_808214:
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

  global Label_808218
Label_808218:
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

  global Label_80821C
Label_80821C:
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

  global Label_808220
Label_808220:
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

  global Label_808224
Label_808224:
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

  global Label_808228
Label_808228:
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

  global Label_80822C
Label_80822C:
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

  global Label_808230
Label_808230:
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

  global Label_808234
Label_808234:
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

  global Label_808238
Label_808238:
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

  global Label_80823C
Label_80823C:
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

  global Label_808240
Label_808240:
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

  global Label_808244
Label_808244:
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

  global Label_808248
Label_808248:
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

  global Label_80824C
Label_80824C:
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

  global Label_808250
Label_808250:
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

  global Label_808254
Label_808254:
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

  global Label_808258
Label_808258:
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

  global Label_80825C
Label_80825C:
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

  global Label_808260
Label_808260:
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

  global Label_808264
Label_808264:
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

  global Label_808268
Label_808268:
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

  global Label_80826C
Label_80826C:
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

  global Label_808270
Label_808270:
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

  global Label_808274
Label_808274:
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

  global Label_808278
Label_808278:
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

  global Label_80827C
Label_80827C:
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

  global Label_808280
Label_808280:
  ; -- 808280 --
  mov r12, 0x808280
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808284
Label_808284:
  ; -- 808284 --
  mov r12, 0x808284
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808288
Label_808288:
  ; -- 808288 --
  mov r12, 0x808288
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_80828C
Label_80828C:
  ; -- 80828C --
  mov r12, 0x80828C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __PLP
  add rsp, 32
  add qword [rel CycleCount], 4

  global Label_808290
Label_808290:
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

  global Label_808294
Label_808294:
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

  global Label_808298
Label_808298:
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

  global Label_80829C
Label_80829C:
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

  global Label_8082A0
Label_8082A0:
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

  global Label_8082A4
Label_8082A4:
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

  global Label_8082A8
Label_8082A8:
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

  global Label_8082AC
Label_8082AC:
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

  global Label_8082B0
Label_8082B0:
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

  global Label_8082B4
Label_8082B4:
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

  global Label_8082B8
Label_8082B8:
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

  global Label_8082BC
Label_8082BC:
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

  global Label_8082C0
Label_8082C0:
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

  global Label_8082C4
Label_8082C4:
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

  global Label_8082C8
Label_8082C8:
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

  global Label_8082CC
Label_8082CC:
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

  global Label_8082D0
Label_8082D0:
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

  global Label_8082D4
Label_8082D4:
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

  global Label_8082D8
Label_8082D8:
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

  global Label_8082DC
Label_8082DC:
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

  global Label_8082E0
Label_8082E0:
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

  global Label_8082E4
Label_8082E4:
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

  global Label_8082E8
Label_8082E8:
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

  global Label_8082EC
Label_8082EC:
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

  global Label_8082F0
Label_8082F0:
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

  global Label_8082F4
Label_8082F4:
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

  global Label_8082F8
Label_8082F8:
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

  global Label_8082FC
Label_8082FC:
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

  global Label_808304
Label_808304:
  ; -- 808304 --
  mov r12, 0x808304
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_808318

  global Label_808308
Label_808308:
  ; -- 808308 --
  mov r12, 0x808308
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_80831C

  global Label_80830C
Label_80830C:
  ; -- 80830C --
  mov r12, 0x80830C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel N_Flag], 1
  je Label_808320

  global Label_808310
Label_808310:
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

  global Label_808324
Label_808324:
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

  global Label_808328
Label_808328:
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

  global Label_80832C
Label_80832C:
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

  global Label_808330
Label_808330:
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

  global Label_808334
Label_808334:
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

  global Label_808338
Label_808338:
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

  global Label_80833C
Label_80833C:
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

  global Label_808340
Label_808340:
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

  global Label_808344
Label_808344:
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

  global Label_808348
Label_808348:
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

  global Label_80834C
Label_80834C:
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

  global Label_808350
Label_808350:
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

  global Label_808354
Label_808354:
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

  global Label_808358
Label_808358:
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

  global Label_80835C
Label_80835C:
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

  global Label_808360
Label_808360:
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

  global Label_808364
Label_808364:
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

  global Label_808368
Label_808368:
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

  global Label_80836C
Label_80836C:
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

  global Label_808370
Label_808370:
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

  global Label_808374
Label_808374:
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

  global Label_808378
Label_808378:
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

  global Label_80837C
Label_80837C:
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

  global Label_808380
Label_808380:
  ; -- 808380 --
  mov r12, 0x808380
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808384
Label_808384:
  ; -- 808384 --
  mov r12, 0x808384
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808388
Label_808388:
  ; -- 808388 --
  mov r12, 0x808388
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_80838C
Label_80838C:
  ; -- 80838C --
  mov r12, 0x80838C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel C_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808390
Label_808390:
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

  global Label_808394
Label_808394:
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

  global Label_808398
Label_808398:
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

  global Label_80839C
Label_80839C:
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

  global Label_8083A0
Label_8083A0:
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

  global Label_8083A4
Label_8083A4:
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

  global Label_8083A8
Label_8083A8:
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

  global Label_8083AC
Label_8083AC:
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

  global Label_8083B0
Label_8083B0:
  ; -- 8083B0 --
  mov r12, 0x8083B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8083B4
Label_8083B4:
  ; -- 8083B4 --
  mov r12, 0x8083B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8083B8
Label_8083B8:
  ; -- 8083B8 --
  mov r12, 0x8083B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8083BC
Label_8083BC:
  ; -- 8083BC --
  mov r12, 0x8083BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8083C0
Label_8083C0:
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

  global Label_8083C4
Label_8083C4:
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

  global Label_8083C8
Label_8083C8:
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

  global Label_8083CC
Label_8083CC:
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

  global Label_8083D0
Label_8083D0:
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

  global Label_8083D4
Label_8083D4:
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

  global Label_8083D8
Label_8083D8:
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

  global Label_8083DC
Label_8083DC:
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

  global Label_8083E0
Label_8083E0:
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

  global Label_8083E4
Label_8083E4:
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

  global Label_8083E8
Label_8083E8:
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

  global Label_8083EC
Label_8083EC:
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

  global Label_8083F0
Label_8083F0:
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

  global Label_8083F4
Label_8083F4:
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

  global Label_8083F8
Label_8083F8:
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

  global Label_8083FC
Label_8083FC:
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
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x808400
  jmp __CALL_ADDRESS

  global Label_808404
Label_808404:
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
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x808404
  jmp __CALL_ADDRESS

  global Label_808408
Label_808408:
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
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x808408
  jmp __CALL_ADDRESS

  global Label_80840C
Label_80840C:
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
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x80840C
  jmp __CALL_ADDRESS

  global Label_808410
Label_808410:
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

  global Label_808414
Label_808414:
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

  global Label_808418
Label_808418:
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

  global Label_80841C
Label_80841C:
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

  global Label_808420
Label_808420:
  ; -- 808420 --
  mov r12, 0x808420
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM

  global Label_808424
Label_808424:
  ; -- 808424 --
  mov r12, 0x808424
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM

  global Label_808428
Label_808428:
  ; -- 808428 --
  mov r12, 0x808428
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM

  global Label_80842C
Label_80842C:
  ; -- 80842C --
  mov r12, 0x80842C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WDM

  global Label_808430
Label_808430:
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

  global Label_808434
Label_808434:
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

  global Label_808438
Label_808438:
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

  global Label_80843C
Label_80843C:
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

  global Label_808440
Label_808440:
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

  global Label_808444
Label_808444:
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

  global Label_808448
Label_808448:
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

  global Label_80844C
Label_80844C:
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

  global Label_808450
Label_808450:
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

  global Label_808454
Label_808454:
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

  global Label_808458
Label_808458:
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

  global Label_80845C
Label_80845C:
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

  global Label_808460
Label_808460:
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

  global Label_808464
Label_808464:
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

  global Label_808468
Label_808468:
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

  global Label_80846C
Label_80846C:
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

  global Label_808470
Label_808470:
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

  global Label_808474
Label_808474:
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

  global Label_808478
Label_808478:
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

  global Label_80847C
Label_80847C:
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

  global Label_808480
Label_808480:
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

  global Label_808484
Label_808484:
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

  global Label_808488
Label_808488:
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

  global Label_80848C
Label_80848C:
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

  global Label_808490
Label_808490:
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

  global Label_808494
Label_808494:
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

  global Label_808498
Label_808498:
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

  global Label_80849C
Label_80849C:
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

  global Label_8084A0
Label_8084A0:
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

  global Label_8084A4
Label_8084A4:
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

  global Label_8084A8
Label_8084A8:
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

  global Label_8084AC
Label_8084AC:
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

  global Label_8084B0
Label_8084B0:
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

  global Label_8084B4
Label_8084B4:
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

  global Label_8084B8
Label_8084B8:
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

  global Label_8084BC
Label_8084BC:
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

  global Label_8084C0
Label_8084C0:
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

  global Label_8084C4
Label_8084C4:
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

  global Label_8084C8
Label_8084C8:
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

  global Label_8084CC
Label_8084CC:
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

  global Label_8084D0
Label_8084D0:
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

  global Label_8084D4
Label_8084D4:
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

  global Label_8084D8
Label_8084D8:
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

  global Label_8084DC
Label_8084DC:
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

  global Label_8084E0
Label_8084E0:
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

  global Label_8084E4
Label_8084E4:
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

  global Label_8084E8
Label_8084E8:
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

  global Label_8084EC
Label_8084EC:
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

  global Label_8084F0
Label_8084F0:
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

  global Label_8084F4
Label_8084F4:
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

  global Label_8084F8
Label_8084F8:
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

  global Label_8084FC
Label_8084FC:
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

  global Label_808500
Label_808500:
  ; -- 808500 --
  mov r12, 0x808500
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_808514

  global Label_808504
Label_808504:
  ; -- 808504 --
  mov r12, 0x808504
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_808518

  global Label_808508
Label_808508:
  ; -- 808508 --
  mov r12, 0x808508
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_80851C

  global Label_80850C
Label_80850C:
  ; -- 80850C --
  mov r12, 0x80850C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 0
  je Label_808520

  global Label_808510
Label_808510:
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

  global Label_808524
Label_808524:
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

  global Label_808528
Label_808528:
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

  global Label_80852C
Label_80852C:
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

  global Label_808530
Label_808530:
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

  global Label_808534
Label_808534:
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

  global Label_808538
Label_808538:
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

  global Label_80853C
Label_80853C:
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

  global Label_808540
Label_808540:
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

  global Label_808544
Label_808544:
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

  global Label_808548
Label_808548:
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

  global Label_80854C
Label_80854C:
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

  global Label_808550
Label_808550:
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

  global Label_808554
Label_808554:
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

  global Label_808558
Label_808558:
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

  global Label_80855C
Label_80855C:
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

  global Label_808560
Label_808560:
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

  global Label_808564
Label_808564:
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

  global Label_808568
Label_808568:
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

  global Label_80856C
Label_80856C:
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

  global Label_808570
Label_808570:
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

  global Label_808574
Label_808574:
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

  global Label_808578
Label_808578:
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

  global Label_80857C
Label_80857C:
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

  global Label_808580
Label_808580:
  ; -- 808580 --
  mov r12, 0x808580
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808584
Label_808584:
  ; -- 808584 --
  mov r12, 0x808584
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808588
Label_808588:
  ; -- 808588 --
  mov r12, 0x808588
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_80858C
Label_80858C:
  ; -- 80858C --
  mov r12, 0x80858C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808590
Label_808590:
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

  global Label_808594
Label_808594:
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

  global Label_808598
Label_808598:
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

  global Label_80859C
Label_80859C:
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

  global Label_8085A0
Label_8085A0:
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

  global Label_8085A4
Label_8085A4:
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

  global Label_8085A8
Label_8085A8:
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

  global Label_8085AC
Label_8085AC:
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

  global Label_8085B0
Label_8085B0:
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

  global Label_8085B4
Label_8085B4:
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

  global Label_8085B8
Label_8085B8:
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

  global Label_8085BC
Label_8085BC:
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

  global Label_8085C0
Label_8085C0:
  ; -- 8085C0 --
  mov r12, 0x8085C0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085C0
  jmp __CALL_ADDRESS

  global Label_8085C4
Label_8085C4:
  ; -- 8085C4 --
  mov r12, 0x8085C4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085C4
  jmp __CALL_ADDRESS

  global Label_8085C8
Label_8085C8:
  ; -- 8085C8 --
  mov r12, 0x8085C8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085C8
  jmp __CALL_ADDRESS

  global Label_8085CC
Label_8085CC:
  ; -- 8085CC --
  mov r12, 0x8085CC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  mov rcx, 0x563412
  mov rbx, 0x8085CC
  jmp __CALL_ADDRESS

  global Label_8085D0
Label_8085D0:
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

  global Label_8085D4
Label_8085D4:
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

  global Label_8085D8
Label_8085D8:
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

  global Label_8085DC
Label_8085DC:
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

  global Label_8085E0
Label_8085E0:
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

  global Label_8085E4
Label_8085E4:
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

  global Label_8085E8
Label_8085E8:
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

  global Label_8085EC
Label_8085EC:
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

  global Label_8085F0
Label_8085F0:
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

  global Label_8085F4
Label_8085F4:
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

  global Label_8085F8
Label_8085F8:
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

  global Label_8085FC
Label_8085FC:
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

  global Label_808600
Label_808600:
  ; -- 808600 --
  mov r12, 0x808600
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x808600
  jmp __CALL_ADDRESS

  global Label_808604
Label_808604:
  ; -- 808604 --
  mov r12, 0x808604
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x808604
  jmp __CALL_ADDRESS

  global Label_808608
Label_808608:
  ; -- 808608 --
  mov r12, 0x808608
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x808608
  jmp __CALL_ADDRESS

  global Label_80860C
Label_80860C:
  ; -- 80860C --
  mov r12, 0x80860C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  mov rcx, 0x800000
  or rcx, rbx
  mov rbx, 0x80860C
  jmp __CALL_ADDRESS

  global Label_808610
Label_808610:
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

  global Label_808614
Label_808614:
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

  global Label_808618
Label_808618:
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

  global Label_80861C
Label_80861C:
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

  global Label_808620
Label_808620:
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

  global Label_808624
Label_808624:
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

  global Label_808628
Label_808628:
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

  global Label_80862C
Label_80862C:
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

  global Label_808630
Label_808630:
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

  global Label_808634
Label_808634:
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

  global Label_808638
Label_808638:
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

  global Label_80863C
Label_80863C:
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

  global Label_808640
Label_808640:
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

  global Label_808644
Label_808644:
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

  global Label_808648
Label_808648:
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

  global Label_80864C
Label_80864C:
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

  global Label_808650
Label_808650:
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

  global Label_808654
Label_808654:
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

  global Label_808658
Label_808658:
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

  global Label_80865C
Label_80865C:
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

  global Label_808660
Label_808660:
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

  global Label_808664
Label_808664:
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

  global Label_808668
Label_808668:
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

  global Label_80866C
Label_80866C:
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

  global Label_808670
Label_808670:
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

  global Label_808674
Label_808674:
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

  global Label_808678
Label_808678:
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

  global Label_80867C
Label_80867C:
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

  global Label_808680
Label_808680:
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

  global Label_808684
Label_808684:
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

  global Label_808688
Label_808688:
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

  global Label_80868C
Label_80868C:
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

  global Label_808690
Label_808690:
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

  global Label_808694
Label_808694:
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

  global Label_808698
Label_808698:
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

  global Label_80869C
Label_80869C:
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

  global Label_8086A0
Label_8086A0:
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

  global Label_8086A4
Label_8086A4:
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

  global Label_8086A8
Label_8086A8:
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

  global Label_8086AC
Label_8086AC:
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

  global Label_8086B0
Label_8086B0:
  ; -- 8086B0 --
  mov r12, 0x8086B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086B0
  jmp __CALL_ADDRESS

  global Label_8086B4
Label_8086B4:
  ; -- 8086B4 --
  mov r12, 0x8086B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086B4
  jmp __CALL_ADDRESS

  global Label_8086B8
Label_8086B8:
  ; -- 8086B8 --
  mov r12, 0x8086B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086B8
  jmp __CALL_ADDRESS

  global Label_8086BC
Label_8086BC:
  ; -- 8086BC --
  mov r12, 0x8086BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 6
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rbx, rax
  and rbx, 0xFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  and rax, 0xFF
  shl rax, 8
  or rbx, rax
  add rbx, 0x1
  and rbx, 0xFFFF
  sub rsp, 32
  call __PULL8
  add rsp, 32
  mov rcx, rax
  and rcx, 0xFF
  shl rcx, 16
  or rcx, rbx
  mov rbx, 0x8086BC
  jmp __CALL_ADDRESS

  global Label_8086C0
Label_8086C0:
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

  global Label_8086C4
Label_8086C4:
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

  global Label_8086C8
Label_8086C8:
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

  global Label_8086CC
Label_8086CC:
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

  global Label_8086D0
Label_8086D0:
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

  global Label_8086D4
Label_8086D4:
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

  global Label_8086D8
Label_8086D8:
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

  global Label_8086DC
Label_8086DC:
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

  global Label_8086E0
Label_8086E0:
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

  global Label_8086E4
Label_8086E4:
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

  global Label_8086E8
Label_8086E8:
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

  global Label_8086EC
Label_8086EC:
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

  global Label_8086F0
Label_8086F0:
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

  global Label_8086F4
Label_8086F4:
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

  global Label_8086F8
Label_8086F8:
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

  global Label_8086FC
Label_8086FC:
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

  global Label_808700
Label_808700:
  ; -- 808700 --
  mov r12, 0x808700
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_808714

  global Label_808704
Label_808704:
  ; -- 808704 --
  mov r12, 0x808704
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_808718

  global Label_808708
Label_808708:
  ; -- 808708 --
  mov r12, 0x808708
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_80871C

  global Label_80870C
Label_80870C:
  ; -- 80870C --
  mov r12, 0x80870C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel V_Flag], 1
  je Label_808720

  global Label_808710
Label_808710:
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

  global Label_808724
Label_808724:
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

  global Label_808728
Label_808728:
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

  global Label_80872C
Label_80872C:
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

  global Label_808730
Label_808730:
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

  global Label_808734
Label_808734:
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

  global Label_808738
Label_808738:
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

  global Label_80873C
Label_80873C:
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

  global Label_808740
Label_808740:
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

  global Label_808744
Label_808744:
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

  global Label_808748
Label_808748:
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

  global Label_80874C
Label_80874C:
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

  global Label_808750
Label_808750:
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

  global Label_808754
Label_808754:
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

  global Label_808758
Label_808758:
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

  global Label_80875C
Label_80875C:
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

  global Label_808760
Label_808760:
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

  global Label_808764
Label_808764:
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

  global Label_808768
Label_808768:
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

  global Label_80876C
Label_80876C:
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

  global Label_808770
Label_808770:
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

  global Label_808774
Label_808774:
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

  global Label_808778
Label_808778:
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

  global Label_80877C
Label_80877C:
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

  global Label_808780
Label_808780:
  ; -- 808780 --
  mov r12, 0x808780
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808784
Label_808784:
  ; -- 808784 --
  mov r12, 0x808784
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808788
Label_808788:
  ; -- 808788 --
  mov r12, 0x808788
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_80878C
Label_80878C:
  ; -- 80878C --
  mov r12, 0x80878C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel I_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808790
Label_808790:
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

  global Label_808794
Label_808794:
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

  global Label_808798
Label_808798:
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

  global Label_80879C
Label_80879C:
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

  global Label_8087A0
Label_8087A0:
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

  global Label_8087A4
Label_8087A4:
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

  global Label_8087A8
Label_8087A8:
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

  global Label_8087AC
Label_8087AC:
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

  global Label_8087B0
Label_8087B0:
  ; -- 8087B0 --
  mov r12, 0x8087B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8087B4
Label_8087B4:
  ; -- 8087B4 --
  mov r12, 0x8087B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8087B8
Label_8087B8:
  ; -- 8087B8 --
  mov r12, 0x8087B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8087BC
Label_8087BC:
  ; -- 8087BC --
  mov r12, 0x8087BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regDP]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8087C0
Label_8087C0:
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
  or rcx, 0x800000
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087C0
  jmp __CALL_ADDRESS

  global Label_8087C4
Label_8087C4:
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
  or rcx, 0x800000
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087C4
  jmp __CALL_ADDRESS

  global Label_8087C8
Label_8087C8:
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
  or rcx, 0x800000
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087C8
  jmp __CALL_ADDRESS

  global Label_8087CC
Label_8087CC:
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
  or rcx, 0x800000
  sub rsp, 32
  call __READ16
  add rsp, 32
  mov rcx, rax
  or rcx, 0x800000
  mov rbx, 0x8087CC
  jmp __CALL_ADDRESS

  global Label_8087D0
Label_8087D0:
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

  global Label_8087D4
Label_8087D4:
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

  global Label_8087D8
Label_8087D8:
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

  global Label_8087DC
Label_8087DC:
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

  global Label_8087E0
Label_8087E0:
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

  global Label_8087E4
Label_8087E4:
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

  global Label_8087E8
Label_8087E8:
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

  global Label_8087EC
Label_8087EC:
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

  global Label_8087F0
Label_8087F0:
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

  global Label_8087F4
Label_8087F4:
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

  global Label_8087F8
Label_8087F8:
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

  global Label_8087FC
Label_8087FC:
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

  global Label_808804
Label_808804:
  ; -- 808804 --
  mov r12, 0x808804
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_808818

  global Label_808808
Label_808808:
  ; -- 808808 --
  mov r12, 0x808808
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_80881C

  global Label_80880C
Label_80880C:
  ; -- 80880C --
  mov r12, 0x80880C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 3
  jmp Label_808820

  global Label_808810
Label_808810:
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

  global Label_808824
Label_808824:
  ; -- 808824 --
  mov r12, 0x808824
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC39

  global Label_808828
Label_808828:
  ; -- 808828 --
  mov r12, 0x808828
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC3D

  global Label_80882C
Label_80882C:
  ; -- 80882C --
  mov r12, 0x80882C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 4
  ; Never branches to 80BC41

  global Label_808830
Label_808830:
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

  global Label_808834
Label_808834:
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

  global Label_808838
Label_808838:
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

  global Label_80883C
Label_80883C:
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

  global Label_808840
Label_808840:
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

  global Label_808844
Label_808844:
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

  global Label_808848
Label_808848:
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

  global Label_80884C
Label_80884C:
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

  global Label_808850
Label_808850:
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

  global Label_808854
Label_808854:
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

  global Label_808858
Label_808858:
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

  global Label_80885C
Label_80885C:
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

  global Label_808860
Label_808860:
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

  global Label_808864
Label_808864:
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

  global Label_808868
Label_808868:
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

  global Label_80886C
Label_80886C:
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

  global Label_808870
Label_808870:
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

  global Label_808874
Label_808874:
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

  global Label_808878
Label_808878:
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

  global Label_80887C
Label_80887C:
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

  global Label_808880
Label_808880:
  ; -- 808880 --
  mov r12, 0x808880
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  sub rax, 0x1
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_808884
Label_808884:
  ; -- 808884 --
  mov r12, 0x808884
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  sub rax, 0x1
  mov word [rel regY], ax
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_808888
Label_808888:
  ; -- 808888 --
  mov r12, 0x808888
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  sub rax, 0x1
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_80888C
Label_80888C:
  ; -- 80888C --
  mov r12, 0x80888C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  sub rax, 0x1
  mov word [rel regY], ax
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_808890
Label_808890:
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

  global Label_808894
Label_808894:
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

  global Label_808898
Label_808898:
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

  global Label_80889C
Label_80889C:
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

  global Label_8088A0
Label_8088A0:
  ; -- 8088A0 --
  mov r12, 0x8088A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8088A4
Label_8088A4:
  ; -- 8088A4 --
  mov r12, 0x8088A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_8088A8
Label_8088A8:
  ; -- 8088A8 --
  mov r12, 0x8088A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2

  global Label_8088AC
Label_8088AC:
  ; -- 8088AC --
  mov r12, 0x8088AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2

  global Label_8088B0
Label_8088B0:
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

  global Label_8088B4
Label_8088B4:
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

  global Label_8088B8
Label_8088B8:
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

  global Label_8088BC
Label_8088BC:
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

  global Label_8088C0
Label_8088C0:
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

  global Label_8088C4
Label_8088C4:
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

  global Label_8088C8
Label_8088C8:
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

  global Label_8088CC
Label_8088CC:
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

  global Label_8088D0
Label_8088D0:
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

  global Label_8088D4
Label_8088D4:
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

  global Label_8088D8
Label_8088D8:
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

  global Label_8088DC
Label_8088DC:
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

  global Label_8088E0
Label_8088E0:
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

  global Label_8088E4
Label_8088E4:
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

  global Label_8088E8
Label_8088E8:
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

  global Label_8088EC
Label_8088EC:
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

  global Label_8088F0
Label_8088F0:
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

  global Label_8088F4
Label_8088F4:
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

  global Label_8088F8
Label_8088F8:
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

  global Label_8088FC
Label_8088FC:
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

  global Label_808900
Label_808900:
  ; -- 808900 --
  mov r12, 0x808900
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_808914

  global Label_808904
Label_808904:
  ; -- 808904 --
  mov r12, 0x808904
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_808918

  global Label_808908
Label_808908:
  ; -- 808908 --
  mov r12, 0x808908
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_80891C

  global Label_80890C
Label_80890C:
  ; -- 80890C --
  mov r12, 0x80890C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 0
  je Label_808920

  global Label_808910
Label_808910:
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

  global Label_808924
Label_808924:
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

  global Label_808928
Label_808928:
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

  global Label_80892C
Label_80892C:
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

  global Label_808930
Label_808930:
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

  global Label_808934
Label_808934:
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

  global Label_808938
Label_808938:
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

  global Label_80893C
Label_80893C:
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

  global Label_808940
Label_808940:
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

  global Label_808944
Label_808944:
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

  global Label_808948
Label_808948:
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

  global Label_80894C
Label_80894C:
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

  global Label_808950
Label_808950:
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

  global Label_808954
Label_808954:
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

  global Label_808958
Label_808958:
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

  global Label_80895C
Label_80895C:
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

  global Label_808960
Label_808960:
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

  global Label_808964
Label_808964:
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

  global Label_808968
Label_808968:
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

  global Label_80896C
Label_80896C:
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

  global Label_808970
Label_808970:
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

  global Label_808974
Label_808974:
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

  global Label_808978
Label_808978:
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

  global Label_80897C
Label_80897C:
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

  global Label_808980
Label_808980:
  ; -- 808980 --
  mov r12, 0x808980
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_808984
Label_808984:
  ; -- 808984 --
  mov r12, 0x808984
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regA], ax
  call __UpdateNZ_A16
  add qword [rel CycleCount], 2

  global Label_808988
Label_808988:
  ; -- 808988 --
  mov r12, 0x808988
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2

  global Label_80898C
Label_80898C:
  ; -- 80898C --
  mov r12, 0x80898C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regA], al
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2

  global Label_808990
Label_808990:
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

  global Label_808994
Label_808994:
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

  global Label_808998
Label_808998:
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

  global Label_80899C
Label_80899C:
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

  global Label_8089A0
Label_8089A0:
  ; -- 8089A0 --
  mov r12, 0x8089A0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8089A4
Label_8089A4:
  ; -- 8089A4 --
  mov r12, 0x8089A4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8089A8
Label_8089A8:
  ; -- 8089A8 --
  mov r12, 0x8089A8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8089AC
Label_8089AC:
  ; -- 8089AC --
  mov r12, 0x8089AC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regS], ax
  add qword [rel CycleCount], 2

  global Label_8089B0
Label_8089B0:
  ; -- 8089B0 --
  mov r12, 0x8089B0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_8089B4
Label_8089B4:
  ; -- 8089B4 --
  mov r12, 0x8089B4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_8089B8
Label_8089B8:
  ; -- 8089B8 --
  mov r12, 0x8089B8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_8089BC
Label_8089BC:
  ; -- 8089BC --
  mov r12, 0x8089BC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regX]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_8089C0
Label_8089C0:
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

  global Label_8089C4
Label_8089C4:
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

  global Label_8089C8
Label_8089C8:
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

  global Label_8089CC
Label_8089CC:
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

  global Label_8089D0
Label_8089D0:
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

  global Label_8089D4
Label_8089D4:
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

  global Label_8089D8
Label_8089D8:
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

  global Label_8089DC
Label_8089DC:
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

  global Label_8089E0
Label_8089E0:
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

  global Label_8089E4
Label_8089E4:
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

  global Label_8089E8
Label_8089E8:
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

  global Label_8089EC
Label_8089EC:
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

  global Label_8089F0
Label_8089F0:
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

  global Label_8089F4
Label_8089F4:
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

  global Label_8089F8
Label_8089F8:
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

  global Label_8089FC
Label_8089FC:
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

  global Label_808A00
Label_808A00:
  ; -- 808A00 --
  mov r12, 0x808A00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regY], 0x3412
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_808A04
Label_808A04:
  ; -- 808A04 --
  mov r12, 0x808A04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regY], 0x12
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_808A08
Label_808A08:
  ; -- 808A08 --
  mov r12, 0x808A08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regY], 0x3412
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_808A0C
Label_808A0C:
  ; -- 808A0C --
  mov r12, 0x808A0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regY], 0x12
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_808A10
Label_808A10:
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

  global Label_808A14
Label_808A14:
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

  global Label_808A18
Label_808A18:
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

  global Label_808A1C
Label_808A1C:
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

  global Label_808A20
Label_808A20:
  ; -- 808A20 --
  mov r12, 0x808A20
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regX], 0x3412
  call __UpdateNZ_X16
  add qword [rel CycleCount], 3

  global Label_808A24
Label_808A24:
  ; -- 808A24 --
  mov r12, 0x808A24
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regX], 0x12
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808A28
Label_808A28:
  ; -- 808A28 --
  mov r12, 0x808A28
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regX], 0x3412
  call __UpdateNZ_X16
  add qword [rel CycleCount], 3

  global Label_808A2C
Label_808A2C:
  ; -- 808A2C --
  mov r12, 0x808A2C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regX], 0x12
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808A30
Label_808A30:
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

  global Label_808A34
Label_808A34:
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

  global Label_808A38
Label_808A38:
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

  global Label_808A3C
Label_808A3C:
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

  global Label_808A40
Label_808A40:
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

  global Label_808A44
Label_808A44:
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

  global Label_808A48
Label_808A48:
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

  global Label_808A4C
Label_808A4C:
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

  global Label_808A50
Label_808A50:
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

  global Label_808A54
Label_808A54:
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

  global Label_808A58
Label_808A58:
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

  global Label_808A5C
Label_808A5C:
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

  global Label_808A60
Label_808A60:
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

  global Label_808A64
Label_808A64:
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

  global Label_808A68
Label_808A68:
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

  global Label_808A6C
Label_808A6C:
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

  global Label_808A70
Label_808A70:
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

  global Label_808A74
Label_808A74:
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

  global Label_808A78
Label_808A78:
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

  global Label_808A7C
Label_808A7C:
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

  global Label_808A80
Label_808A80:
  ; -- 808A80 --
  mov r12, 0x808A80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_808A84
Label_808A84:
  ; -- 808A84 --
  mov r12, 0x808A84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_808A88
Label_808A88:
  ; -- 808A88 --
  mov r12, 0x808A88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regY], ax
  call __UpdateNZ_Y16
  add qword [rel CycleCount], 2

  global Label_808A8C
Label_808A8C:
  ; -- 808A8C --
  mov r12, 0x808A8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regY], al
  call __UpdateNZ_Y8
  add qword [rel CycleCount], 2

  global Label_808A90
Label_808A90:
  ; -- 808A90 --
  mov r12, 0x808A90
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regA], 0x3412
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3

  global Label_808A94
Label_808A94:
  ; -- 808A94 --
  mov r12, 0x808A94
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov word [rel regA], 0x3412
  call __UpdateNZ_A16
  add qword [rel CycleCount], 3

  global Label_808A98
Label_808A98:
  ; -- 808A98 --
  mov r12, 0x808A98
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regA], 0x12
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2

  global Label_808A9C
Label_808A9C:
  ; -- 808A9C --
  mov r12, 0x808A9C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel regA], 0x12
  call __UpdateNZ_A8
  add qword [rel CycleCount], 2

  global Label_808AA0
Label_808AA0:
  ; -- 808AA0 --
  mov r12, 0x808AA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808AA4
Label_808AA4:
  ; -- 808AA4 --
  mov r12, 0x808AA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808AA8
Label_808AA8:
  ; -- 808AA8 --
  mov r12, 0x808AA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808AAC
Label_808AAC:
  ; -- 808AAC --
  mov r12, 0x808AAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regA]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808AB0
Label_808AB0:
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

  global Label_808AB4
Label_808AB4:
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

  global Label_808AB8
Label_808AB8:
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

  global Label_808ABC
Label_808ABC:
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

  global Label_808AC0
Label_808AC0:
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

  global Label_808AC4
Label_808AC4:
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

  global Label_808AC8
Label_808AC8:
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

  global Label_808ACC
Label_808ACC:
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

  global Label_808AD0
Label_808AD0:
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

  global Label_808AD4
Label_808AD4:
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

  global Label_808AD8
Label_808AD8:
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

  global Label_808ADC
Label_808ADC:
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

  global Label_808AE0
Label_808AE0:
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

  global Label_808AE4
Label_808AE4:
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

  global Label_808AE8
Label_808AE8:
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

  global Label_808AEC
Label_808AEC:
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

  global Label_808AF0
Label_808AF0:
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

  global Label_808AF4
Label_808AF4:
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

  global Label_808AF8
Label_808AF8:
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

  global Label_808AFC
Label_808AFC:
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

  global Label_808B00
Label_808B00:
  ; -- 808B00 --
  mov r12, 0x808B00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B14

  global Label_808B04
Label_808B04:
  ; -- 808B04 --
  mov r12, 0x808B04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B18

  global Label_808B08
Label_808B08:
  ; -- 808B08 --
  mov r12, 0x808B08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B1C

  global Label_808B0C
Label_808B0C:
  ; -- 808B0C --
  mov r12, 0x808B0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel C_Flag], 1
  je Label_808B20

  global Label_808B10
Label_808B10:
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

  global Label_808B24
Label_808B24:
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

  global Label_808B28
Label_808B28:
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

  global Label_808B2C
Label_808B2C:
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

  global Label_808B30
Label_808B30:
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

  global Label_808B34
Label_808B34:
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

  global Label_808B38
Label_808B38:
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

  global Label_808B3C
Label_808B3C:
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

  global Label_808B40
Label_808B40:
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

  global Label_808B44
Label_808B44:
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

  global Label_808B48
Label_808B48:
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

  global Label_808B4C
Label_808B4C:
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

  global Label_808B50
Label_808B50:
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

  global Label_808B54
Label_808B54:
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

  global Label_808B58
Label_808B58:
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

  global Label_808B5C
Label_808B5C:
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

  global Label_808B60
Label_808B60:
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

  global Label_808B64
Label_808B64:
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

  global Label_808B68
Label_808B68:
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

  global Label_808B6C
Label_808B6C:
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

  global Label_808B70
Label_808B70:
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

  global Label_808B74
Label_808B74:
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

  global Label_808B78
Label_808B78:
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

  global Label_808B7C
Label_808B7C:
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

  global Label_808B80
Label_808B80:
  ; -- 808B80 --
  mov r12, 0x808B80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808B84
Label_808B84:
  ; -- 808B84 --
  mov r12, 0x808B84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808B88
Label_808B88:
  ; -- 808B88 --
  mov r12, 0x808B88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808B8C
Label_808B8C:
  ; -- 808B8C --
  mov r12, 0x808B8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel V_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808B90
Label_808B90:
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

  global Label_808B94
Label_808B94:
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

  global Label_808B98
Label_808B98:
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

  global Label_808B9C
Label_808B9C:
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

  global Label_808BA0
Label_808BA0:
  ; -- 808BA0 --
  mov r12, 0x808BA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808BA4
Label_808BA4:
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

  global Label_808BA8
Label_808BA8:
  ; -- 808BA8 --
  mov r12, 0x808BA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regS]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808BAC
Label_808BAC:
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

  global Label_808BB0
Label_808BB0:
  ; -- 808BB0 --
  mov r12, 0x808BB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808BB4
Label_808BB4:
  ; -- 808BB4 --
  mov r12, 0x808BB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808BB8
Label_808BB8:
  ; -- 808BB8 --
  mov r12, 0x808BB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regY]
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808BBC
Label_808BBC:
  ; -- 808BBC --
  mov r12, 0x808BBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, byte [rel regY]
  mov byte [rel regX], al
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808BC0
Label_808BC0:
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

  global Label_808BC4
Label_808BC4:
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

  global Label_808BC8
Label_808BC8:
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

  global Label_808BCC
Label_808BCC:
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

  global Label_808BD0
Label_808BD0:
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

  global Label_808BD4
Label_808BD4:
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

  global Label_808BD8
Label_808BD8:
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

  global Label_808BDC
Label_808BDC:
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

  global Label_808BE0
Label_808BE0:
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

  global Label_808BE4
Label_808BE4:
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

  global Label_808BE8
Label_808BE8:
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

  global Label_808BEC
Label_808BEC:
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

  global Label_808BF0
Label_808BF0:
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

  global Label_808BF4
Label_808BF4:
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

  global Label_808BF8
Label_808BF8:
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

  global Label_808BFC
Label_808BFC:
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

  global Label_808C04
Label_808C04:
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

  global Label_808C08
Label_808C08:
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

  global Label_808C0C
Label_808C0C:
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

  global Label_808C10
Label_808C10:
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

  global Label_808C14
Label_808C14:
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

  global Label_808C18
Label_808C18:
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

  global Label_808C1C
Label_808C1C:
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

  global Label_808C20
Label_808C20:
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

  global Label_808C24
Label_808C24:
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

  global Label_808C28
Label_808C28:
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

  global Label_808C2C
Label_808C2C:
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

  global Label_808C30
Label_808C30:
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

  global Label_808C34
Label_808C34:
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

  global Label_808C38
Label_808C38:
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

  global Label_808C3C
Label_808C3C:
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

  global Label_808C40
Label_808C40:
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

  global Label_808C44
Label_808C44:
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

  global Label_808C48
Label_808C48:
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

  global Label_808C4C
Label_808C4C:
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

  global Label_808C50
Label_808C50:
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

  global Label_808C54
Label_808C54:
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

  global Label_808C58
Label_808C58:
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

  global Label_808C5C
Label_808C5C:
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

  global Label_808C60
Label_808C60:
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

  global Label_808C64
Label_808C64:
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

  global Label_808C68
Label_808C68:
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

  global Label_808C6C
Label_808C6C:
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

  global Label_808C70
Label_808C70:
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

  global Label_808C74
Label_808C74:
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

  global Label_808C78
Label_808C78:
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

  global Label_808C7C
Label_808C7C:
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

  global Label_808C80
Label_808C80:
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

  global Label_808C84
Label_808C84:
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

  global Label_808C88
Label_808C88:
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

  global Label_808C8C
Label_808C8C:
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

  global Label_808C90
Label_808C90:
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

  global Label_808C94
Label_808C94:
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

  global Label_808C98
Label_808C98:
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

  global Label_808C9C
Label_808C9C:
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

  global Label_808CA0
Label_808CA0:
  ; -- 808CA0 --
  mov r12, 0x808CA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  sub rax, 0x1
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808CA4
Label_808CA4:
  ; -- 808CA4 --
  mov r12, 0x808CA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  sub rax, 0x1
  mov word [rel regX], ax
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808CA8
Label_808CA8:
  ; -- 808CA8 --
  mov r12, 0x808CA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  sub rax, 0x1
  mov word [rel regX], ax
  call __UpdateNZ_X16
  add qword [rel CycleCount], 2

  global Label_808CAC
Label_808CAC:
  ; -- 808CAC --
  mov r12, 0x808CAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regX]
  sub rax, 0x1
  mov word [rel regX], ax
  call __UpdateNZ_X8
  add qword [rel CycleCount], 2

  global Label_808CB0
Label_808CB0:
  ; -- 808CB0 --
  mov r12, 0x808CB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI

  global Label_808CB4
Label_808CB4:
  ; -- 808CB4 --
  mov r12, 0x808CB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI

  global Label_808CB8
Label_808CB8:
  ; -- 808CB8 --
  mov r12, 0x808CB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI

  global Label_808CBC
Label_808CBC:
  ; -- 808CBC --
  mov r12, 0x808CBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  call __WAI

  global Label_808CC0
Label_808CC0:
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

  global Label_808CC4
Label_808CC4:
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

  global Label_808CC8
Label_808CC8:
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

  global Label_808CCC
Label_808CCC:
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

  global Label_808CD0
Label_808CD0:
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

  global Label_808CD4
Label_808CD4:
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

  global Label_808CD8
Label_808CD8:
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

  global Label_808CDC
Label_808CDC:
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

  global Label_808CE0
Label_808CE0:
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

  global Label_808CE4
Label_808CE4:
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

  global Label_808CE8
Label_808CE8:
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

  global Label_808CEC
Label_808CEC:
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

  global Label_808CF0
Label_808CF0:
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

  global Label_808CF4
Label_808CF4:
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

  global Label_808CF8
Label_808CF8:
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

  global Label_808CFC
Label_808CFC:
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

  global Label_808D00
Label_808D00:
  ; -- 808D00 --
  mov r12, 0x808D00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D14

  global Label_808D04
Label_808D04:
  ; -- 808D04 --
  mov r12, 0x808D04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D18

  global Label_808D08
Label_808D08:
  ; -- 808D08 --
  mov r12, 0x808D08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D1C

  global Label_808D0C
Label_808D0C:
  ; -- 808D0C --
  mov r12, 0x808D0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 0
  je Label_808D20

  global Label_808D10
Label_808D10:
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

  global Label_808D24
Label_808D24:
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

  global Label_808D28
Label_808D28:
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

  global Label_808D2C
Label_808D2C:
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

  global Label_808D30
Label_808D30:
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

  global Label_808D34
Label_808D34:
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

  global Label_808D38
Label_808D38:
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

  global Label_808D3C
Label_808D3C:
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

  global Label_808D40
Label_808D40:
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

  global Label_808D44
Label_808D44:
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

  global Label_808D48
Label_808D48:
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

  global Label_808D4C
Label_808D4C:
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

  global Label_808D50
Label_808D50:
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

  global Label_808D54
Label_808D54:
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

  global Label_808D58
Label_808D58:
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

  global Label_808D5C
Label_808D5C:
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

  global Label_808D60
Label_808D60:
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

  global Label_808D64
Label_808D64:
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

  global Label_808D68
Label_808D68:
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

  global Label_808D6C
Label_808D6C:
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

  global Label_808D70
Label_808D70:
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

  global Label_808D74
Label_808D74:
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

  global Label_808D78
Label_808D78:
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

  global Label_808D7C
Label_808D7C:
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

  global Label_808D80
Label_808D80:
  ; -- 808D80 --
  mov r12, 0x808D80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808D84
Label_808D84:
  ; -- 808D84 --
  mov r12, 0x808D84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808D88
Label_808D88:
  ; -- 808D88 --
  mov r12, 0x808D88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808D8C
Label_808D8C:
  ; -- 808D8C --
  mov r12, 0x808D8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x00
  add qword [rel CycleCount], 2

  global Label_808D90
Label_808D90:
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

  global Label_808D94
Label_808D94:
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

  global Label_808D98
Label_808D98:
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

  global Label_808D9C
Label_808D9C:
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

  global Label_808DA0
Label_808DA0:
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

  global Label_808DA4
Label_808DA4:
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

  global Label_808DA8
Label_808DA8:
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

  global Label_808DAC
Label_808DAC:
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

  global Label_808DB0
Label_808DB0:
  ; -- 808DB0 --
  mov r12, 0x808DB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DB0
  mov rdx, 0xDB123456
  call __PRINT_INS

  global Label_808DB4
Label_808DB4:
  ; -- 808DB4 --
  mov r12, 0x808DB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DB4
  mov rdx, 0xDB123456
  call __PRINT_INS

  global Label_808DB8
Label_808DB8:
  ; -- 808DB8 --
  mov r12, 0x808DB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DB8
  mov rdx, 0xDB123456
  call __PRINT_INS

  global Label_808DBC
Label_808DBC:
  ; -- 808DBC --
  mov r12, 0x808DBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  ; UNKNOWN DB123456
  mov rcx, 0x00808DBC
  mov rdx, 0xDB123456
  call __PRINT_INS

  global Label_808DC0
Label_808DC0:
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

  global Label_808DC4
Label_808DC4:
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

  global Label_808DC8
Label_808DC8:
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

  global Label_808DCC
Label_808DCC:
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

  global Label_808DD0
Label_808DD0:
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

  global Label_808DD4
Label_808DD4:
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

  global Label_808DD8
Label_808DD8:
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

  global Label_808DDC
Label_808DDC:
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

  global Label_808DE0
Label_808DE0:
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

  global Label_808DE4
Label_808DE4:
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

  global Label_808DE8
Label_808DE8:
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

  global Label_808DEC
Label_808DEC:
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

  global Label_808DF0
Label_808DF0:
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

  global Label_808DF4
Label_808DF4:
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

  global Label_808DF8
Label_808DF8:
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

  global Label_808DFC
Label_808DFC:
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

  global Label_808E00
Label_808E00:
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

  global Label_808E04
Label_808E04:
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

  global Label_808E08
Label_808E08:
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

  global Label_808E0C
Label_808E0C:
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

  global Label_808E10
Label_808E10:
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

  global Label_808E14
Label_808E14:
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

  global Label_808E18
Label_808E18:
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

  global Label_808E1C
Label_808E1C:
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

  global Label_808E20
Label_808E20:
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

  global Label_808E24
Label_808E24:
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

  global Label_808E28
Label_808E28:
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

  global Label_808E2C
Label_808E2C:
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

  global Label_808E30
Label_808E30:
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

  global Label_808E34
Label_808E34:
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

  global Label_808E38
Label_808E38:
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

  global Label_808E3C
Label_808E3C:
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

  global Label_808E40
Label_808E40:
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

  global Label_808E44
Label_808E44:
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

  global Label_808E48
Label_808E48:
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

  global Label_808E4C
Label_808E4C:
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

  global Label_808E50
Label_808E50:
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

  global Label_808E54
Label_808E54:
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

  global Label_808E58
Label_808E58:
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

  global Label_808E5C
Label_808E5C:
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

  global Label_808E60
Label_808E60:
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

  global Label_808E64
Label_808E64:
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

  global Label_808E68
Label_808E68:
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

  global Label_808E6C
Label_808E6C:
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

  global Label_808E70
Label_808E70:
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

  global Label_808E74
Label_808E74:
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

  global Label_808E78
Label_808E78:
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

  global Label_808E7C
Label_808E7C:
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

  global Label_808E80
Label_808E80:
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

  global Label_808E84
Label_808E84:
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

  global Label_808E88
Label_808E88:
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

  global Label_808E8C
Label_808E8C:
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

  global Label_808E90
Label_808E90:
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

  global Label_808E94
Label_808E94:
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

  global Label_808E98
Label_808E98:
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

  global Label_808E9C
Label_808E9C:
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

  global Label_808EA0
Label_808EA0:
  ; -- 808EA0 --
  mov r12, 0x808EA0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2

  global Label_808EA4
Label_808EA4:
  ; -- 808EA4 --
  mov r12, 0x808EA4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2

  global Label_808EA8
Label_808EA8:
  ; -- 808EA8 --
  mov r12, 0x808EA8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2

  global Label_808EAC
Label_808EAC:
  ; -- 808EAC --
  mov r12, 0x808EAC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  nop
  add qword [rel CycleCount], 2

  global Label_808EB0
Label_808EB0:
  ; -- 808EB0 --
  mov r12, 0x808EB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov rdx, rax
  and rdx, 0xFF
  shl rdx, 8
  shr rax, 8
  and rax, 0xFF
  or rax, rdx
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3

  global Label_808EB4
Label_808EB4:
  ; -- 808EB4 --
  mov r12, 0x808EB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov rdx, rax
  and rdx, 0xFF
  shl rdx, 8
  shr rax, 8
  and rax, 0xFF
  or rax, rdx
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3

  global Label_808EB8
Label_808EB8:
  ; -- 808EB8 --
  mov r12, 0x808EB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov rdx, rax
  and rdx, 0xFF
  shl rdx, 8
  shr rax, 8
  and rax, 0xFF
  or rax, rdx
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3

  global Label_808EBC
Label_808EBC:
  ; -- 808EBC --
  mov r12, 0x808EBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  movzx rax, word [rel regA]
  mov rdx, rax
  and rdx, 0xFF
  shl rdx, 8
  shr rax, 8
  and rax, 0xFF
  or rax, rdx
  mov word [rel regA], ax
  call __UpdateNZ_A8
  add qword [rel CycleCount], 3

  global Label_808EC0
Label_808EC0:
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

  global Label_808EC4
Label_808EC4:
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

  global Label_808EC8
Label_808EC8:
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

  global Label_808ECC
Label_808ECC:
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

  global Label_808ED0
Label_808ED0:
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

  global Label_808ED4
Label_808ED4:
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

  global Label_808ED8
Label_808ED8:
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

  global Label_808EDC
Label_808EDC:
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

  global Label_808EE0
Label_808EE0:
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

  global Label_808EE4
Label_808EE4:
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

  global Label_808EE8
Label_808EE8:
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

  global Label_808EEC
Label_808EEC:
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

  global Label_808EF0
Label_808EF0:
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

  global Label_808EF4
Label_808EF4:
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

  global Label_808EF8
Label_808EF8:
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

  global Label_808EFC
Label_808EFC:
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

  global Label_808F00
Label_808F00:
  ; -- 808F00 --
  mov r12, 0x808F00
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F14

  global Label_808F04
Label_808F04:
  ; -- 808F04 --
  mov r12, 0x808F04
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F18

  global Label_808F08
Label_808F08:
  ; -- 808F08 --
  mov r12, 0x808F08
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F1C

  global Label_808F0C
Label_808F0C:
  ; -- 808F0C --
  mov r12, 0x808F0C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  add qword [rel CycleCount], 2
  cmp byte [rel Z_Flag], 1
  je Label_808F20

  global Label_808F10
Label_808F10:
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

  global Label_808F24
Label_808F24:
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

  global Label_808F28
Label_808F28:
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

  global Label_808F2C
Label_808F2C:
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

  global Label_808F30
Label_808F30:
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

  global Label_808F34
Label_808F34:
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

  global Label_808F38
Label_808F38:
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

  global Label_808F3C
Label_808F3C:
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

  global Label_808F40
Label_808F40:
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

  global Label_808F44
Label_808F44:
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

  global Label_808F48
Label_808F48:
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

  global Label_808F4C
Label_808F4C:
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

  global Label_808F50
Label_808F50:
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

  global Label_808F54
Label_808F54:
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

  global Label_808F58
Label_808F58:
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

  global Label_808F5C
Label_808F5C:
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

  global Label_808F60
Label_808F60:
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

  global Label_808F64
Label_808F64:
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

  global Label_808F68
Label_808F68:
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

  global Label_808F6C
Label_808F6C:
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

  global Label_808F70
Label_808F70:
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

  global Label_808F74
Label_808F74:
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

  global Label_808F78
Label_808F78:
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

  global Label_808F7C
Label_808F7C:
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

  global Label_808F80
Label_808F80:
  ; -- 808F80 --
  mov r12, 0x808F80
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808F84
Label_808F84:
  ; -- 808F84 --
  mov r12, 0x808F84
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808F88
Label_808F88:
  ; -- 808F88 --
  mov r12, 0x808F88
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808F8C
Label_808F8C:
  ; -- 808F8C --
  mov r12, 0x808F8C
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  mov byte [rel D_Flag], 0x01
  add qword [rel CycleCount], 2

  global Label_808F90
Label_808F90:
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

  global Label_808F94
Label_808F94:
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

  global Label_808F98
Label_808F98:
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

  global Label_808F9C
Label_808F9C:
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

  global Label_808FA0
Label_808FA0:
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

  global Label_808FA4
Label_808FA4:
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

  global Label_808FA8
Label_808FA8:
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

  global Label_808FAC
Label_808FAC:
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

  global Label_808FB0
Label_808FB0:
  ; -- 808FB0 --
  mov r12, 0x808FB0
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2

  global Label_808FB4
Label_808FB4:
  ; -- 808FB4 --
  mov r12, 0x808FB4
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2

  global Label_808FB8
Label_808FB8:
  ; -- 808FB8 --
  mov r12, 0x808FB8
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2

  global Label_808FBC
Label_808FBC:
  ; -- 808FBC --
  mov r12, 0x808FBC
  sub rsp, 32
  call __CPUSync
  add rsp, 32
  sub rsp, 32
  call __XCE
  add rsp, 32
  add qword [rel CycleCount], 2

  global Label_808FC0
Label_808FC0:
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
  or rcx, 0x800000
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

  global Label_808FC4
Label_808FC4:
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
  or rcx, 0x800000
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

  global Label_808FC8
Label_808FC8:
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
  or rcx, 0x800000
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

  global Label_808FCC
Label_808FCC:
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
  or rcx, 0x800000
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

  global Label_808FD0
Label_808FD0:
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

  global Label_808FD4
Label_808FD4:
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

  global Label_808FD8
Label_808FD8:
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

  global Label_808FDC
Label_808FDC:
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

  global Label_808FE0
Label_808FE0:
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

  global Label_808FE4
Label_808FE4:
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

  global Label_808FE8
Label_808FE8:
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

  global Label_808FEC
Label_808FEC:
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

  global Label_808FF0
Label_808FF0:
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

  global Label_808FF4
Label_808FF4:
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

  global Label_808FF8
Label_808FF8:
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

  global Label_808FFC
Label_808FFC:
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
