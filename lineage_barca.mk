#
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from prague device
$(call inherit-product, device/huawei/barca/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := barca
PRODUCT_NAME := lineage_barca
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Nova 2 Plus
PRODUCT_MANUFACTURER := Huawei

PRODUCT_GMS_CLIENTID_BASE := android-huawei
