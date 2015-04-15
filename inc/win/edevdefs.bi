'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   DISCLAIMER
''   This file has no copyright assigned and is placed in the Public Domain.
''   This file is part of the mingw-w64 runtime package.
''
''   The mingw-w64 runtime package and its code is distributed in the hope that it 
''   will be useful but WITHOUT ANY WARRANTY.  ALL WARRANTIES, EXPRESSED OR 
''   IMPLIED ARE HEREBY DISCLAIMED.  This includes but is not limited to 
''   warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#define _EDEVDEFS_H
const ED_TOP = &h00000001
const ED_MIDDLE = &h00000002
const ED_BOTTOM = &h00000004
const ED_LEFT = &h00000100
const ED_CENTER = &h00000200
const ED_RIGHT = &h00000400
const ED_DEVCAP_CAN_RECORD = &h00001001
const ED_DEVCAP_CAN_RECORD_STROBE = &h00001002
const ED_DEVCAP_HAS_AUDIO = &h00001003
const ED_DEVCAP_HAS_VIDEO = &h00001004
const ED_DEVCAP_USES_FILES = &h00001005
const ED_DEVCAP_CAN_SAVE = &h00001006
const ED_DEVCAP_DEVICE_TYPE = &h00001007
const ED_DEVTYPE_VCR = &h00001008
const ED_DEVTYPE_LASERDISK = &h00001009
const ED_DEVTYPE_ATR = &h0000100A
const ED_DEVTYPE_DDR = &h0000100B
const ED_DEVTYPE_ROUTER = &h0000100C
const ED_DEVTYPE_KEYER = &h0000100D
const ED_DEVTYPE_MIXER_VIDEO = &h0000100E
const ED_DEVTYPE_DVE = &h0000100F
const ED_DEVTYPE_WIPEGEN = &h00001010
const ED_DEVTYPE_MIXER_AUDIO = &h00001011
const ED_DEVTYPE_CG = &h00001012
const ED_DEVTYPE_TBC = &h00001013
const ED_DEVTYPE_TCG = &h00001014
const ED_DEVTYPE_GPI = &h00001015
const ED_DEVTYPE_JOYSTICK = &h00001016
const ED_DEVTYPE_KEYBOARD = &h00001017
const ED_DEVCAP_EXTERNAL_DEVICE_ID = &h00001018
const ED_DEVCAP_TIMECODE_READ = &h00001019
const ED_DEVCAP_TIMECODE_WRITE = &h0000101A
const ED_DEVCAP_CTLTRK_READ = &h0000101B
const ED_DEVCAP_INDEX_READ = &h0000101C
const ED_DEVCAP_PREROLL = &h0000101D
const ED_DEVCAP_POSTROLL = &h0000101E
const ED_DEVCAP_SYNC_ACCURACY = &h0000101F
const ED_SYNCACC_PRECISE = &h00001020
const ED_SYNCACC_FRAME = &h00001021
const ED_SYNCACC_ROUGH = &h00001022
const ED_DEVCAP_NORMAL_RATE = &h00001023
const ED_RATE_24 = &h00001024
const ED_RATE_25 = &h00001025
const ED_RATE_2997 = &h00001026
const ED_RATE_30 = &h00001027
const ED_DEVCAP_CAN_PREVIEW = &h00001028
const ED_DEVCAP_CAN_MONITOR_SOURCES = &h00001029
const ED_DEVCAP_CAN_TEST = &h0000102A
const ED_DEVCAP_VIDEO_INPUTS = &h0000102B
const ED_DEVCAP_AUDIO_INPUTS = &h0000102C
const ED_DEVCAP_NEEDS_CALIBRATING = &h0000102D
const ED_DEVCAP_SEEK_TYPE = &h0000102E
const ED_SEEK_PERFECT = &h0000102F
const ED_SEEK_FAST = &h00001030
const ED_SEEK_SLOW = &h00001031
const ED_POWER_ON = &h00001032
const ED_POWER_OFF = &h00001033
const ED_POWER_STANDBY = &h00001034
const ED_ACTIVE = &h00001035
const ED_INACTIVE = &h00001036
const ED_ALL = &h00001037
const ED_TEST = &h00001038
const ED_TRANSCAP_CAN_EJECT = &h00001064
const ED_TRANSCAP_CAN_BUMP_PLAY = &h00001065
const ED_TRANSCAP_CAN_PLAY_BACKWARDS = &h00001066
const ED_TRANSCAP_CAN_SET_EE = &h00001067
const ED_TRANSCAP_CAN_SET_PB = &h00001068
const ED_TRANSCAP_CAN_DELAY_VIDEO_IN = &h00001069
const ED_TRANSCAP_CAN_DELAY_VIDEO_OUT = &h0000106A
const ED_TRANSCAP_CAN_DELAY_AUDIO_IN = &h0000106B
const ED_TRANSCAP_CAN_DELAY_AUDIO_OUT = &h0000106C
const ED_TRANSCAP_FWD_VARIABLE_MAX = &h0000106D
const ED_TRANSCAP_REV_VARIABLE_MAX = &h0000106E
const ED_TRANSCAP_NUM_AUDIO_TRACKS = &h0000106F
const ED_TRANSCAP_LTC_TRACK = &h00001070
const ED_TRANSCAP_NEEDS_TBC = &h00001071
const ED_TRANSCAP_NEEDS_CUEING = &h00001072
const ED_TRANSCAP_CAN_INSERT = &h00001073
const ED_TRANSCAP_CAN_ASSEMBLE = &h00001074
const ED_TRANSCAP_FIELD_STEP = &h00001075
const ED_TRANSCAP_CLOCK_INC_RATE = &h00001076
const ED_TRANSCAP_CAN_DETECT_LENGTH = &h00001077
const ED_TRANSCAP_CAN_FREEZE = &h00001078
const ED_TRANSCAP_HAS_TUNER = &h00001079
const ED_TRANSCAP_HAS_TIMER = &h0000107A
const ED_TRANSCAP_HAS_CLOCK = &h0000107B
const ED_MEDIA_SPIN_UP = &h00001082
const ED_MEDIA_SPIN_DOWN = &h00001083
const ED_MEDIA_UNLOAD = &h00001084
const ED_MODE_PLAY = &h000010C8
const ED_MODE_STOP = &h000010C9
const ED_MODE_FREEZE = &h000010CA
const ED_MODE_THAW = &h000010CB
const ED_MODE_FF = &h000010CC
const ED_MODE_REW = &h000010CD
const ED_MODE_RECORD = &h000010CE
const ED_MODE_RECORD_STROBE = &h000010CF
const ED_MODE_STEP = &h000010D0
const ED_MODE_STEP_FWD = &h000010D0
const ED_MODE_SHUTTLE = &h000010D1
const ED_MODE_EDIT_CUE = &h000010D2
const ED_MODE_VAR_SPEED = &h000010D3
const ED_MODE_PERFORM = &h000010D4
const ED_MODE_LINK_ON = &h00001118
const ED_MODE_LINK_OFF = &h00001119
const ED_TCG_TIMECODE_TYPE = &h00001190
const ED_TCG_SMPTE_LTC = &h00001191
const ED_TCG_SMPTE_VITC = &h00001192
const ED_TCG_MIDI_QF = &h00001193
const ED_TCG_MIDI_FULL = &h00001194
const ED_TCG_FRAMERATE = &h00001195
const ED_TCG_SYNC_SOURCE = &h0000119A
const ED_TCG_VIDEO = &h0000119B
const ED_TCG_READER = &h0000119C
const ED_TCG_FREE = &h0000119D
const ED_TCG_REFERENCE_SOURCE = &h0000119E
const ED_TCR_SOURCE = &h000011A0
const ED_TCR_LTC = &h000011A1
const ED_TCR_VITC = &h000011A2
const ED_TCR_CT = &h000011A3
const ED_TCR_FTC = &h000011A4
const ED_TCR_LAST_VALUE = &h000011A5
const ED_TCD_SOURCE = &h000011A6
const ED_TCR = &h000011A7
const ED_TCG = &h000011A8
const ED_TCD_SIZE = &h000011A9
const ED_SMALL = &h000011AA
const ED_MED = &h000011AB
const ED_LARGE = &h000011AC
const ED_TCD_POSITION = &h000011AD
const ED_TCD_INTENSITY = &h000011B4
const ED_HIGH = &h000011B5
const ED_LOW = &h000011B6
const ED_TCD_TRANSPARENCY = &h000011B7
const ED_TCD_INVERT = &h000011B8
const ED_MODE = &h000011F4
const ED_ERROR = &h000011F5
const ED_LOCAL = &h000011F6
const ED_RECORD_INHIBIT = &h000011F7
const ED_SERVO_LOCK = &h000011F8
const ED_MEDIA_PRESENT = &h000011F9
const ED_MEDIA_LENGTH = &h000011FA
const ED_MEDIA_SIZE = &h000011FB
const ED_MEDIA_TRACK_COUNT = &h000011FC
const ED_MEDIA_TRACK_LENGTH = &h000011FD
const ED_MEDIA_SIDE = &h000011FE
const ED_MEDIA_TYPE = &h000011FF
const ED_MEDIA_VHS = &h00001200
const ED_MEDIA_SVHS = &h00001201
const ED_MEDIA_HI8 = &h00001202
const ED_MEDIA_UMATIC = &h00001203
const ED_MEDIA_DVC = &h00001204
const ED_MEDIA_1_INCH = &h00001205
const ED_MEDIA_D1 = &h00001206
const ED_MEDIA_D2 = &h00001207
const ED_MEDIA_D3 = &h00001208
const ED_MEDIA_D5 = &h00001209
const ED_MEDIA_DBETA = &h0000120A
const ED_MEDIA_BETA = &h0000120B
const ED_MEDIA_8MM = &h0000120C
const ED_MEDIA_DDR = &h0000120D
const ED_MEDIA_OTHER = &h0000120E
const ED_MEDIA_CLV = &h0000120F
const ED_MEDIA_CAV = &h00001210
const ED_MEDIA_POSITION = &h00001211
const ED_LINK_MODE = &h00001212
const ED_TRANSBASIC_TIME_FORMAT = &h0000121C
const ED_FORMAT_MILLISECONDS = &h0000121D
const ED_FORMAT_FRAMES = &h0000121E
const ED_FORMAT_REFERENCE_TIME = &h0000121F
const ED_FORMAT_HMSF = &h00001223
const ED_FORMAT_TMSF = &h00001224
const ED_TRANSBASIC_TIME_REFERENCE = &h00001225
const ED_TIMEREF_TIMECODE = &h00001226
const ED_TIMEREF_CONTROL_TRACK = &h00001227
const ED_TIMEREF_INDEX = &h00001228
const ED_TRANSBASIC_SUPERIMPOSE = &h00001229
const ED_TRANSBASIC_END_STOP_ACTION = &h0000122A
const ED_TRANSBASIC_RECORD_FORMAT = &h0000122B
const ED_RECORD_FORMAT_SP = &h0000122C
const ED_RECORD_FORMAT_LP = &h0000122D
const ED_RECORD_FORMAT_EP = &h0000122E
const ED_TRANSBASIC_STEP_COUNT = &h0000122F
const ED_TRANSBASIC_STEP_UNIT = &h00001230
const ED_STEP_FIELD = &h00001231
const ED_STEP_FRAME = &h00001232
const ED_STEP_3_2 = &h00001233
const ED_TRANSBASIC_PREROLL = &h00001234
const ED_TRANSBASIC_RECPREROLL = &h00001235
const ED_TRANSBASIC_POSTROLL = &h00001236
const ED_TRANSBASIC_EDIT_DELAY = &h00001237
const ED_TRANSBASIC_PLAYTC_DELAY = &h00001238
const ED_TRANSBASIC_RECTC_DELAY = &h00001239
const ED_TRANSBASIC_EDIT_FIELD = &h0000123A
const ED_TRANSBASIC_FRAME_SERVO = &h0000123B
const ED_TRANSBASIC_CF_SERVO = &h0000123C
const ED_TRANSBASIC_SERVO_REF = &h0000123D
const ED_REF_EXTERNAL = &h0000123E
const ED_REF_INPUT = &h0000123F
const ED_REF_INTERNAL = &h00001240
const ED_REF_AUTO = &h00001241
const ED_TRANSBASIC_WARN_GL = &h00001242
const ED_TRANSBASIC_SET_TRACKING = &h00001243
const ED_TRACKING_PLUS = &h00001244
const ED_TRACKING_MINUS = &h00001245
const ED_TRACKING_RESET = &h00001246
const ED_TRANSBASIC_SET_FREEZE_TIMEOUT = &h00001247
const ED_TRANSBASIC_VOLUME_NAME = &h00001248
const ED_TRANSBASIC_BALLISTIC_1 = &h00001249
const ED_TRANSBASIC_BALLISTIC_2 = &h0000124A
const ED_TRANSBASIC_BALLISTIC_3 = &h0000124B
const ED_TRANSBASIC_BALLISTIC_4 = &h0000124C
const ED_TRANSBASIC_BALLISTIC_5 = &h0000124D
const ED_TRANSBASIC_BALLISTIC_6 = &h0000124E
const ED_TRANSBASIC_BALLISTIC_7 = &h0000124F
const ED_TRANSBASIC_BALLISTIC_8 = &h00001250
const ED_TRANSBASIC_BALLISTIC_9 = &h00001251
const ED_TRANSBASIC_BALLISTIC_10 = &h00001252
const ED_TRANSBASIC_BALLISTIC_11 = &h00001253
const ED_TRANSBASIC_BALLISTIC_12 = &h00001254
const ED_TRANSBASIC_BALLISTIC_13 = &h00001255
const ED_TRANSBASIC_BALLISTIC_14 = &h00001256
const ED_TRANSBASIC_BALLISTIC_15 = &h00001257
const ED_TRANSBASIC_BALLISTIC_16 = &h00001258
const ED_TRANSBASIC_BALLISTIC_17 = &h00001259
const ED_TRANSBASIC_BALLISTIC_18 = &h0000125A
const ED_TRANSBASIC_BALLISTIC_19 = &h0000125B
const ED_TRANSBASIC_BALLISTIC_20 = &h0000125C
const ED_TRANSBASIC_SETCLOCK = &h0000125D
const ED_TRANSBASIC_SET_COUNTER_FORMAT = &h0000125E
const ED_TRANSBASIC_SET_COUNTER_VALUE = &h0000125F
const ED_TRANSBASIC_SETTUNER_CH_UP = &h00001260
const ED_TRANSBASIC_SETTUNER_CH_DN = &h00001261
const ED_TRANSBASIC_SETTUNER_SK_UP = &h00001262
const ED_TRANSBASIC_SETTUNER_SK_DN = &h00001263
const ED_TRANSBASIC_SETTUNER_CH = &h00001264
const ED_TRANSBASIC_SETTUNER_NUM = &h00001265
const ED_TRANSBASIC_SETTIMER_EVENT = &h00001266
const ED_TRANSBASIC_SETTIMER_STARTDAY = &h00001267
const ED_TRANSBASIC_SETTIMER_STARTTIME = &h00001268
const ED_TRANSBASIC_SETTIMER_STOPDAY = &h00001269
const ED_TRANSBASIC_SETTIMER_STOPTIME = &h0000126A
const ED_TRANSVIDEO_SET_OUTPUT = &h00001276
const ED_E2E = &h00001277
const ED_PLAYBACK = &h00001278
const ED_OFF = &h00001279
const ED_TRANSVIDEO_SET_SOURCE = &h0000127A
const ED_TRANSAUDIO_ENABLE_OUTPUT = &h00001280
const ED_TRANSAUDIO_ENABLE_RECORD = &h00001282
const ED_TRANSAUDIO_ENABLE_SELSYNC = &h00001283
const ED_TRANSAUDIO_SET_SOURCE = &h00001284
const ED_TRANSAUDIO_SET_MONITOR = &h00001285
const ED_INVALID = &h0000128C
const ED_EXECUTING = &h0000128D
const ED_REGISTER = &h0000128E
const ED_DELETE = &h0000128F
const ED_EDIT_HEVENT = &h00001290
const ED_EDIT_TEST = &h00001291
const ED_EDIT_IMMEDIATE = &h00001292
const ED_EDIT_MODE = &h00001293
const ED_EDIT_MODE_ASSEMBLE = &h00001294
const ED_EDIT_MODE_INSERT = &h00001295
const ED_EDIT_MODE_CRASH_RECORD = &h00001296
const ED_EDIT_MODE_BOOKMARK_TIME = &h00001297
const ED_EDIT_MODE_BOOKMARK_CHAPTER = &h00001298
const ED_EDIT_MASTER = &h0000129A
const ED_EDIT_TRACK = &h0000129B
const ED_EDIT_SRC_INPOINT = &h0000129C
const ED_EDIT_SRC_OUTPOINT = &h0000129D
const ED_EDIT_REC_INPOINT = &h0000129E
const ED_EDIT_REC_OUTPOINT = &h0000129F
const ED_EDIT_REHEARSE_MODE = &h000012A0
const ED_EDIT_BVB = &h000012A1
const ED_EDIT_VBV = &h000012A2
const ED_EDIT_VVV = &h000012A3
const ED_EDIT_PERFORM = &h000012A4
const ED_EDIT_ABORT = &h000012A5
const ED_EDIT_TIMEOUT = &h000012A6
const ED_EDIT_SEEK = &h000012A7
const ED_EDIT_SEEK_EDIT_IN = &h000012A9
const ED_EDIT_SEEK_EDIT_OUT = &h000012AA
const ED_EDIT_SEEK_PREROLL = &h000012AB
const ED_EDIT_SEEK_PREROLL_CT = &h000012AC
const ED_EDIT_SEEK_BOOKMARK = &h000012AD
const ED_EDIT_OFFSET = &h000012AE
const ED_ERR_DEVICE_NOT_READY = &h000012BC
const ED_TRANSCAP_FWD_VARIABLE_MIN = &h00001320
const ED_TRANSCAP_REV_VARIABLE_MIN = &h00001321
const ED_TRANSCAP_FWD_SHUTTLE_MAX = &h00001322
const ED_TRANSCAP_FWD_SHUTTLE_MIN = &h00001323
const ED_TRANSCAP_REV_SHUTTLE_MAX = &h00001324
const ED_TRANSCAP_REV_SHUTTLE_MIN = &h00001325
const ED_TRANSCAP_MULTIPLE_EDITS = &h00001326
const ED_TRANSCAP_IS_MASTER = &h00001327
const ED_MODE_RECORD_FREEZE = &h00001328
const ED_MODE_STEP_REV = &h00001329
const ED_MODE_NOTIFY_ENABLE = &h0000132A
const ED_MODE_NOTIFY_DISABLE = &h0000132B
const ED_MODE_SHOT_SEARCH = &h0000132C
const ED_MEDIA_SX = &h0000132D
const ED_TRANSCAP_HAS_DT = &h0000132E
const ED_EDIT_PREREAD = &h0000132F
const ED_AUDIO_1 = &h00000001
const ED_AUDIO_2 = &h00000002
const ED_AUDIO_3 = &h00000004
const ED_AUDIO_4 = &h00000008
const ED_AUDIO_5 = &h00000010
const ED_AUDIO_6 = &h00000020
const ED_AUDIO_7 = &h00000040
const ED_AUDIO_8 = &h00000080
const ED_AUDIO_9 = &h00000100
const ED_AUDIO_10 = &h00000200
const ED_AUDIO_11 = &h00000400
const ED_AUDIO_12 = &h00000800
const ED_AUDIO_13 = &h00001000
const ED_AUDIO_14 = &h00002000
const ED_AUDIO_15 = &h00004000
const ED_AUDIO_16 = &h00008000
const ED_AUDIO_17 = &h00010000
const ED_AUDIO_18 = &h00020000
const ED_AUDIO_19 = &h00040000
const ED_AUDIO_20 = &h00080000
const ED_AUDIO_21 = &h00100000
const ED_AUDIO_22 = &h00200000
const ED_AUDIO_23 = &h00400000
const ED_AUDIO_24 = &h00800000
const ED_AUDIO_ALL = &h10000000
const ED_VIDEO = &h02000000
const DEV_PORT_SIM = &h00000001
const DEV_PORT_COM1 = &h00000002
const DEV_PORT_COM2 = &h00000003
const DEV_PORT_COM3 = &h00000004
const DEV_PORT_COM4 = &h00000005
const DEV_PORT_DIAQ = &h00000006
const DEV_PORT_ARTI = &h00000007
const DEV_PORT_1394 = &h00000008
const DEV_PORT_USB = &h00000009
#define DEV_PORT_MIN DEV_PORT_SIM
