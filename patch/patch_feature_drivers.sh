#!/bin/sh

PATCH_ROOT=`dirname $0`
DEVICE_ROOT=$PATCH_ROOT/..
SRC_ROOT=$PATCH_ROOT/../../../..

MANUFACTURER=moto
DEVICE=everest

VENDOR_DIR=$SRC_ROOT/vendor/$MANUFACTURER/$DEVICE
FEATURE=drivers
FEATURE_PKG=$SRC_ROOT/${DEVICE}_feature_${FEATURE}.zip

FILESET=" \
  system/bin/akmd2 \
  system/bin/location \
  system/bin/brcm_guci_drv \
  system/etc/gps.conf \
  system/etc/gpsconfig.xml \
  system/etc/location.cfg \
  system/lib/hw/gps.stingray.so \
  system/lib/hw/camera.stingray.so \
"

if [ ! -e $FEATURE_PKG ]; 
then
  echo "*** error: proprietary binary package $FEATURE_PKG missing.";
  exit 1;
fi;

mkdir -p $VENDOR_DIR/proprietary

for file in $FILESET; 
do
  unzip -q -j -o $FEATURE_PKG $file -d $VENDOR_DIR/proprietary;
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g > $VENDOR_DIR/feature-${FEATURE}.mk
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/akmd2:system/bin/akmd2 \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/location:system/bin/location \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/brcm_guci_drv:system/bin/brcm_guci_drv \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.conf:system/etc/gps.conf \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gpsconfig.xml:system/etc/gpsconfig.xml \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/location.cfg:system/etc/location.cfg \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/gps.stingray.so:system/lib/hw/gps.stingray.so \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/camera.stingray.so:system/lib/hw/camera.stingray.so 
EOF

if [ -e $VENDOR_DIR/$DEVICE-vendor.mk ];
then
   echo "\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/feature-__FEATURE__.mk)" | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g >> $VENDOR_DIR/$DEVICE-vendor.mk

   exit 0;
fi;

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g > $VENDOR_DIR/$DEVICE-vendor.mk
\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/feature-__FEATURE__.mk)
EOF
