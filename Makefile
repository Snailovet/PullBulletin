ARCHS = armv7 arm64
TARGET = iphone:clang::8.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PullBulletin
PullBulletin_FILES = Tweak.xm
PullBulletin_FRAMEWORKS = UIKit
PullBulletin_CFLAGS += -I ../AASpringRefresh/AASpringRefresh
PullBulletin_LDFLAGS += -L ../AASpringRefresh/AASpringRefreshDemo/build/Release-iphoneos
PullBulletin_LDFLAGS += -Wl,-segalign,4000
PullBulletin_LIBRARIES = AASpringRefresh

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

aa::
	xcodebuild -project ../AASpringRefresh/AASpringRefreshDemo/AASpringRefreshDemo.xcodeproj -target libAASpringRefresh
