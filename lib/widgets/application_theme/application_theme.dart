import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2E1371),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2E1371),
      primary: const Color(0xFF2E1371),
      secondary: const Color(0xFF130B2B),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF2E1371),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFB7935F),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.black, size: 32.sp),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 24.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF4A90E2), // Fallback to a solid color (lighter blue)
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
        ),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), // Text/icon color
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF2E1371),
    splashColor: const Color(0xff6DE5E5),
    scaffoldBackgroundColor: const Color(0xFF130B2B),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2E1371),
      primary: const Color(0xFF2E1371),
      secondary: const Color(0xFF2C126A),
      onPrimary: Colors.white,
      onSecondary: const Color(0xFFD9D9D9).withOpacity(0.6),
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF2E1371),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF2C126A),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 32.sp),
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 24.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF4A90E2), // Fallback to a solid color (lighter blue)
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
        ),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), // Text/icon color
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white60,
      ),
    ),
  );
}
