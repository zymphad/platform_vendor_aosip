
# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bin/50-aosip.sh:system/addon.d/50-aosip.sh \
    vendor/aosip/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosip/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions
endif

#Root by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

#extras
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/aosip/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \

PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bootanimations/BOOTANIMATION.zip:system/media/bootanimation.zip

# Inherit common product build prop overrides
-include vendor/aosip/products/common_versions.mk
