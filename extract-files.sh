#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        odm/lib64/hwcam/hwcam.hi6250.m.PRAGUE.so)
            "${PATCHELF}" --add-needed "libtinyxml2_shim.so" "${2}"
            # NOP out assertOk() and return_status()
            "${SIGSCAN}" -p "e0 83 04 91 b8 52 f5 97" -P "e0 83 04 91 1f 20 03 d5" -f "${2}"
            "${SIGSCAN}" -p "e0 83 04 91 b9 52 f5 97" -P "e0 83 04 91 1f 20 03 d5" -f "${2}"
            ;;
        vendor/etc/libnfc-brcm.conf)
            sed -i 's\/data/nfc\/data/vendor/nfc\g' "${2}"
            ;;
        vendor/etc/libnfc-nxp.conf)
            sed -i 's|libpn551_fw_10_05_03_64bits.so|libpn551_fw.so|g' "${2}"
            ;;
        vendor/etc/camera/*|odm/etc/camera/*)
            sed -i 's/gb2312/iso-8859-1/g' "${2}"
            sed -i 's/GB2312/iso-8859-1/g' "${2}"
            sed -i 's/xmlversion/xml version/g' "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=prague
export DEVICE_COMMON=hi6250-8-common
export VENDOR=huawei
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
