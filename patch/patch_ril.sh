#!/bin/sh

PATCH_ROOT=`dirname $0`

OPTS="-Ns -r -"
if [ "x$1" = "x-d" ];
then
   OPTS="-N"
fi

patch $OPTS $PATCH_ROOT/../../../../frameworks/base/telephony/java/com/android/internal/telephony/gsm/GsmDataConnectionTracker.java  $PATCH_ROOT/GsmDataConnectionTracker.p

patch $OPTS $PATCH_ROOT/../../../../frameworks/base/telephony/java/com/android/internal/telephony/gsm/GsmServiceStateTracker.java  $PATCH_ROOT/GsmServiceStateTracker.p 
