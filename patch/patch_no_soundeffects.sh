#!/bin/sh

PATCH_ROOT=`dirname $0`

mkdir -p $PATCH_ROOT/../overlay/frameworks/base/packages/SettingsProvider/res/values/
cp $PATCH_ROOT/frameworks_base_packages_SettingsProvider_res_values_defaults.xml $PATCH_ROOT/../overlay/frameworks/base/packages/SettingsProvider/res/values/defaults.xml
