#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/huawei/barca

# Inherit from hi6250-8-common
include device/huawei/hi6250-8-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 460

# Partitions
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3498049536  # mmcblk0p54 (3416064*1024)

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit the proprietary files
include vendor/huawei/barca/BoardConfigVendor.mk
