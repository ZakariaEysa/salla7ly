import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/hive_keys.dart';
import '../../data/hive_storage.dart';

// Provider للتحكم في الـ Theme Mode مع قيمة افتراضية
final themeProvider = StateProvider<bool>((ref) {
  // جلب القيمة من Hive، ولو غير موجودة، ضبطها على true (Dark) كقيمة افتراضية
  final isDark = HiveStorage.get(HiveKeys.isDark);
  if (isDark == null) {
    HiveStorage.set(HiveKeys.isDark, true); // القيمة الافتراضية هي Dark
    return true;
  }
  return isDark as bool; // تحويل القيمة لـ bool
});

// دالة لتحديد الـ ThemeMode بناءً على القيمة
ThemeMode getThemeMode(bool isDark) =>
    isDark ? ThemeMode.dark : ThemeMode.light;
