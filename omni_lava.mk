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

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p


# Mind the gapps /ngapps
# $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
$(call inherit-product, vendor/ngapps/gapps.mk)

# Shas
$(call inherit-product, vendor/shas/shas.mk)

# Inherit AnxCam 
$(call inherit-product, vendor/ANXCamera/config.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from lava device makefile
$(call inherit-product, device/xiaomi/lava/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := lava
PRODUCT_NAME := omni_lava
PRODUCT_BRAND := Redmi
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
TARGET_VENDOR := xiaomi
TARGET_VENDOR_PRODUCT_NAME := lancelot
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="lancelot-user 11 RP1A.200720.011 V12.0.1.0.RJCMIXM release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Redmi/lancelot_global/lancelot:11/RP1A.200720.011/V12.0.1.0.RJCMIXM:user/release-keys
