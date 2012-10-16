#!/bin/sh

SRC_ROOT=`dirname $0`/../../..

BROADCOM_DRIVER=broadcom-wingray-jzo54k-78dd7c25.tgz
NVIDIA_DRIVER=nvidia-wingray-jzo54k-3b2982d4.tgz

wget https://dl.google.com/dl/android/aosp/$BROADCOM_DRIVER
wget https://dl.google.com/dl/android/aosp/$NVIDIA_DRIVER

tar xzf $BROADCOM_DRIVER
tar xzf $NVIDIA_DRIVER

mv extract-broadcom-wingray.sh $SRC_ROOT
mv extract-nvidia-wingray.sh $SRC_ROOT

rm $BROADCOM_DRIVER
rm $NVIDIA_DRIVER

