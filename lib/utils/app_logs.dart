import 'package:flutter/foundation.dart';

class AppLogs {
  //*info
  static void infoLog(String message, [String tag = 'Info']) {
    if (kDebugMode) {
      print('$tag 📣📣: $message');
    }
  }

  //*error
  static void errorLog(String message, [String tag = 'Error']) {
    if (kDebugMode) {
      print('$tag ❌❌: $message');
    }
  }

  //*Success
  static void successLog(String message, [String tag = 'Success']) {
    if (kDebugMode) {
      print('$tag✅✅: $message');
    }
  }

  //*debug
  static void debugLog(String message, [String tag = 'Debug']) {
    if (kDebugMode) {
      print('$tag 🐛🐛: $message');
    }
  }
}
