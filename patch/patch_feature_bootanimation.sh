#!/bin/sh

PATCH_ROOT=`dirname $0`
DEVICE_ROOT=$PATCH_ROOT/..
SRC_ROOT=$PATCH_ROOT/../../../..

MANUFACTURER=moto
DEVICE=everest

VENDOR_DIR=$SRC_ROOT/vendor/$MANUFACTURER/$DEVICE
FEATURE=bootanimation
FEATURE_PKG=$SRC_ROOT/${DEVICE}_feature_${FEATURE}.zip

FILESET=" \
   system/media/bootanimation.zip \
   system/media/bootanimation-encrypted.zip \
"

if [ ! -e $FEATURE_PKG ]; 
then
  echo "*** error: proprietary binary package $FEATURE_PKG missing.";
  exit 1;
fi;

mkdir -p $VENDOR_DIR/proprietary

for file in $FILESET; 
do
  unzip -j -o $FEATURE_PKG $file -d $VENDOR_DIR/proprietary;
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g > $VENDOR_DIR/feature-$FEATURE.mk
PRODUCT_COPY_FILES += \\
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bootanimation.zip:system/media/bootanimation.zip \
    vendor/__MANUFACTURER__/__DEVICE__/proprietary/bootanimation-encrypted.zip:system/media/bootanimation-encrypted.zip 
EOF

if [ -e $VENDOR_DIR/$DEVICE-vendor.mk ];
then
   echo "\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/feature-__FEATURE__.mk)" | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g >> $VENDOR_DIR/$DEVICE-vendor.mk

   exit 0;
fi;

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__MANUFACTURER__/$MANUFACTURER/g | sed s/__FEATURE__/$FEATURE/g > $VENDOR_DIR/$DEVICE-vendor.mk
# This file is generated by device/__MANUFACTURER__/__DEVICE__/feature___FEATURE__.sh - DO NOT EDIT

\$(call inherit-product, vendor/__MANUFACTURER__/__DEVICE__/feature-__FEATURE__.mk)
EOF
