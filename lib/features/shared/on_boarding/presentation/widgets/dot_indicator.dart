import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// مكوّن يمثل نقطة في مؤشر الشرائح
///
/// يستخدم لإظهار الموقع الحالي في شرائح الأونبوردينج
class DotIndicator extends StatelessWidget {
  /// ما إذا كانت النقطة نشطة (تمثل الصفحة الحالية)
  final bool isActive;

  /// لون النقطة النشطة
  final Color? activeColor;

  /// لون النقطة غير النشطة
  final Color? inactiveColor;

  /// حجم النقطة
  final double size;

  /// إنشاء مؤشر نقطة
  ///
  /// [isActive] حالة النشاط
  /// [activeColor] لون النقطة النشطة، الافتراضي أزرق
  /// [inactiveColor] لون النقطة غير النشطة، الافتراضي أبيض
  /// [size] حجم النقطة بالبكسل، الافتراضي 12
  const DotIndicator({
    super.key,
    required this.isActive,
    this.activeColor,
    this.inactiveColor,
    this.size = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color dotActiveColor = activeColor ?? theme.colorScheme.primary;
    final Color dotInactiveColor =
        inactiveColor ?? theme.textTheme.bodyMedium?.color ?? Colors.white;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: size.h,
      width: size.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: isActive ? dotActiveColor : dotInactiveColor,
      ),
    );
  }
}

/// مكوّن يمثل صف من نقاط المؤشر للتنقل بين الشرائح
///
/// يعرض عدة نقاط بناءً على العدد الإجمالي للصفحات والصفحة النشطة حاليًا
class DotIndicatorRow extends StatelessWidget {
  /// عدد الصفحات الإجمالي
  final int count;

  /// رقم الصفحة النشطة حاليًا (يبدأ من 0)
  final int currentIndex;

  /// لون النقطة النشطة
  final Color? activeColor;

  /// لون النقطة غير النشطة
  final Color? inactiveColor;

  /// حجم النقطة
  final double dotSize;

  /// إنشاء صف من مؤشرات النقاط
  ///
  /// [count] عدد النقاط/الصفحات
  /// [currentIndex] الفهرس الحالي النشط
  const DotIndicatorRow({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor,
    this.inactiveColor,
    this.dotSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color dotActiveColor = activeColor ?? theme.colorScheme.primary;
    final Color dotInactiveColor =
        inactiveColor ?? theme.textTheme.bodyMedium?.color ?? Colors.white;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => DotIndicator(
          isActive: currentIndex == index,
          activeColor: dotActiveColor,
          inactiveColor: dotInactiveColor,
          size: dotSize,
        ),
      ),
    );
  }
}
