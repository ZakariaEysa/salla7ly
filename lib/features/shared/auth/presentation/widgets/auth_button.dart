import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لزر تسجيل الدخول
class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, this.onTap, required this.text})
      : super(key: key);
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 250.w,
      height: 52.h,
      decoration: ShapeDecoration(
        color: theme.colorScheme.surface.withOpacity(0.45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4.r,
            offset: Offset(0, 4.h),
            spreadRadius: 0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: theme.textTheme.bodyMedium?.color,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
