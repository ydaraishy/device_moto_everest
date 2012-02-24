#!/bin/sh

wget https://dl.google.com/dl/android/aosp/broadcom-wingray-iml74k-2c8a74c6.tgz
wget https://dl.google.com/dl/android/aosp/nvidia-wingray-iml74k-e5226417.tgz

tar xzf broadcom-wingray-iml74k-2c8a74c6.tgz
tar xzf nvidia-wingray-iml74k-e5226417.tgz

mv extract-broadcom-wingray.sh ../../../
mv extract-nvidia-wingray.sh ../../../

rm broadcom-wingray-iml74k-2c8a74c6.tgz
rm nvidia-wingray-iml74k-e5226417.tgz
