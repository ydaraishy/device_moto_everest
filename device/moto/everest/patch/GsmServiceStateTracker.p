--- telephony_java_com_android_internal_telephony_gsm_GsmServiceStateTracker.java	Fri Jan 20 09:34:33 2012
+++ frameworks/base/telephony/java/com/android/internal/telephony/gsm/GsmServiceStateTracker.java	Fri Jan 20 09:31:32 2012
@@ -1036,11 +1036,12 @@
             // bug 658816 seems to be a case where the result is 0-length
             if (ints.length != 0) {
                 rssi = ints[0];
-                lteSignalStrength = ints[7];
-                lteRsrp = ints[8];
-                lteRsrq = ints[9];
-                lteRssnr = ints[10];
-                lteCqi = ints[11];
+                // XXX: this needs to be fixed in RIL.java, not here.
+                lteSignalStrength = ints[7] == 0 ? -1 : ints[7];
+                lteRsrp = ints[8] == 0 ? -1 : ints[8];
+                lteRsrq = ints[9] == 0 ? -1 : ints[9];
+                lteRssnr = ints[10] == 0 ? -1 : ints[10];
+                lteCqi = ints[11] == 0 ? -1 : ints[11];
             } else {
                 loge("Bogus signal strength response");
                 rssi = 99;
@@ -1049,7 +1050,6 @@
 
         mSignalStrength = new SignalStrength(rssi, -1, -1, -1,
                 -1, -1, -1, lteSignalStrength, lteRsrp, lteRsrq, lteRssnr, lteCqi, true);
-
         if (!mSignalStrength.equals(oldSignalStrength)) {
             try { // This takes care of delayed EVENT_POLL_SIGNAL_STRENGTH (scheduled after
                   // POLL_PERIOD_MILLIS) during Radio Technology Change)
