import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_theme/theme_extention.dart';

/// زر مخصص مع تأثيرات حركية جميلة
class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    this.text,
    this.onTap,
  }) : super(key: key);

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

  // تعريف الحركات
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // حركة تأثير الضوء المتحرك
  late Animation<double> _shimmerAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    // تهيئة متحكم الحركة
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // وقت أطول للتأثير الضوئي
    );

    // تعريف حركة تغيير الحجم
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.15, curve: Curves.easeInOut),
      ),
    );

    // تعريف حركة تغيير الشفافية
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.15, curve: Curves.easeInOut),
      ),
    );

    // تعريف حركة تأثير الضوء المتحرك (من -0.5 إلى 1.5 لتغطية الزر بالكامل)
    _shimmerAnimation = Tween<double>(
      begin: -0.5,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
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
      _isPressed = true;
    }
  }

  // تشغيل أنيميشن إنهاء الضغط
  void _handleTapUp(TapUpDetails details) {
    if (_isPressed) {
      _isPressed = false;
    }
  }

  // تشغيل أنيميشن إلغاء الضغط
  void _handleTapCancel() {
    if (_isPressed) {
      _isPressed = false;
    }
  }

  // إنشاء تأثير الضوء المتحرك
  Widget _buildShimmerEffect(Widget child) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: const [
                Colors.transparent,
                Colors.transparent,
                Colors.white,
                Colors.transparent,
                Colors.transparent,
              ],
              stops: [
                0.0,
                _shimmerAnimation.value - 0.05,
                _shimmerAnimation.value,
                _shimmerAnimation.value + 0.05,
                1.0,
              ],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // تحديد اتجاه النص (RTL للعربية، LTR للإنجليزية)
    final textDirection = Directionality.of(context);
    final isRTL = textDirection == TextDirection.rtl;

    // بناء زر ذو نص (رئيسي)
    Widget buildTextButton() {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _isPressed ? 0.95 : 1.0,
            child: Opacity(
              opacity: _isPressed ? 0.8 : 1.0,
              child: Stack(
                children: [
                  // الزر الأساسي
                  Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: ShapeDecoration(
                      gradient:
                          theme.extension<GradientTheme>()?.buttonGradient,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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
                  Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      gradient: LinearGradient(
                        // اختيار اتجاه الحركة حسب لغة التطبيق
                        begin: isRTL
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        end: isRTL
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.0),
                        ],
                        stops: [
                          0.0,
                          _shimmerAnimation.value - 0.05,
                          _shimmerAnimation.value,
                          _shimmerAnimation.value + 0.05,
                          1.0,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    // بناء زر ذو أيقونة (رجوع)
    Widget buildIconButton() {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _isPressed ? 0.95 : 1.0,
            child: Opacity(
              opacity: _isPressed ? 0.8 : 1.0,
              child: Stack(
                children: [
                  // الزر الأساسي
                  Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3F9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0xFF0062FF).withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF0062FF),
                    ),
                  ),

                  // طبقة تأثير الضوء المتحرك
                  Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      gradient: LinearGradient(
                        // اختيار اتجاه الحركة حسب لغة التطبيق
                        begin: isRTL
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        end: isRTL
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.0),
                        ],
                        stops: [
                          0.0,
                          _shimmerAnimation.value - 0.05,
                          _shimmerAnimation.value,
                          _shimmerAnimation.value + 0.05,
                          1.0,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.text != null)
          GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onTap: widget.onTap,
            child: buildTextButton(),
          ),
        const SizedBox(width: 8.0),
        if (widget.text == null)
          GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onTap: widget.onTap,
            child: buildIconButton(),
          ),
      ],
    );
  }
}
