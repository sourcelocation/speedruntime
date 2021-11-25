ARCHS = arm64 arm64e
DEBUG = 0
TARGET := iphone:clang:latest:12.2
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = 192.168.1.90 -p 22


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpeedrunTime

SpeedrunTime_FILES = $(shell find Sources/SpeedrunTime -name '*.swift') $(shell find Sources/SpeedrunTimeC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
SpeedrunTime_SWIFTFLAGS = -ISources/SpeedrunTimeC/include
SpeedrunTime_CFLAGS = -fobjc-arc -ISources/SpeedrunTimeC/include

include $(THEOS_MAKE_PATH)/tweak.mk
