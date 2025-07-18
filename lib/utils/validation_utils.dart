import 'package:flutter/material.dart';

import '../generated/l10n.dart';

/// يقدم هذا الملف مجموعة من دوال التحقق المستخدمة في التطبيق
class ValidationUtils {
  /// التحقق من صحة البريد الإلكتروني
  /// يتحقق من أن البريد الإلكتروني له تنسيق صحيح
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return S.of(context).invalidEmail;
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
    if (value == null || value.isEmpty) {
      return S.of(context).passwordRequired;
    }
    if (value.length < 8) {
      return S.of(context).passwordTooShort;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return S.of(context).passwordNoUppercase;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return S.of(context).passwordNoNumber;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return S.of(context).passwordComplexityError;
    }
    return null;
  }

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
    if (value.length < 5) {
      return localizations.usernameTooShort;
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? value, BuildContext context, String password) {
    if (value == null || value.isEmpty) {
      return S.of(context).confirmPasswordRequired;
    }
    if (value != password) {
      return S.of(context).passwordsDoNotMatch;
    }
    return null;
  }
}
