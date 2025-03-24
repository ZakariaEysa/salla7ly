import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  // Dark Mode Gradients
  static const LinearGradient darkBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.darkBackgroundStart, AppColors.darkBackgroundEnd],
    stops: [0.0032, 0.5636],
  );

  static const LinearGradient darkButtonGradient = LinearGradient(
    begin: Alignment(0.50, 0.00), // الاتجاه الجديد
    end: Alignment(1.07, 1.00), // الاتجاه الجديد
    colors: [
      AppColors.darkButtonStart,
      AppColors.darkButtonEnd
    ], // الألوان الجديدة
  );

  // Light Mode Gradients
  static const LinearGradient lightBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.white,
      AppColors.lightBackgroundEnd,
    ],
  );

  static const LinearGradient lightButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.lightButtonStart, AppColors.lightButtonEnd],
  );
}
