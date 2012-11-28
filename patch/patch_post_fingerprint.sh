#!/bin/sh

PATCH_ROOT=`dirname $0`
BUILD_PROP=$PATCH_ROOT/../../../../out/target/product/everest/system/build.prop

MASQUERADING_AS="tervigon"

if [ "$MASQUERADING_AS" = "tervigon" ]; 
then
  RO_PRODUCT_MODEL="Xoom"
  RO_PRODUCT_BRAND="motorola"
  RO_PRODUCT_NAME="tervigon"
  RO_PRODUCT_DEVICE="wingray"
  RO_PRODUCT_MANUFACTURER="Motorola"
  RO_BUILD_PRODUCT="wingray"
  RO_BUILD_DESCRIPTION="tervigon-user 4.1.2 JZO54K 485486 release-keys"
  RO_BUILD_FINGERPRINT="motorola\/tervigon\/wingray:4.1.2\/JZO54K\/485486:user\/release-keys"

  sed -i -e "s/ro.product.model=.*/ro.product.model=$RO_PRODUCT_MODEL/g" $BUILD_PROP
  sed -i -e "s/ro.product.brand=.*/ro.product.brand=$RO_PRODUCT_BRAND/g" $BUILD_PROP
  sed -i -e "s/ro.product.name=.*/ro.product.name=$RO_PRODUCT_NAME/g" $BUILD_PROP
  sed -i -e "s/ro.product.device=.*/ro.product.device=$RO_PRODUCT_DEVICE/g" $BUILD_PROP
  sed -i -e "s/ro.product.manufacturer=.*/ro.product.manufacturer=$RO_PRODUCT_MANUFACTURER/g" $BUILD_PROP
  sed -i -e "s/ro.build.product=.*/ro.build.product=$RO_BUILD_PRODUCT/g" $BUILD_PROP
  sed -i -e "s/ro.build.description=.*/ro.build.description=$RO_BUILD_DESCRIPTION/g" $BUILD_PROP
  sed -i -e "s/ro.build.fingerprint=.*/ro.build.fingerprint=$RO_BUILD_FINGERPRINT/g" $BUILD_PROP
elif [ "$MASQUERADING_AS" = "umts_everest" ];
then
  RO_PRODUCT_DEVICE="umts_everest"
  RO_PRODUCT_NAME="RTCOREEU"
  RO_BUILD_DESCRIPTION="umts_everest-user 3.2 H.6.5-17-3 1321319666 ota-rel-keys,release-keys"
  RO_BUILD_FINGERPRINT="MOTO\/RTCOREEU\/umts_everest:3.2\/H.6.5-17-3\/1321319666:user\/ota-rel-keys,release-keys"

  sed -i -e "s/ro.product.device=.*/ro.product.device=$RO_PRODUCT_DEVICE/g" $BUILD_PROP
  sed -i -e "s/ro.product.name=.*/ro.product.name=$RO_PRODUCT_NAME/g" $BUILD_PROP
  sed -i -e "s/ro.build.description=.*/ro.build.description=$RO_BUILD_DESCRIPTION/g" $BUILD_PROP
  sed -i -e "s/ro.build.fingerprint=.*/ro.build.fingerprint=$RO_BUILD_FINGERPRINT/g" $BUILD_PROP
else
  exit
fi;


(cd $PATCH_ROOT/../../../../; make)
