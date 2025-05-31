import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/custom_button.dart';

/// أنواع أزرار التنقل في الأونبوردينج
enum NavigationButtonsType {
  /// صفحة البداية: زر التالي فقط
  start,

  /// الصفحات الوسطى: زر السابق والتالي
  middle,

  /// الصفحة الأخيرة: زر السابق وزر البدء
  end
}

/// مكون أزرار التنقل للأونبوردينج
///
/// يعرض أزرار التنقل المناسبة حسب موقع الصفحة (أولى، وسطى، أخيرة)
class OnboardingNavigationButtons extends StatelessWidget {
  /// نوع أزرار التنقل (البداية، الوسط، النهاية)
  final NavigationButtonsType type;

  /// إجراء للانتقال للصفحة التالية
  final VoidCallback? onNext;

  /// إجراء للانتقال للصفحة السابقة
  final VoidCallback? onPrevious;

  /// إجراء عند الضغط على زر البدء في الصفحة الأخيرة
  final VoidCallback? onStart;

  /// إنشاء مكون أزرار التنقل
  ///
  /// [type] نوع الأزرار المراد عرضها
  /// [onNext] إجراء الانتقال للصفحة التالية
  /// [onPrevious] إجراء الانتقال للصفحة السابقة
  /// [onStart] إجراء بدء التطبيق من الصفحة الأخيرة
  const OnboardingNavigationButtons({
    super.key,
    required this.type,
    this.onNext,
    this.onPrevious,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    switch (type) {
      case NavigationButtonsType.start:
        // صفحة البداية: زر التالي فقط
        return CustomButton(
          text: lang.Next,
          onTap: onNext,
          width: 170.w,
          height: 58.h,
        );

      case NavigationButtonsType.middle:
        // الصفحات الوسطى: زر السابق والتالي
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر الرجوع
            CustomButton(
              width: 78.w,
              height: 58.h,
              onTap: onPrevious,
            ),

            SizedBox(width: 20.w),

            // زر التالي
            Expanded(
              child: CustomButton(
                text: lang.Next,
                onTap: onNext,
                width: 170.w,
                height: 58.h,
              ),
            ),
          ],
        );

      case NavigationButtonsType.end:
        // الصفحة الأخيرة: زر السابق وزر البدء
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر الرجوع
            CustomButton(
              width: 78.w,
              height: 58.h,
              onTap: onPrevious,
            ),

            SizedBox(width: 20.w),

            // زر البدء
            Expanded(
              child: CustomButton(
                text: lang.Start,
                onTap: onStart,
                width: 170.w,
                height: 58.h,
              ),
            ),
          ],
        );
    }
  }
}
