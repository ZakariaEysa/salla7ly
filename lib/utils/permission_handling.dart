import 'package:permission_handler/permission_handler.dart';

import 'app_logs.dart';

class PermissionHandling {
  PermissionHandling();
  
  
  Future<void> requestGalleryPermission() async {
  final status = await Permission.photos.request(); // iOS
  // لو Android  Permission.storage
  // final status = await Permission.storage.request();

  if (status.isGranted) {
     AppLogs.debugLog('تم منح الإذن للوصول إلى صور');
  } else if (status.isDenied) {
     AppLogs.debugLog('تم رفض الإذن، تقدر تطلبه تاني ');
  } else if (status.isPermanentlyDenied) {
     AppLogs.debugLog('تم رفض الإذن بشكل دائم، افتح الإعدادات يدويًا');
    await openAppSettings();
  }
}

  
  }