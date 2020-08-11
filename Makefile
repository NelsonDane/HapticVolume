THEOS_DEVICE_IP = 10.0.1.6

TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

ARCHS = arm64 arm64e

PACKAGE_VERSION = 1.0.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HapticVolume
HapticVolume_FILES = Tweak.x
HapticVolume_CFLAGS = -fobjc-arc

HapticVolume_FRAMEWORKS = AudioToolbox
HapticVolume_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += hapticvolumepreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
