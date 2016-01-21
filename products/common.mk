# Generic product
PRODUCT_NAME := AOSIP
PRODUCT_BRAND := AOSIP
PRODUCT_DEVICE := generic

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.adb.secure=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb \

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

ifneq ($(filter aosip_hammerhead aosip_shamu,$(TARGET_PRODUCT)),)
# Camera Effects
PRODUCT_COPY_FILES +=  \
    vendor/aosip/proprietary/common/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/aosip/proprietary/common/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

ifneq ($(filter aosip_hammerhead aosip_shamu,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    libdrmclearkeyplugin 
endif

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter aosip_hammerhead aosip_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/aosip/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/aosip/proprietary/common/system/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

#Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aosip/overlay/common

# Busybox
PRODUCT_PACKAGES += \
    Busybox \
    LockClock 
#    OmniJaws

PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/app/NovaLauncher.apk:system/priv-app/NovaLauncher.apk

# Theme engine
include vendor/aosip/config/themes_common.mk

# Inherit common product build prop overrides
-include vendor/aosip/products/common_full.mk
