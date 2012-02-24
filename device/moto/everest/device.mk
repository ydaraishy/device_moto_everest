#
# Copyright (C) 2010 The Android Open Source Project
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

$(call inherit-product, device/moto/wingray/device_base.mk)

PRODUCT_COPY_FILES += \
    device/moto/everest/init.stingray.rc:root/init.stingray.rc 

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

# Overrides
DEVICE_PACKAGE_OVERLAYS := \
    device/moto/everest/overlay device/moto/wingray/overlay
