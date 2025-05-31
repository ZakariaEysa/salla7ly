import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_gradients.dart';

class GradientTheme extends ThemeExtension<GradientTheme> {
  final LinearGradient backgroundGradient;
  final LinearGradient buttonGradient;

  GradientTheme({
    required this.backgroundGradient,
    required this.buttonGradient,
  });

  @override
  GradientTheme copyWith({
    LinearGradient? backgroundGradient,
    LinearGradient? buttonGradient,
  }) {
    return GradientTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      buttonGradient: buttonGradient ?? this.buttonGradient,
    );
  }

  @override
  GradientTheme lerp(ThemeExtension<GradientTheme>? other, double t) {
    if (other is! GradientTheme) return this;
    return GradientTheme(
      backgroundGradient:
          LinearGradient.lerp(backgroundGradient, other.backgroundGradient, t)!,
      buttonGradient:
          LinearGradient.lerp(buttonGradient, other.buttonGradient, t)!,
    );
  }
}

ThemeData lightTheme = ThemeData(
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

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkButtonStart,
  scaffoldBackgroundColor: AppColors.darkBackgroundEnd,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        color: AppColors.darkTextPrimary,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold),
    bodyMedium:
        TextStyle(color: AppColors.darkTextSecondary, fontFamily: 'Poppins'),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(foregroundColor: AppColors.darkTextPrimary),
  ),
  extensions: [
    GradientTheme(
        backgroundGradient: AppGradients.darkBackgroundGradient,
        buttonGradient: AppGradients.darkButtonGradient)
  ],
);
