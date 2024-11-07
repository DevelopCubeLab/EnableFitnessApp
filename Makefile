TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = EnableFitnessApp

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = EnableFitnessApp

EnableFitnessApp_FILES = AppDelegate.swift EnableHelper.swift RootViewController.swift  DeviceManager.m
_BUNDLE_RESOURCES = Resources/en.lproj Resources/zh-Hans.lproj
EnableFitnessApp_FRAMEWORKS = UIKit CoreGraphics
EnableFitnessApp_SWIFT_BRIDGING_HEADER += EnableFitnessApp-Bridging-Header.h

include $(THEOS_MAKE_PATH)/application.mk

$(APPLICATION_NAME)_CODESIGN_FLAGS = -Sentitlements.plist

after-package::
	@echo "Renaming .ipa to .tipa..."
	@mv ./packages/com.developlab.enablefitnessapp_1.1.ipa ./packages/com.developlab.enablefitnessapp_1.1.tipa || echo "No .ipa file found."
