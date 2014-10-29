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


$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/sony/eagle/eagle-vendor.mk)
$(call inherit-product, device/sony/qcom-common/qcom-common.mk)

COMMON_PATH := device/sony/eagle

DEVICE_PACKAGE_OVERLAYS += device/sony/eagle/overlay

BOARD_HAVE_RADIO := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Init 2.0
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/init.sony.rc:root/init.sony.rc \
    $(COMMON_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc \
    $(COMMON_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.class_main.sh:root/init.class_main.sh \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# Keys and Touchscreens
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# Touchpad
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    $(COMMON_PATH)/rootdir/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc

# Thermal
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/bootrec-device:recovery/bootrec-device

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# Custom dtb tool
PRODUCT_PACKAGES += \
    dtbToolM2

# Sbin
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/sbin/wait4tad_static:root/sbin/wait4tad_static \
    $(COMMON_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static

PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    libnl_2 \
    libtinyxml

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8226 \
    audio_policy.msm8226 \
    audio.primary.msm8226 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8226 \
    gralloc.msm8226 \
    copybit.msm8226 \
    libqdMetaData \
    memtrack.msm8226

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# FM Radio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(COMMON_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(COMMON_PATH)/gps/sap.conf:system/etc/sap.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/msap.conf:system/etc/msap.conf \
    $(COMMON_PATH)/rootdir/system/etc/sec_config:system/etc/sec_config

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# NFC packages
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras

# NFCEE access control
NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(COMMON_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(COMMON_PATH)/rootdir/system/etc/nfc-nci.conf:system/etc/nfc-nci.conf

# Media recording
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \

# Sensors
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# System Monitor (Thermal Control)
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/sysmon.cfg:system/etc/sysmon.cfg

# USB
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# WiFi
PRODUCT_PACKAGES += \
    mac-update \
    wcnss_service

PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2 \
    FMRecord

PRODUCT_PACKAGES += qcmediaplayer

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# USB Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1 \
    ro.adb.secure=0 \
    ro.debuggable=1 \

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0 \
    persist.fuse_sdcard=true \
    ro.cwm.enable_key_repeat=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.qualcomm.bt.hci_transport=smd \
    debug.composition.type=dyn

PRODUCT_PROPERTY_OVERRIDES += \
    qcom.audio.init=complete \
    af.resampler.quality=255 \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=analog \
    persist.audio.lowlatency.rec=false \
    media.aac_51_output_enabled=true \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=none \
    lpa.decode=true \
    audio.gapless.playback.disable=true

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5 \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1

ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-radio
    $(call inherit-product, $(COMMON_PATH)/radio.mk)
endif

# SIM Props
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

