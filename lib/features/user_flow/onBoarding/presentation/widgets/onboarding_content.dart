import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

/// نموذج بيانات لمحتوى شاشة الأونبوردينج
class OnBoardingContent {
  final String image;
  final String title;
  final String description;

  /// إنشاء محتوى جديد لصفحة أونبوردينج
  ///
  /// [image] مسار الصورة
  /// [title] عنوان الصفحة
  /// [description] وصف الصفحة
  const OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
  });

  /// إنشاء نسخة جديدة مع تعديل بعض الخصائص
  OnBoardingContent copyWith({
    String? image,
    String? title,
    String? description,
  }) {
    return OnBoardingContent(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}

/// الحصول على قائمة محتويات الأونبوردينج بناءً على سياق التطبيق
///
/// [context] سياق التطبيق للوصول إلى الترجمات
///
/// يقوم بإرجاع قائمة من [OnBoardingContent] تحتوي على جميع صفحات الأونبوردينج
List<OnBoardingContent> getOnBoardingContents(BuildContext context) {
  final lang = S.of(context); // استخدام الترجمات المحلية

  return [
    OnBoardingContent(
      title: lang.welcomeToSalla7ly,
      image: "assets/images/on1.png",
      description: lang.on1Content,
    ),
    OnBoardingContent(
      title: lang.on2Title,
      image: "assets/images/on2.png",
      description: lang.on2Content,
    ),
    OnBoardingContent(
      title: lang.on3Title,
      image: "assets/images/on3.png",
      description: lang.on3Content,
    ),
  ];
}
