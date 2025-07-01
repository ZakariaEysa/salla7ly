import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../widgets/application_theme/theme_extention.dart';

class UploadIdButton extends StatefulWidget {
  const UploadIdButton({
    super.key,
    required this.width,
    required this.height,
    this.onTap,
  });
  final double width;
  final double height;
  final void Function()? onTap;
  @override
  State<UploadIdButton> createState() => _UploadIdButtonState();
}

class _UploadIdButtonState extends State<UploadIdButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _shimmerAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    );

    _shimmerAnimation = Tween<double>(
      begin: -0.5,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutSine,
      ),
    );

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!_isPressed) {
      setState(() {
        _isPressed = true;
      });
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (_isPressed) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _handleTapCancel() {
    if (_isPressed) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  LinearGradient _createShimmerGradient(bool isRTL) {
    return LinearGradient(
      begin: isRTL ? Alignment.centerRight : Alignment.centerLeft,
      end: isRTL ? Alignment.centerLeft : Alignment.centerRight,
      colors: const [
        Colors.transparent,
        Color(0x66B3E5FC),
        Color(0x66B3E5FC),
        Color(0x66B3E5FC),
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

  Widget _buildTextButton(ThemeData theme, bool isRTL) {
    return GestureDetector(
      onTap: widget.onTap,
      child: RepaintBoundary(
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: Opacity(
            opacity: _isPressed ? 0.8 : 1.0,
            child: Stack(
              children: [
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
                      Image.asset(
                        "assets/icons/uploadImage.png",
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        S.of(context).uploadPhoto,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 18.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }

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
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: _buildTextButton(theme, isRTL),
        ),
      ],
    );
  }
}
