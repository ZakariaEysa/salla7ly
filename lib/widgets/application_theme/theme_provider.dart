import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/hive_keys.dart';
import '../../data/hive_storage.dart';

final themeProvider = StateProvider<bool>((ref) {
  final isDark = HiveStorage.get(HiveKeys.isDark);
  if (isDark == null) {
    final platformBrightness =
        WidgetsBinding.instance.window.platformBrightness;
    final systemIsDark = platformBrightness == Brightness.dark;

    HiveStorage.set(HiveKeys.isDark, systemIsDark);
    return systemIsDark;
  }
  return isDark as bool;
});

// دالة لتحديد الـ ThemeMode بناءً على القيمة
ThemeMode getThemeMode(bool isDark) =>
    isDark ? ThemeMode.dark : ThemeMode.light;
