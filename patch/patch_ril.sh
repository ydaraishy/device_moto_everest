#!/bin/sh

PATCH_ROOT=`dirname $0`
DEVICE_ROOT=$PATCH_ROOT/..
SRC_ROOT=$PATCH_ROOT/../../../..

MANUFACTURER=moto
DEVICE=everest

VENDOR_DIR=$SRC_ROOT/vendor/$MANUFACTURER/$DEVICE
FEATURE=ril
FEATURE_PKG=$SRC_ROOT/${DEVICE}_feature_${FEATURE}.zip

FILESET=" \
  system/lib/libmoto_ril.so \
  system/lib/libpppd_plugin-ril.so \
  system/bin/chat-ril \
  system/bin/pppd-ril \
  etc/ppp/peers/pppd-ril.options \
  system/etc/ppp/peers/pppd-ril.options \
"

OPTS="-Ns -r -"
if [ "x$1" = "x-d" ];
then
   OPTS="-N"
fi


patch $OPTS $PATCH_ROOT/../../../../frameworks/opt/telephony/src/java/com/android/internal/telephony/gsm/GsmDataConnectionTracker.java  $PATCH_ROOT/GsmDataConnectionTracker.p

#patch $OPTS $PATCH_ROOT/../../../../frameworks/opt/telephony/src/java/com/android/internal/telephony/gsm/GsmServiceStateTracker.java  $PATCH_ROOT/GsmServiceStateTracker.p 

patch $OPTS $PATCH_ROOT/../../../../hardware/ril/include/telephony/ril.h $PATCH_ROOT/ril.h.p

if [ ! -e $FEATURE_PKG ]; 
then
   echo "*** error: ${DEVICE}_feature_${FEATURE} missing and requested by "
   echo "***        default patch spec; either remove from default patch or"
   echo "***        provide the package (see $DEVICE_ROOT/README)"
   exit 1;
fi;

mkdir -p $VENDOR_DIR/proprietary

for file in $FILESET; 
do
  unzip -q -j -o $FEATURE_PKG $file -d $VENDOR_DIR/proprietary;
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g > $VENDOR_DIR/feature-${FEATURE}.mk
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libmoto_ril.so:system/lib/libmoto_ril.so \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pppd-ril.options:system/etc/ppp/peers/pppd-ril.options \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pppd-ril.options:etc/ppp/peers/pppd-ril.options \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/libpppd_plugin-ril.so:system/lib/libpppd_plugin-ril.so \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/chat-ril:system/bin/chat-ril \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/pppd-ril:system/bin/pppd-ril

ADDITIONAL_BUILD_PROPERTIES += \\
    persist.ril.features=0x34 \
    persist.ril.modem.mode=2 \
    persist.ril.modem.ttydevice=/dev/ttyUSB4 \
    persist.ril.mux.noofchannels=8 \
    persist.ril.mux.ttydevice=/dev/ttyUSB2 \
    persist.ril.tcmd.ttydevice=/dev/ttyUSB3 \
    ril.restart.counter=1 \
    rild.libpath=/system/lib/libmoto_ril.so \
    ro.telephony.default_network=0
EOF

if [ -e $VENDOR_DIR/$DEVICE-vendor.mk ];
then
   echo "\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/feature-__FEATURE__.mk)" | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g >> $VENDOR_DIR/$DEVICE-vendor.mk

   exit 0;
fi;

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g > $VENDOR_DIR/$DEVICE-vendor.mk
\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/feature-__FEATURE__.mk)
EOF
