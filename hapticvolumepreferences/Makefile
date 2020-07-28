TARGET := iphone:clang:latest:7.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HapticVolumePreferences

HapticVolumePreferences_FILES = HVPRootListController.m
HapticVolumePreferences_FRAMEWORKS = UIKit
HapticVolumePreferences_PRIVATE_FRAMEWORKS = Preferences
HapticVolumePreferences_INSTALL_PATH = /Library/PreferenceBundles
HapticVolumePreferences_CFLAGS = -fobjc-arc
HapticVolumePreferences_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
