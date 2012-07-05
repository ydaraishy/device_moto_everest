#!/bin/sh

BROADCOM_DRIVER=broadcom-wingray-imm76d-ba230f0a.tgz
NVIDIA_DRIVER=nvidia-wingray-imm76d-f793a3bf.tgz

wget https://dl.google.com/dl/android/aosp/$BROADCOM_DRIVER
wget https://dl.google.com/dl/android/aosp/$NVIDIA_DRIVER

tar xzf $BROADCOM_DRIVER
tar xzf $NVIDIA_DRIVER

mv extract-broadcom-wingray.sh ../../../
mv extract-nvidia-wingray.sh ../../../

rm $BROADCOM_DRIVER
rm $NVIDIA_DRIVER

