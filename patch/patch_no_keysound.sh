#!/bin/sh

PATCH_ROOT=`dirname $0`

mkdir -p $PATCH_ROOT/../overlay/packages/inputmethods/LatinIME/java/res/values/
mkdir -p $PATCH_ROOT/../overlay/packages/inputmethods/LatinIME/java/res/values-sw600dp/
mkdir -p $PATCH_ROOT/../overlay/packages/inputmethods/LatinIME/java/res/values-sw768dp/
cp $PATCH_ROOT/packages_inputmethods_LatinIME_java_res_values_config.xml $PATCH_ROOT/../overlay/packages/inputmethods/LatinIME/java/res/values/config.xml
cp $PATCH_ROOT/packages_inputmethods_LatinIME_java_res_values_config.xml $PATCH_ROOT/../overlay/packages/inputmethods/LatinIME/java/res/values-sw600dp/config.xml
cp $PATCH_ROOT/packages_inputmethods_LatinIME_java_res_values_config.xml $PATCH_ROOT/../overlay/packages/inputmethods/LatinIME/java/res/values-sw768dp/config.xml
