ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard
TARGET := iphone:clang:16.4:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpeedrunTime

SpeedrunTime_FILES = $(shell find Sources/SpeedrunTime -name '*.swift') $(shell find Sources/SpeedrunTimeC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
SpeedrunTime_SWIFTFLAGS = -ISources/SpeedrunTimeC/include
SpeedrunTime_CFLAGS = -fobjc-arc -ISources/SpeedrunTimeC/include

include $(THEOS_MAKE_PATH)/tweak.mk
