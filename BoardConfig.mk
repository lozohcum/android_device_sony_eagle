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

# inherit from qcom-common
include device/sony/msm8226-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := D2302,D2303,D2305,D2306,eagle

TARGET_SPECIFIC_HEADER_PATH += device/sony/eagle/include

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/eagle
TARGET_KERNEL_CONFIG := eagle_lte_defconfig
TARGET_DTB_EXTRA_FLAGS := --force-v2

# Hardware Features
BOARD_HARDWARE_CLASS := device/sony/eagle/cmhw

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/eagle/bluetooth

# RIL
BOARD_HAS_RIL_LEGACY_PAP := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

#Init
TARGET_INIT_VENDOR_LIB := libinit_eagle

# NFC
BOARD_NFC_CHIPSET := pn547

#Radio
BOARD_HAVE_RADIO := true

# WiFi
WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko
TARGET_KERNEL_MODULES += WLAN_MODULES

# Partition information
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2399141888
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5112839168

# Init
TARGET_INIT_VENDOR_LIB := libinit_eagle

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/eagle/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

# Sensors
SOMC_CFG_SENSORS := true
SOMC_CFG_SENSORS_LIGHT_LM3533 := yes
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8963 := yes

# TWRP flags
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
# TW_INCLUDE_CRYPTO := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_INCLUDE_FUSE_EXFAT := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 4095
TW_NO_USB_STORAGE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/eagle
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
