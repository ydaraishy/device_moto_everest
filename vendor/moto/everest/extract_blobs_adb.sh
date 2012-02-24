#!/bin/sh
adb pull /system/media/bootanimation.zip proprietary/bootanimation.zip
adb pull /system/lib/hw/gps.stingray.so proprietary/gps.stingray.so
adb pull /system/etc/gpsconfig.xml proprietary/gpsconfig.xml
adb pull /system/bin/chat-ril proprietary/chat-ril
adb pull /system/bin/location proprietary/location
adb pull /system/bin/brcm_guci_drv proprietary/brcm_guci_drv
adb pull /system/etc/ppp/peers/pppd-ril.options proprietary/pppd-ril.options
adb pull /system/etc/gps.conf proprietary/gps.conf
adb pull /system/media/bootanimation-encrypted.zip proprietary/bootanimation-encrypted.zip
adb pull /system/lib/libnvodm_query.so proprietary/libnvodm_query.so
adb pull /system/lib/libpppd_plugin-ril.so proprietary/libpppd_plugin-ril.so
adb pull /system/etc/location.cfg proprietary/location.cfg
adb pull /system/lib/libmoto_ril.so proprietary/libmoto_ril.so
adb pull /system/bin/pppd-ril proprietary/pppd-ril
adb pull /system/lib/libnvodm_imager.so proprietary/libnvodm_imager.so
adb pull /system/lib/hw/camera.stingray.so proprietary/camera.stingray.so
adb pull /system/bin/akmd2 proprietary/akmd2
