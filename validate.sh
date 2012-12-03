SRC_ROOT=`dirname $0`/../../..
OUT_ROOT=$SRC_ROOT/out/target/product/everest

MANDATORY_FILESET="
   device/moto/everest/init.stingray.rc:root/init.stingray.rc \
   device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml \
   vendor/nvidia/wingray/proprietary/nvmm_aacdec.axf:system/etc/firmware/nvmm_aacdec.axf \
   vendor/nvidia/wingray/proprietary/nvddk_audiofx_core.axf:system/etc/firmware/nvddk_audiofx_core.axf \
   vendor/nvidia/wingray/proprietary/nvddk_audiofx_transport.axf:system/etc/firmware/nvddk_audiofx_transport.axf \
   vendor/nvidia/wingray/proprietary/nvmm_adtsdec.axf:system/etc/firmware/nvmm_adtsdec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_audiomixer.axf:system/etc/firmware/nvmm_audiomixer.axf \
   vendor/nvidia/wingray/proprietary/nvmm_h264dec.axf:system/etc/firmware/nvmm_h264dec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_jpegdec.axf:system/etc/firmware/nvmm_jpegdec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_jpegenc.axf:system/etc/firmware/nvmm_jpegenc.axf \
   vendor/nvidia/wingray/proprietary/nvmm_manager.axf:system/etc/firmware/nvmm_manager.axf \
   vendor/nvidia/wingray/proprietary/nvmm_mp2dec.axf:system/etc/firmware/nvmm_mp2dec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_mp3dec.axf:system/etc/firmware/nvmm_mp3dec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_mpeg4dec.axf:system/etc/firmware/nvmm_mpeg4dec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_reference.axf:system/etc/firmware/nvmm_reference.axf \
   vendor/nvidia/wingray/proprietary/nvmm_service.axf:system/etc/firmware/nvmm_service.axf \
   vendor/nvidia/wingray/proprietary/nvmm_sorensondec.axf:system/etc/firmware/nvmm_sorensondec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_sw_mp3dec.axf:system/etc/firmware/nvmm_sw_mp3dec.axf \
   vendor/nvidia/wingray/proprietary/nvmm_wavdec.axf:system/etc/firmware/nvmm_wavdec.axf \
   vendor/nvidia/wingray/proprietary/nvrm_avp.bin:system/etc/firmware/nvrm_avp.bin \
   vendor/nvidia/wingray/proprietary/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
   vendor/nvidia/wingray/proprietary/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
   vendor/nvidia/wingray/proprietary/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
   vendor/nvidia/wingray/proprietary/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \
   vendor/nvidia/wingray/proprietary/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra.so \
   vendor/nvidia/wingray/proprietary/libcgdrv.so:system/lib/libcgdrv.so \
   vendor/nvidia/wingray/proprietary/libnvddk_2d.so:system/lib/libnvddk_2d.so \
   vendor/nvidia/wingray/proprietary/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
   vendor/nvidia/wingray/proprietary/libnvddk_audiofx.so:system/lib/libnvddk_audiofx.so \
   vendor/nvidia/wingray/proprietary/libnvdispatch_helper.so:system/lib/libnvdispatch_helper.so \
   vendor/nvidia/wingray/proprietary/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \
   vendor/nvidia/wingray/proprietary/libnvmm.so:system/lib/libnvmm.so \
   vendor/nvidia/wingray/proprietary/libnvmm_camera.so:system/lib/libnvmm_camera.so \
   vendor/nvidia/wingray/proprietary/libnvmm_contentpipe.so:system/lib/libnvmm_contentpipe.so \
   vendor/nvidia/wingray/proprietary/libnvmm_image.so:system/lib/libnvmm_image.so \
   vendor/nvidia/wingray/proprietary/libnvmm_manager.so:system/lib/libnvmm_manager.so \
   vendor/nvidia/wingray/proprietary/libnvmm_service.so:system/lib/libnvmm_service.so \
   vendor/nvidia/wingray/proprietary/libnvmm_tracklist.so:system/lib/libnvmm_tracklist.so \
   vendor/nvidia/wingray/proprietary/libnvmm_utils.so:system/lib/libnvmm_utils.so \
   vendor/nvidia/wingray/proprietary/libnvmm_video.so:system/lib/libnvmm_video.so \
   vendor/nvidia/wingray/proprietary/libnvomx.so:system/lib/libnvomx.so \
   vendor/nvidia/wingray/proprietary/libnvomxilclient.so:system/lib/libnvomxilclient.so \
   vendor/nvidia/wingray/proprietary/libnvos.so:system/lib/libnvos.so \
   vendor/nvidia/wingray/proprietary/libnvrm.so:system/lib/libnvrm.so \
   vendor/nvidia/wingray/proprietary/libnvrm_channel.so:system/lib/libnvrm_channel.so \
   vendor/nvidia/wingray/proprietary/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
   vendor/nvidia/wingray/proprietary/libnvsm.so:system/lib/libnvsm.so \
   vendor/nvidia/wingray/proprietary/libnvwsi.so:system/lib/libnvwsi.so \
   vendor/nvidia/wingray/proprietary/libstagefrighthw.so:system/lib/libstagefrighthw.so \
   vendor/broadcom/wingray/proprietary/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
   vendor/broadcom/wingray/proprietary/bcm4329.cal:system/etc/wifi/bcm4329.cal \
   vendor/broadcom/wingray/proprietary/fw_bcm4329_mfg.bin:system/vendor/firmware/fw_bcm4329_mfg.bin \
"
OPTIONAL_FILESET="
   vendor/moto/everest/proprietary/libmoto_ril.so:system/lib/libmoto_ril.so \
   vendor/moto/everest/proprietary/pppd-ril.options:system/etc/ppp/peers/pppd-ril.options \
   vendor/moto/everest/proprietary/pppd-ril.options:etc/ppp/peers/pppd-ril.options \
   vendor/moto/everest/proprietary/libpppd_plugin-ril.so:system/lib/libpppd_plugin-ril.so \
   vendor/moto/everest/proprietary/chat-ril:system/bin/chat-ril \
   vendor/moto/everest/proprietary/pppd-ril:system/bin/pppd-ril \
   vendor/moto/everest/proprietary/akmd2:system/bin/akmd2 \
   vendor/moto/everest/proprietary/location:system/bin/location \
   vendor/moto/everest/proprietary/brcm_guci_drv:system/bin/brcm_guci_drv \
   vendor/moto/everest/proprietary/gps.conf:system/etc/gps.conf \
   vendor/moto/everest/proprietary/gpsconfig.xml:system/etc/gpsconfig.xml \
   vendor/moto/everest/proprietary/location.cfg:system/etc/location.cfg \
   vendor/moto/everest/proprietary/gps.stingray.so:system/lib/hw/gps.stingray.so \
   vendor/moto/everest/proprietary/camera.stingray.so:system/lib/hw/camera.stingray.so \
   vendor/moto/everest/proprietary/bootanimation.zip:system/media/bootanimation.zip \
   vendor/moto/everest/proprietary/bootanimation-encrypted.zip:system/media/bootanimation-encrypted.zip \
"

#   vendor/moto/everest/proprietary/libnvodm_imager.so:system/lib/libnvodm_imager.so \
#   vendor/moto/everest/proprietary/libnvodm_query.so:system/lib/libnvodm_query.so

GREP_SET="
  ro.secure=0:root/default.prop \
  ro.opengles.version=131072:system/build.prop \
  rild.libpath=/system/lib/libmoto_ril.so:system/build.prop \
  persist.ril.features=0x34:system/build.prop \
  persist.ril.modem.mode=2:system/build.prop \
  persist.ril.modem.ttydevice=/dev/ttyUSB4:system/build.prop \
  persist.ril.mux.noofchannels=8:system/build.prop \
  persist.ril.mux.ttydevice=/dev/ttyUSB2:system/build.prop \
  persist.ril.tcmd.ttydevice=/dev/ttyUSB3:system/build.prop \
  ril.restart.counter=1:system/build.prop \
  rild.libpath=/system/lib/libmoto_ril.so:system/build.prop \
  ro.telephony.default_network=0:system/build.prop \
"


ERRORS=0

for pair in $MANDATORY_FILESET;
do
   src=$SRC_ROOT/`echo $pair | cut -d':' -f1`;
   dst=$OUT_ROOT/`echo $pair | cut -d':' -f2`;

   if [ ! -e $src ];
   then
      echo "*** error: $src does not exist"
      ERRORS=`expr $ERRORS + 1`
      continue;
   fi

   if [ ! -e $dst ];
   then
      echo "*** error: $dst does not exist"
      ERRORS=`expr $ERRORS + 1`
      continue
   fi

   md5_src=`md5sum $src | cut -d' ' -f1`
   md5_dst=`md5sum $dst | cut -d' ' -f1`

   if [ "$md5_src" != "$md5_dst" ];
   then
      echo "*** error: file mismatch for $src -> $dst ($md5_src != $md5_dst)"
      ERRORS=`expr $ERRORS + 1`
   fi
done

for pair in $OPTIONAL_FILESET;
do
   src=$SRC_ROOT/`echo $pair | cut -d':' -f1`;
   dst=$OUT_ROOT/`echo $pair | cut -d':' -f2`;

   if [ ! -e $src ];
   then
      echo "warning: optional file $src missing, continuing..."
      continue;
   fi

   if [ ! -e $dst ];
   then
      echo "warning: optional file $dst missing, continuing..."
      continue
   fi

   md5_src=`md5sum $src | cut -d' ' -f1`
   md5_dst=`md5sum $dst | cut -d' ' -f1`

   if [ "$md5_src" != "$md5_dst" ];
   then
      echo "*** error: file mismatch for $src -> $dst ($md5_src != $md5_dst)"
      ERRORS=`expr $ERRORS + 1`
   fi
done

for pair in $GREP_SET;
do
   pat=`echo $pair | cut -d':' -f1`;
   file=$OUT_ROOT/`echo $pair | cut -d':' -f2`;

   grep -q "$pat" $file
   if [ $? -ne 0 ];
   then
      echo "*** error: string '$pat' not found in file $file\n";
      ERRORS=`expr $ERRORS + 1`
   fi
done

if [ $ERRORS -ne 0 ];
then
   echo "*** summary: $ERRORS error(s) found."
else
   echo "*** No errors found. Validation successful."
fi
