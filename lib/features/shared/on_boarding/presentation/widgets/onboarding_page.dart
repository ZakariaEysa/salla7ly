import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_content.dart';

/// مكوّن لعرض صفحة فردية في الأونبوردينج
class OnboardingPage extends StatelessWidget {
  /// محتوى الصفحة
  final OnBoardingContent content;

  /// قياس المساحة (padding) حول المحتوى
  final EdgeInsetsGeometry padding;

  /// إنشاء صفحة أونبوردينج
  ///
  /// [content] محتوى الصفحة من نص وصورة
  /// [padding] المساحة حول المحتوى
  const OnboardingPage({
    super.key,
    required this.content,
    this.padding = const EdgeInsets.all(30),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة الصفحة
            Image.asset(
              content.image,
              height: 300.h,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 30.h),

            // عنوان الصفحة
            Text(
              content.title,
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 15.h),

            // وصف الصفحة
            Text(
              content.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
