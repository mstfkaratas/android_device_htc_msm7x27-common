# Copyright (C) 2011 The CyanogenMod Project
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

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x27-common/include

# Make sure this folder exists so display stuff doesn't fail
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)

# inherit from common msm7x27 Recovery
-include device/htc/msm7x27-recovery/BoardConfigCommon.mk

### Board config
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6-vfp

TARGET_PROVIDES_LIBLIGHT := true

### Kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm7227
TARGET_KERNEL_CONFIG := cyanogen_msm7227_defconfig

### USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext

#WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcm4329/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG

### Graphics
# Option for choosing texture target on old adrenos
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/htc/msm7x27-common/egl.cfg
BOARD_EGL_NEEDS_LEGACY_FB := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE -DQCOM_NO_SECURE_PLAYBACK
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := false
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true
TARGET_NO_HW_VSYNC := true

# Some pixel formats aren't supported. Commit used with this flag: http://goo.gl/DjwVN
COMMON_GLOBAL_CFLAGS += -DQCOM_MISSING_PIXEL_FORMATS

# display-legacy from Arco
TARGET_QCOM_DISPLAY_VARIANT := legacy

### Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
#BOARD_USES_LEGACY_CAMERA := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

### Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/msm7x27-common/bluetooth/btvendor_7x27.txt

### FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

### OMX
# From http://forum.xda-developers.com/showthread.php?t=1960117
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX

### Boot animation
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

### QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true

BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

### RIL
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true

### Dalvik
# If WITH_JIT is configured, build multiple versions of libdvm.so to facilitate
# correctness/performance bugs triage
WITH_JIT := true

### Webkit
TARGET_FORCE_CPU_UPLOAD := true

### Browser
JS_ENGINE := v8
HTTP := chrome
ENABLE_JSC_JIT := true
ENABLE_WEBGL := true

### OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/samsung/msm7x27-common/releasetools-extras.txt
