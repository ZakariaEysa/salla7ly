import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_theme/theme_extention.dart';

/// زر مخصص مع تأثيرات حركية جميلة
class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    this.text,
    this.onTap,
  });

  final double width;
  final double height;
  final String? text;
  final void Function()? onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  // متحكم في الحركة
  late AnimationController _animationController;

  // حركة تأثير الضوء المتحرك
  late Animation<double> _shimmerAnimation;

  // حالة الضغط على الزر
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    // تهيئة متحكم الحركة
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 3500), // تصحيح: استخدام ميلي ثانية (4 ثواني) لحركة أبطأ
    );

    // تعريف حركة تأثير الضوء المتحرك (من -0.5 إلى 1.5 لتغطية الزر بالكامل)
    _shimmerAnimation = Tween<double>(
      begin: -0.5,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutSine, // منحنى حركة أكثر سلاسة
      ),
    );

    // تشغيل الحركة بشكل مستمر
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // تشغيل أنيميشن الضغط
  void _handleTapDown(TapDownDetails details) {
    if (!_isPressed) {
      setState(() {
        _isPressed = true;
      });
    }
  }

  // تشغيل أنيميشن إنهاء الضغط
  void _handleTapUp(TapUpDetails details) {
    if (_isPressed) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  // تشغيل أنيميشن إلغاء الضغط
  void _handleTapCancel() {
    if (_isPressed) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  // إنشاء تدرج الضوء المتحرك
  LinearGradient _createShimmerGradient(bool isRTL) {
    return LinearGradient(
      // اختيار اتجاه الحركة حسب لغة التطبيق
      begin: isRTL ? Alignment.centerRight : Alignment.centerLeft,
      end: isRTL ? Alignment.centerLeft : Alignment.centerRight,
      colors: const [
        Colors.transparent,
        Color(0x66B3E5FC), // لون أزرق فاتح شفاف مناسب للتصميم العام
        Color(0x66B3E5FC), // لون أزرق فاتح شفاف مناسب للتصميم العام
        Color(0x66B3E5FC), // لون أزرق فاتح شفاف مناسب للتصميم العام
        Colors.transparent,
      ],
      stops: [
        0.0,
        _shimmerAnimation.value - 0.15,
        _shimmerAnimation.value,
        _shimmerAnimation.value + 0.15,
        1.0,
      ],
    );
  }

  // بناء زر نصي مع أيقونة للأمام
  Widget _buildTextButton(ThemeData theme, bool isRTL) {
    return RepaintBoundary(
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Opacity(
          opacity: _isPressed ? 0.8 : 1.0,
          child: Stack(
            children: [
              // الزر الأساسي
              Container(
                width: widget.width,
                height: widget.height,
                decoration: ShapeDecoration(
                  gradient: theme.extension<GradientTheme>()?.buttonGradient,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),

              // طبقة تأثير الضوء المتحرك
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _shimmerAnimation,
                  builder: (context, child) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        gradient: _createShimmerGradient(isRTL),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // بناء زر أيقونة للرجوع (بدون تأثير الضوء)
  Widget _buildIconButton(bool isRTL) {
    return RepaintBoundary(
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Opacity(
          opacity: _isPressed ? 0.8 : 1.0,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F9FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF0062FF),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // تحديد اتجاه النص (RTL للعربية، LTR للإنجليزية)
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.text != null)
          GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onTap: widget.onTap,
            child: _buildTextButton(theme, isRTL),
          ),
        SizedBox(width: 8.w),
        if (widget.text == null)
          GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onTap: widget.onTap,
            child: _buildIconButton(isRTL),
          ),
      ],
    );
  }
}
