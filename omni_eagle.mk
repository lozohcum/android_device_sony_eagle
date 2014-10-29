# Copyright (C) 2014 The CyanogenMod Project
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

# Screen resoultion in Pixels.
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Inherit from eagle device
$(call inherit-product, device/sony/eagle/eagle.mk)

# Build fingerprints
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D2303 BUILD_FINGERPRINT=Sony/D2303/D2303:4.4.2/18.3.C.0.37/2n9_bg:user/release-keys PRIVATE_BUILD_DESC="D2303-user 4.4.2 18.3.C.0.37 2n9_bg release-keys"

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := omni_eagle
PRODUCT_DEVICE := eagle
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia M2 LTE
