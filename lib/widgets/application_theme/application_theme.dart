
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_gradients.dart';
import 'theme_extention.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightButtonStart,
    scaffoldBackgroundColor: AppColors.lightBackgroundEnd,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          color: AppColors.lightTextPrimary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
      bodyMedium:
          TextStyle(color: AppColors.lightTextSecondary, fontFamily: 'Poppins'),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(foregroundColor: AppColors.lightTextPrimary),
    ),
    extensions: [
      GradientTheme(
          backgroundGradient: AppGradients.lightBackgroundGradient,
          buttonGradient: AppGradients.lightButtonGradient)
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkButtonStart,
    scaffoldBackgroundColor: AppColors.darkBackgroundEnd,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 50.sp,
          color: AppColors.darkTextSecondary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
      headlineLarge: const TextStyle(
          color: AppColors.darkTextPrimary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold),
      bodyMedium: const TextStyle(color: AppColors.white, fontFamily: 'Poppins'),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(foregroundColor: AppColors.darkTextPrimary),
    ),
    extensions: [
      GradientTheme(
          backgroundGradient: AppGradients.darkBackgroundGradient,
          buttonGradient: AppGradients.darkButtonGradient)
    ],
  );
}
