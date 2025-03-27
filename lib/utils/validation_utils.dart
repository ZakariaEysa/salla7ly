import 'package:flutter/material.dart';
import '../generated/l10n.dart';

/// يقدم هذا الملف مجموعة من دوال التحقق المستخدمة في التطبيق
class ValidationUtils {
  /// التحقق من صحة البريد الإلكتروني
  /// يتحقق من أن البريد الإلكتروني له تنسيق صحيح
  static String? validateEmail(String? value, BuildContext context) {
    final localizations = S.of(context);

    if (value == null || value.isEmpty) {
      return localizations.emailRequired;
    }

    // التعبير النمطي للتحقق من صحة البريد الإلكتروني
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return localizations.invalidEmail;
    }

    return null;
  }

  /// التحقق من صحة كلمة المرور
  /// يتأكد من أن كلمة المرور:
  /// - لا تقل عن 8 أحرف
  /// - تحتوي على حرف كبير واحد على الأقل
  /// - تحتوي على رقم واحد على الأقل
  /// - تحتوي على رمز خاص واحد على الأقل
  static String? validatePassword(String? value, BuildContext context) {
    final localizations = S.of(context);

    if (value == null || value.isEmpty) {
      return localizations.passwordRequired;
    }

    // التحقق من كل المتطلبات دفعة واحدة
    final hasMinLength = value.length >= 8;
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasMinLength || !hasUppercase || !hasNumber || !hasSpecialChar) {
      return localizations.passwordComplexityError;
    }

    return null;
  }

  /// التحقق من صحة اسم المستخدم
  /// - لا يمكن أن تكون فارغة
  /// - يمكن أن تحتوي على مسافة في الوسط
  /// - لا يمكن أن تبدأ بمسافة
  /// - لا يمكن أن تحتوي على أرقام
  static String? validateUsername(String? value, BuildContext context) {
    final localizations = S.of(context);

    if (value == null || value.isEmpty) {
      return localizations.usernameRequired;
    }

    // التحقق من أن اسم المستخدم لا يبدأ بمسافة
    if (value.startsWith(' ')) {
      return localizations.usernameStartsWithSpace;
    }

    // التحقق من الطول (اختياري)
    if (value.length < 3) {
      return localizations.usernameTooShort;
    }

    // التحقق من عدم وجود أرقام
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return localizations.usernameHasNumbers;
    }

    return null;
  }
}
