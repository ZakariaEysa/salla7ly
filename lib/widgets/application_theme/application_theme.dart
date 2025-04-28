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
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFieldBackground,
      filled: true,
      hintStyle: TextStyle(
        color: AppColors.white.withOpacity(0.5),
        fontSize: 16.sp,
      ),
      labelStyle: TextStyle(
        color: AppColors.textFieldBorder,
        fontSize: 16.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
          width: 1,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.textFieldBorder,
      surface: AppColors.textFieldBackground,
      background: AppColors.lightBackgroundEnd,
      tertiary: AppColors.navyBlue,
      shadow: AppColors.shadowColor,
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
      bodyMedium:
          const TextStyle(color: AppColors.white, fontFamily: 'Poppins'),
      bodySmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.lightTextPrimary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(foregroundColor: AppColors.darkTextPrimary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.textFieldBackground,
      filled: true,
      hintStyle: TextStyle(
        color: AppColors.white.withOpacity(0.5),
        fontSize: 16.sp,
      ),
      labelStyle: TextStyle(
        color: AppColors.textFieldBorder,
        fontSize: 16.sp,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.textFieldBorder,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.errorColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13.r),
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.textFieldBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(
          color: AppColors.textFieldBorder,
          width: 1,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.textFieldBorder,
      surface: AppColors.textFieldBackground,
      background: AppColors.darkBackgroundEnd,
      tertiary: AppColors.navyBlue,
      shadow: AppColors.shadowColor,
      onPrimaryFixed: AppColors.lightTextPrimary,
      onSecondaryContainer: AppColors.borderColor,
      tertiaryFixedDim: AppColors.sugarColor,
      onTertiary: AppColors.sugarColor2,
      error: AppColors.errorColor,
    ),
    extensions: [
      GradientTheme(
          backgroundGradient: AppGradients.darkBackgroundGradient,
          buttonGradient: AppGradients.darkButtonGradient)
    ],
  );
}
