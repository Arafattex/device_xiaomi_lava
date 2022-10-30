#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/lava

# Inherit from mt6768-common
$(call inherit-product, device/xiaomi/mt6768-common/mt6768-common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/lava/lava-vendor.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/aurisys_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/aurisys_config.xml

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlayLava

# Kernel
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/dtb.img:dtb.img

# NFC stack (AOSP)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_galahad/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_galahad/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_galahad/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_galahad/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_galahad/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_galahad/com.android.nfc_extras.xml

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    NfcNci \
    Tag

# SKU-specific properties
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sku_props/build_ss_vendor.prop:$(TARGET_COPY_OUT_VENDOR)/build_ss_vendor.prop \
    $(DEVICE_PATH)/configs/sku_props/build_dsds_vendor.prop:$(TARGET_COPY_OUT_VENDOR)/build_dsds_vendor.prop

# FM Radio
#PRODUCT_PACKAGES += \
#    MtkFMRadio


# Maintainer Overlays
# DEVICE_PACKAGE_OVERLAYS += \
#     $(LOCAL_PATH)/overlay

# Gcam Go
PRODUCT_PACKAGES += \
    GCamGOPrebuilt-V3
