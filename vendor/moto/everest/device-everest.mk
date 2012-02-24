# Copyright (C) 2011 The Android Open Source Project
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

LOCAL_PATH := vendor/moto/everest

# Non-specific motorola blobs necessary for everest hardware
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/proprietary/bootanimation.zip:system/media/bootanimation.zip \
    $(LOCAL_PATH)/proprietary/bootanimation-encrypted.zip:system/media/bootanimation-encrypted.zip \
    $(LOCAL_PATH)/proprietary/akmd2:system/bin/akmd2 \
    $(LOCAL_PATH)/proprietary/location:system/bin/location \
    $(LOCAL_PATH)/proprietary/brcm_guci_drv:system/bin/brcm_guci_drv \
    $(LOCAL_PATH)/proprietary/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/proprietary/gpsconfig.xml:system/etc/gpsconfig.xml \
    $(LOCAL_PATH)/proprietary/location.cfg:system/etc/location.cfg \
    $(LOCAL_PATH)/proprietary/gps.stingray.so:system/lib/hw/gps.stingray.so \
    $(LOCAL_PATH)/proprietary/camera.stingray.so:system/lib/hw/camera.stingray.so \
    $(LOCAL_PATH)/proprietary/libnvodm_imager.so:system/lib/libnvodm_imager.so \
    $(LOCAL_PATH)/proprietary/libnvodm_query.so:system/lib/libnvodm_query.so \
    $(LOCAL_PATH)/proprietary/libmoto_ril.so:system/lib/libmoto_ril.so \
    $(LOCAL_PATH)/proprietary/pppd-ril.options:system/etc/ppp/peers/pppd-ril.options \
    $(LOCAL_PATH)/proprietary/pppd-ril.options:etc/ppp/peers/pppd-ril.options \
    $(LOCAL_PATH)/proprietary/libpppd_plugin-ril.so:system/lib/libpppd_plugin-ril.so \
    $(LOCAL_PATH)/proprietary/chat-ril:system/bin/chat-ril \
    $(LOCAL_PATH)/proprietary/pppd-ril:system/bin/pppd-ril

DEVICE_PACKAGE_OVERLAYS := \
    device/moto/everest/overlay device/moto/wingray/overlay vendor/moto/everest/overlay

