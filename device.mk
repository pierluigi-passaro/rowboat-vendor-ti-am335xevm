#
# Copyright (C) 2011 The Android Open-Source Project
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


PRODUCT_COPY_FILES := \
	device/ti/am335xevm/init.am335xevm.rc:root/init.am335xevm.rc \
	device/ti/am335xevm/init.am335xevm.usb.rc:root/init.am335xevm.usb.rc \
	device/ti/am335xevm/ueventd.am335xevm.rc:root/ueventd.am335xevm.rc \
	device/ti/am335xevm/vold.fstab:system/etc/vold.fstab \
	device/ti/am335xevm/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/am335xevm/mixer_paths.xml:system/etc/mixer_paths.xml \
	device/ti/am335xevm/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth support
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

# WLAN support
PRODUCT_COPY_FILES +=\
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Hardware Features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	device/ti/am335xevm/android.hardware.screen.xml:system/etc/permissions/android.hardware.screen.xml

PRODUCT_COPY_FILES += \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	device/ti/am335xevm/apns-full-conf.xml:system/etc/apns-conf.xml

# KeyPads
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/matrix-keypad.kl:system/usr/keylayout/matrix-keypad.kl

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false \
	persist.sys.usb.config=mtp,adb

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := \
    device/ti/am335xevm/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils \
	libsrec_jni

PRODUCT_PACKAGES += \
        audio.primary.am335xevm \
        tinycap \
        tinymix \
        tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf

PRODUCT_PACKAGES += \
	camera.omap3

# WI-Fi
PRODUCT_PACKAGES += \
	hostapd.conf \
	wifical.sh \
	TQS_D_1.7.ini \
	TQS_D_1.7_127x.ini \
	TQS_S_2.6.ini \
	crda \
        regulatory.bin \
	calibrator

PRODUCT_PROPERTY_OVERRIDES += \
	 wifi.interface=wlan0

# Bluetooth A2DP audio support
PRODUCT_PACKAGES += \
	audio.a2dp.default

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# BlueZ test tools
PRODUCT_PACKAGES += \
	hciconfig \
	hcitool

PRODUCT_PACKAGES += \
	lights.am335xevm

PRODUCT_PACKAGES += \
	sensors.am335xevm

# Accelerometer-based demo game
PRODUCT_PACKAGES += \
	Amazed

PRODUCT_PACKAGES += \
	FileManager-1.1.6

PRODUCT_PACKAGES += \
	TemperatureWidget

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/wl12xx-bluetooth/wl12xx_bt_products.mk)
$(call inherit-product-if-exists, hardware/ti/wlan/mac80211/firmware/wl12xx_wlan_fw_products.mk)
