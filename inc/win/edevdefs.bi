#pragma once

#define _EDEVDEFS_H
#define ED_TOP &h00000001
#define ED_MIDDLE &h00000002
#define ED_BOTTOM &h00000004
#define ED_LEFT &h00000100
#define ED_CENTER &h00000200
#define ED_RIGHT &h00000400
#define ED_DEVCAP_CAN_RECORD &h00001001
#define ED_DEVCAP_CAN_RECORD_STROBE &h00001002
#define ED_DEVCAP_HAS_AUDIO &h00001003
#define ED_DEVCAP_HAS_VIDEO &h00001004
#define ED_DEVCAP_USES_FILES &h00001005
#define ED_DEVCAP_CAN_SAVE &h00001006
#define ED_DEVCAP_DEVICE_TYPE &h00001007
#define ED_DEVTYPE_VCR &h00001008
#define ED_DEVTYPE_LASERDISK &h00001009
#define ED_DEVTYPE_ATR &h0000100A
#define ED_DEVTYPE_DDR &h0000100B
#define ED_DEVTYPE_ROUTER &h0000100C
#define ED_DEVTYPE_KEYER &h0000100D

'' TODO: #define ED_DEVTYPE_MIXER_VIDEO 0x000010OE
'' TODO: #define ED_DEVTYPE_DVE 0x000010OF

#define ED_DEVTYPE_WIPEGEN &h00001010
#define ED_DEVTYPE_MIXER_AUDIO &h00001011
#define ED_DEVTYPE_CG &h00001012
#define ED_DEVTYPE_TBC &h00001013
#define ED_DEVTYPE_TCG &h00001014
#define ED_DEVTYPE_GPI &h00001015
#define ED_DEVTYPE_JOYSTICK &h00001016
#define ED_DEVTYPE_KEYBOARD &h00001017
#define ED_DEVCAP_EXTERNAL_DEVICE_ID &h00001018
#define ED_DEVCAP_TIMECODE_READ &h00001019
#define ED_DEVCAP_TIMECODE_WRITE &h0000101A
#define ED_DEVCAP_CTLTRK_READ &h0000101B
#define ED_DEVCAP_INDEX_READ &h0000101C
#define ED_DEVCAP_PREROLL &h0000101D
#define ED_DEVCAP_POSTROLL &h0000101E
#define ED_DEVCAP_SYNC_ACCURACY &h0000101F
#define ED_SYNCACC_PRECISE &h00001020
#define ED_SYNCACC_FRAME &h00001021
#define ED_SYNCACC_ROUGH &h00001022
#define ED_DEVCAP_NORMAL_RATE &h00001023
#define ED_RATE_24 &h00001024
#define ED_RATE_25 &h00001025
#define ED_RATE_2997 &h00001026
#define ED_RATE_30 &h00001027
#define ED_DEVCAP_CAN_PREVIEW &h00001028
#define ED_DEVCAP_CAN_MONITOR_SOURCES &h00001029
#define ED_DEVCAP_CAN_TEST &h0000102A
#define ED_DEVCAP_VIDEO_INPUTS &h0000102B
#define ED_DEVCAP_AUDIO_INPUTS &h0000102C
#define ED_DEVCAP_NEEDS_CALIBRATING &h0000102D
#define ED_DEVCAP_SEEK_TYPE &h0000102E
#define ED_SEEK_PERFECT &h0000102F
#define ED_SEEK_FAST &h00001030
#define ED_SEEK_SLOW &h00001031
#define ED_POWER_ON &h00001032
#define ED_POWER_OFF &h00001033
#define ED_POWER_STANDBY &h00001034
#define ED_ACTIVE &h00001035
#define ED_INACTIVE &h00001036
#define ED_ALL &h00001037
#define ED_TEST &h00001038
#define ED_TRANSCAP_CAN_EJECT &h00001064
#define ED_TRANSCAP_CAN_BUMP_PLAY &h00001065
#define ED_TRANSCAP_CAN_PLAY_BACKWARDS &h00001066
#define ED_TRANSCAP_CAN_SET_EE &h00001067
#define ED_TRANSCAP_CAN_SET_PB &h00001068
#define ED_TRANSCAP_CAN_DELAY_VIDEO_IN &h00001069
#define ED_TRANSCAP_CAN_DELAY_VIDEO_OUT &h0000106A
#define ED_TRANSCAP_CAN_DELAY_AUDIO_IN &h0000106B
#define ED_TRANSCAP_CAN_DELAY_AUDIO_OUT &h0000106C
#define ED_TRANSCAP_FWD_VARIABLE_MAX &h0000106D
#define ED_TRANSCAP_REV_VARIABLE_MAX &h0000106E
#define ED_TRANSCAP_NUM_AUDIO_TRACKS &h0000106F
#define ED_TRANSCAP_LTC_TRACK &h00001070
#define ED_TRANSCAP_NEEDS_TBC &h00001071
#define ED_TRANSCAP_NEEDS_CUEING &h00001072
#define ED_TRANSCAP_CAN_INSERT &h00001073
#define ED_TRANSCAP_CAN_ASSEMBLE &h00001074
#define ED_TRANSCAP_FIELD_STEP &h00001075
#define ED_TRANSCAP_CLOCK_INC_RATE &h00001076
#define ED_TRANSCAP_CAN_DETECT_LENGTH &h00001077
#define ED_TRANSCAP_CAN_FREEZE &h00001078
#define ED_TRANSCAP_HAS_TUNER &h00001079
#define ED_TRANSCAP_HAS_TIMER &h0000107A
#define ED_TRANSCAP_HAS_CLOCK &h0000107B
#define ED_MEDIA_SPIN_UP &h00001082
#define ED_MEDIA_SPIN_DOWN &h00001083
#define ED_MEDIA_UNLOAD &h00001084
#define ED_MODE_PLAY &h000010C8
#define ED_MODE_STOP &h000010C9
#define ED_MODE_FREEZE &h000010CA
#define ED_MODE_THAW &h000010CB
#define ED_MODE_FF &h000010CC
#define ED_MODE_REW &h000010CD
#define ED_MODE_RECORD &h000010CE
#define ED_MODE_RECORD_STROBE &h000010CF
#define ED_MODE_STEP &h000010D0
#define ED_MODE_STEP_FWD &h000010D0
#define ED_MODE_SHUTTLE &h000010D1
#define ED_MODE_EDIT_CUE &h000010D2
#define ED_MODE_VAR_SPEED &h000010D3
#define ED_MODE_PERFORM &h000010D4
#define ED_MODE_LINK_ON &h00001118
#define ED_MODE_LINK_OFF &h00001119
#define ED_TCG_TIMECODE_TYPE &h00001190
#define ED_TCG_SMPTE_LTC &h00001191
#define ED_TCG_SMPTE_VITC &h00001192
#define ED_TCG_MIDI_QF &h00001193
#define ED_TCG_MIDI_FULL &h00001194
#define ED_TCG_FRAMERATE &h00001195
#define ED_TCG_SYNC_SOURCE &h0000119A
#define ED_TCG_VIDEO &h0000119B
#define ED_TCG_READER &h0000119C
#define ED_TCG_FREE &h0000119D
#define ED_TCG_REFERENCE_SOURCE &h0000119E
#define ED_TCR_SOURCE &h000011A0
#define ED_TCR_LTC &h000011A1
#define ED_TCR_VITC &h000011A2
#define ED_TCR_CT &h000011A3
#define ED_TCR_FTC &h000011A4
#define ED_TCR_LAST_VALUE &h000011A5
#define ED_TCD_SOURCE &h000011A6
#define ED_TCR &h000011A7
#define ED_TCG &h000011A8
#define ED_TCD_SIZE &h000011A9
#define ED_SMALL &h000011AA
#define ED_MED &h000011AB
#define ED_LARGE &h000011AC
#define ED_TCD_POSITION &h000011AD
#define ED_TCD_INTENSITY &h000011B4
#define ED_HIGH &h000011B5
#define ED_LOW &h000011B6
#define ED_TCD_TRANSPARENCY &h000011B7
#define ED_TCD_INVERT &h000011B8
#define ED_MODE &h000011F4
#define ED_ERROR &h000011F5
#define ED_LOCAL &h000011F6
#define ED_RECORD_INHIBIT &h000011F7
#define ED_SERVO_LOCK &h000011F8
#define ED_MEDIA_PRESENT &h000011F9
#define ED_MEDIA_LENGTH &h000011FA
#define ED_MEDIA_SIZE &h000011FB
#define ED_MEDIA_TRACK_COUNT &h000011FC
#define ED_MEDIA_TRACK_LENGTH &h000011FD
#define ED_MEDIA_SIDE &h000011FE
#define ED_MEDIA_TYPE &h000011FF
#define ED_MEDIA_VHS &h00001200
#define ED_MEDIA_SVHS &h00001201
#define ED_MEDIA_HI8 &h00001202
#define ED_MEDIA_UMATIC &h00001203
#define ED_MEDIA_DVC &h00001204
#define ED_MEDIA_1_INCH &h00001205
#define ED_MEDIA_D1 &h00001206
#define ED_MEDIA_D2 &h00001207
#define ED_MEDIA_D3 &h00001208
#define ED_MEDIA_D5 &h00001209
#define ED_MEDIA_DBETA &h0000120A
#define ED_MEDIA_BETA &h0000120B
#define ED_MEDIA_8MM &h0000120C
#define ED_MEDIA_DDR &h0000120D
#define ED_MEDIA_OTHER &h0000120E
#define ED_MEDIA_CLV &h0000120F
#define ED_MEDIA_CAV &h00001210
#define ED_MEDIA_POSITION &h00001211
#define ED_LINK_MODE &h00001212
#define ED_TRANSBASIC_TIME_FORMAT &h0000121C
#define ED_FORMAT_MILLISECONDS &h0000121D
#define ED_FORMAT_FRAMES &h0000121E
#define ED_FORMAT_REFERENCE_TIME &h0000121F
#define ED_FORMAT_HMSF &h00001223
#define ED_FORMAT_TMSF &h00001224
#define ED_TRANSBASIC_TIME_REFERENCE &h00001225
#define ED_TIMEREF_TIMECODE &h00001226
#define ED_TIMEREF_CONTROL_TRACK &h00001227
#define ED_TIMEREF_INDEX &h00001228
#define ED_TRANSBASIC_SUPERIMPOSE &h00001229
#define ED_TRANSBASIC_END_STOP_ACTION &h0000122A
#define ED_TRANSBASIC_RECORD_FORMAT &h0000122B
#define ED_RECORD_FORMAT_SP &h0000122C
#define ED_RECORD_FORMAT_LP &h0000122D
#define ED_RECORD_FORMAT_EP &h0000122E
#define ED_TRANSBASIC_STEP_COUNT &h0000122F
#define ED_TRANSBASIC_STEP_UNIT &h00001230
#define ED_STEP_FIELD &h00001231
#define ED_STEP_FRAME &h00001232
#define ED_STEP_3_2 &h00001233
#define ED_TRANSBASIC_PREROLL &h00001234
#define ED_TRANSBASIC_RECPREROLL &h00001235
#define ED_TRANSBASIC_POSTROLL &h00001236
#define ED_TRANSBASIC_EDIT_DELAY &h00001237
#define ED_TRANSBASIC_PLAYTC_DELAY &h00001238
#define ED_TRANSBASIC_RECTC_DELAY &h00001239
#define ED_TRANSBASIC_EDIT_FIELD &h0000123A
#define ED_TRANSBASIC_FRAME_SERVO &h0000123B
#define ED_TRANSBASIC_CF_SERVO &h0000123C
#define ED_TRANSBASIC_SERVO_REF &h0000123D
#define ED_REF_EXTERNAL &h0000123E
#define ED_REF_INPUT &h0000123F
#define ED_REF_INTERNAL &h00001240
#define ED_REF_AUTO &h00001241
#define ED_TRANSBASIC_WARN_GL &h00001242
#define ED_TRANSBASIC_SET_TRACKING &h00001243
#define ED_TRACKING_PLUS &h00001244
#define ED_TRACKING_MINUS &h00001245
#define ED_TRACKING_RESET &h00001246
#define ED_TRANSBASIC_SET_FREEZE_TIMEOUT &h00001247
#define ED_TRANSBASIC_VOLUME_NAME &h00001248
#define ED_TRANSBASIC_BALLISTIC_1 &h00001249
#define ED_TRANSBASIC_BALLISTIC_2 &h0000124A
#define ED_TRANSBASIC_BALLISTIC_3 &h0000124B
#define ED_TRANSBASIC_BALLISTIC_4 &h0000124C
#define ED_TRANSBASIC_BALLISTIC_5 &h0000124D
#define ED_TRANSBASIC_BALLISTIC_6 &h0000124E
#define ED_TRANSBASIC_BALLISTIC_7 &h0000124F
#define ED_TRANSBASIC_BALLISTIC_8 &h00001250
#define ED_TRANSBASIC_BALLISTIC_9 &h00001251
#define ED_TRANSBASIC_BALLISTIC_10 &h00001252
#define ED_TRANSBASIC_BALLISTIC_11 &h00001253
#define ED_TRANSBASIC_BALLISTIC_12 &h00001254
#define ED_TRANSBASIC_BALLISTIC_13 &h00001255
#define ED_TRANSBASIC_BALLISTIC_14 &h00001256
#define ED_TRANSBASIC_BALLISTIC_15 &h00001257
#define ED_TRANSBASIC_BALLISTIC_16 &h00001258
#define ED_TRANSBASIC_BALLISTIC_17 &h00001259
#define ED_TRANSBASIC_BALLISTIC_18 &h0000125A
#define ED_TRANSBASIC_BALLISTIC_19 &h0000125B
#define ED_TRANSBASIC_BALLISTIC_20 &h0000125C
#define ED_TRANSBASIC_SETCLOCK &h0000125D
#define ED_TRANSBASIC_SET_COUNTER_FORMAT &h0000125E
#define ED_TRANSBASIC_SET_COUNTER_VALUE &h0000125F
#define ED_TRANSBASIC_SETTUNER_CH_UP &h00001260
#define ED_TRANSBASIC_SETTUNER_CH_DN &h00001261
#define ED_TRANSBASIC_SETTUNER_SK_UP &h00001262
#define ED_TRANSBASIC_SETTUNER_SK_DN &h00001263
#define ED_TRANSBASIC_SETTUNER_CH &h00001264
#define ED_TRANSBASIC_SETTUNER_NUM &h00001265
#define ED_TRANSBASIC_SETTIMER_EVENT &h00001266
#define ED_TRANSBASIC_SETTIMER_STARTDAY &h00001267
#define ED_TRANSBASIC_SETTIMER_STARTTIME &h00001268
#define ED_TRANSBASIC_SETTIMER_STOPDAY &h00001269
#define ED_TRANSBASIC_SETTIMER_STOPTIME &h0000126A
#define ED_TRANSVIDEO_SET_OUTPUT &h00001276
#define ED_E2E &h00001277
#define ED_PLAYBACK &h00001278
#define ED_OFF &h00001279
#define ED_TRANSVIDEO_SET_SOURCE &h0000127A
#define ED_TRANSAUDIO_ENABLE_OUTPUT &h00001280
#define ED_TRANSAUDIO_ENABLE_RECORD &h00001282
#define ED_TRANSAUDIO_ENABLE_SELSYNC &h00001283
#define ED_TRANSAUDIO_SET_SOURCE &h00001284
#define ED_TRANSAUDIO_SET_MONITOR &h00001285
#define ED_INVALID &h0000128C
#define ED_EXECUTING &h0000128D
#define ED_REGISTER &h0000128E
#define ED_DELETE &h0000128F
#define ED_EDIT_HEVENT &h00001290
#define ED_EDIT_TEST &h00001291
#define ED_EDIT_IMMEDIATE &h00001292
#define ED_EDIT_MODE &h00001293
#define ED_EDIT_MODE_ASSEMBLE &h00001294
#define ED_EDIT_MODE_INSERT &h00001295
#define ED_EDIT_MODE_CRASH_RECORD &h00001296
#define ED_EDIT_MODE_BOOKMARK_TIME &h00001297
#define ED_EDIT_MODE_BOOKMARK_CHAPTER &h00001298
#define ED_EDIT_MASTER &h0000129A
#define ED_EDIT_TRACK &h0000129B
#define ED_EDIT_SRC_INPOINT &h0000129C
#define ED_EDIT_SRC_OUTPOINT &h0000129D
#define ED_EDIT_REC_INPOINT &h0000129E
#define ED_EDIT_REC_OUTPOINT &h0000129F
#define ED_EDIT_REHEARSE_MODE &h000012A0
#define ED_EDIT_BVB &h000012A1
#define ED_EDIT_VBV &h000012A2
#define ED_EDIT_VVV &h000012A3
#define ED_EDIT_PERFORM &h000012A4
#define ED_EDIT_ABORT &h000012A5
#define ED_EDIT_TIMEOUT &h000012A6
#define ED_EDIT_SEEK &h000012A7
#define ED_EDIT_SEEK_EDIT_IN &h000012A9
#define ED_EDIT_SEEK_EDIT_OUT &h000012AA
#define ED_EDIT_SEEK_PREROLL &h000012AB
#define ED_EDIT_SEEK_PREROLL_CT &h000012AC
#define ED_EDIT_SEEK_BOOKMARK &h000012AD
#define ED_EDIT_OFFSET &h000012AE
#define ED_ERR_DEVICE_NOT_READY &h000012BC
#define ED_TRANSCAP_FWD_VARIABLE_MIN &h00001320
#define ED_TRANSCAP_REV_VARIABLE_MIN &h00001321
#define ED_TRANSCAP_FWD_SHUTTLE_MAX &h00001322
#define ED_TRANSCAP_FWD_SHUTTLE_MIN &h00001323
#define ED_TRANSCAP_REV_SHUTTLE_MAX &h00001324
#define ED_TRANSCAP_REV_SHUTTLE_MIN &h00001325
#define ED_TRANSCAP_MULTIPLE_EDITS &h00001326
#define ED_TRANSCAP_IS_MASTER &h00001327
#define ED_MODE_RECORD_FREEZE &h00001328
#define ED_MODE_STEP_REV &h00001329
#define ED_MODE_NOTIFY_ENABLE &h0000132A
#define ED_MODE_NOTIFY_DISABLE &h0000132B
#define ED_MODE_SHOT_SEARCH &h0000132C
#define ED_MEDIA_SX &h0000132D
#define ED_TRANSCAP_HAS_DT &h0000132E
#define ED_EDIT_PREREAD &h0000132F
#define ED_AUDIO_1 &h00000001
#define ED_AUDIO_2 &h00000002
#define ED_AUDIO_3 &h00000004
#define ED_AUDIO_4 &h00000008
#define ED_AUDIO_5 &h00000010
#define ED_AUDIO_6 &h00000020
#define ED_AUDIO_7 &h00000040
#define ED_AUDIO_8 &h00000080
#define ED_AUDIO_9 &h00000100
#define ED_AUDIO_10 &h00000200
#define ED_AUDIO_11 &h00000400
#define ED_AUDIO_12 &h00000800
#define ED_AUDIO_13 &h00001000
#define ED_AUDIO_14 &h00002000
#define ED_AUDIO_15 &h00004000
#define ED_AUDIO_16 &h00008000
#define ED_AUDIO_17 &h00010000
#define ED_AUDIO_18 &h00020000
#define ED_AUDIO_19 &h00040000
#define ED_AUDIO_20 &h00080000
#define ED_AUDIO_21 &h00100000
#define ED_AUDIO_22 &h00200000
#define ED_AUDIO_23 &h00400000
#define ED_AUDIO_24 &h00800000
#define ED_AUDIO_ALL &h10000000
#define ED_VIDEO &h02000000
#define DEV_PORT_SIM &h00000001
#define DEV_PORT_COM1 &h00000002
#define DEV_PORT_COM2 &h00000003
#define DEV_PORT_COM3 &h00000004
#define DEV_PORT_COM4 &h00000005
#define DEV_PORT_DIAQ &h00000006
#define DEV_PORT_ARTI &h00000007
#define DEV_PORT_1394 &h00000008
#define DEV_PORT_USB &h00000009
#define DEV_PORT_MIN DEV_PORT_SIM
