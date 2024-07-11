#
# Copyright (C) 2021 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# The system image of gsi_arm64-userdebug is the GSI for devices with:
# - ARM 64-bit userspace
# - 64-bit binder interface
# - system-as-root
# - VNDK enforcement
# - compatible property override enabled

#
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

DEVICE_PATH := device/SG/sgphone

# Enable mainline checking
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := true

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(DEVICE_PATH)/gsi_system_ext.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, device/generic/common/gsi_product.mk)

#
# Special settings for GSI releasing
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)



#product overlay
#PRODUCT_PACKAGES += \
Gallery2 \
Launcher3QuickStepGo \
SysuiGoConfigOverlay \
WallpaperOverlay \
framework-res_navbar_rro


PRODUCT_DEVICE := sgphone
PRODUCT_NAME := gsi_sgphone
PRODUCT_BRAND := SG
PRODUCT_MODEL := sgphone
PRODUCT_MANUFACTURER := SG

PRODUCT_GMS_CLIENTID_BASE := android-sgphone

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sgphone_Natv-userdebug 13 TP1A.220624.014 20231108-114636 test-keys"

BUILD_FINGERPRINT := SG/sgphone_Natv/sgphone:13/TP1A.220624.014/20231108-114636:userdebug/test-keys
