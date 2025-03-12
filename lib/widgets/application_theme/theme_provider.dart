import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/hive_keys.dart';
import '../../data/hive_storage.dart';

final themeProvider = StateProvider<bool>(
    (ref) => HiveStorage.get(HiveKeys.isDark)); // القيمة الافتراضية: Dark

ThemeMode getThemeMode(bool isDark) =>
    isDark ? ThemeMode.dark : ThemeMode.light;
