# This is Makefile for ESP32 IDF

COMPONENT_ADD_INCLUDEDIRS := ./include
COMPONENT_OBJS := src/ChipMapper.o src/VGMPlay.o src/VGMPlay_AddFmts.o src/VGMRtos.o src/pt_ioctl.o \
    src/chips/2151intf.o    src/chips/adlibemu_opl2.o  src/chips/emu2413.o   src/chips/multipcm.o    src/chips/pwm.o          src/chips/sn76489.o      src/chips/ym2413hd.o \
    src/chips/2203intf.o    src/chips/adlibemu_opl3.o  src/chips/es5503.o    src/chips/nes_apu.o     src/chips/qsound_ctr.o   src/chips/sn76496.o      src/chips/ym2612.o \
    src/chips/2413intf.o    src/chips/ay8910.o         src/chips/es5506.o    src/chips/nes_intf.o    src/chips/qsound_intf.o  src/chips/sn76496_opl.o  src/chips/ym3438.o \
    src/chips/2608intf.o    src/chips/ay8910_opl.o     src/chips/fm.o        src/chips/np_nes_apu.o  src/chips/qsound_mame.o  src/chips/sn764intf.o    src/chips/ymdeltat.o \
    src/chips/2610intf.o    src/chips/ay_intf.o        src/chips/fm2612.o    src/chips/np_nes_dmc.o  src/chips/rf5c68.o       src/chips/upd7759.o      src/chips/ymf262.o \
    src/chips/2612intf.o    src/chips/c140.o           src/chips/fmopl.o     src/chips/np_nes_fds.o  src/chips/saa1099.o      src/chips/vsu.o          src/chips/ymf271.o \
    src/chips/262intf.o     src/chips/c352.o           src/chips/gb.o        src/chips/okim6258.o    src/chips/scd_pcm.o      src/chips/ws_audio.o     src/chips/ymf278b.o \
    src/chips/3526intf.o    src/chips/c6280.o          src/chips/iremga20.o  src/chips/okim6295.o    src/chips/scsp.o         src/chips/x1_010.o       src/chips/ymz280b.o \
    src/chips/3812intf.o    src/chips/c6280intf.o      src/chips/k051649.o   src/chips/scspdsp.o     src/chips/ym2151.o \
    src/chips/8950intf.o    src/chips/dac_control.o    src/chips/k053260.o   src/chips/panning.o     src/chips/ym2413.o \
    src/chips/Ootake_PSG.o  src/chips/emu2149.o        src/chips/k054539.o   src/chips/pokey.o       src/chips/segapcm.o      src/chips/ym2413_opl.o \

COMPONENT_SRCDIRS := ./src ./src/chips
CPPFLAGS += -DVGM_RTOS -DEXCLUDE_ALL_VGM_CHIPS -DVGM_FILE_FROM_MEMORY -DVGM_NO_ZLIB -DDISABLE_HW_SUPPORT -DVGM_LITTLE_ENDIAN -DENABLE_ALL_CORES
CPPFLAGS += -DVGM_AY8910 -DVGM_TEST

# Unfortunately NESAPU needs too much of static RAM, more than ESP32 WROOM module allows
# -DVGM_NESAPU

# COMPONENT_DEPENDS := spibus
