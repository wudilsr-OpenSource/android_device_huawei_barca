#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Device Path
DEVICE_PATH := device/huawei/prague

## Inherit common device
$(call inherit-product, device/huawei/hi6250-8-common/hi6250.mk)

# Display
TARGET_SCREEN_DENSITY := 480
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Inherit vendor blobs
$(call inherit-product, vendor/huawei/prague/prague-vendor.mk)

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/CameraDaemon.rc:$(TARGET_COPY_OUT_ODM)/etc/init/CameraDaemon.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
