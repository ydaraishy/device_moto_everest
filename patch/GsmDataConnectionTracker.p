--- telephony_java_com_android_internal_telephony_gsm_GsmDataConnectionTracker.java	Fri Jan 20 09:34:33 2012
+++ frameworks/base/telephony/java/com/android/internal/telephony/gsm/GsmDataConnectionTracker.java	Fri Jan 20 09:30:14 2012
@@ -579,6 +579,10 @@
         stopNetStatPoll();
         stopDataStallAlarm();
         notifyDataConnection(Phone.REASON_DATA_DETACHED);
+
+        // XXX: everest seems to not work unless the connection is torn down
+        if (DBG) log ("onDataConnectionDetached: everest: cleanup/teardown");
+        cleanUpAllConnections(true, "everest");
     }
 
     private void onDataConnectionAttached() {
@@ -1195,7 +1199,7 @@
                     // Its active so update the DataConnections link properties
                     UpdateLinkPropertyResult result =
                         dcac.updateLinkPropertiesDataCallStateSync(newState);
-                    if (result.oldLp.equals(result.newLp)) {
+                    if (newState.active == 2 || result.oldLp.equals(result.newLp)) {
                         if (DBG) log("onDataStateChanged(ar): no change");
                     } else {
                         if (result.oldLp.isIdenticalInterfaceName(result.newLp)) {
