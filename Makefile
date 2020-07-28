THEOS_DEVICE_IP = 192.168.0.43

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HapticVolume
HapticVolume_FILES = Tweak.x
HapticVolume_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

HapticVolume_FRAMEWORKS = AudioToolbox
HapticVolume_EXTRA_FRAMEWORKS += Cephei

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += hapticvolumepreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
