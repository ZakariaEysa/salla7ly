import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:salla7ly/features/user_flow/auth/presentation/views/account_type_screen.dart';

/// كلاس لزر تسجيل الدخول
class SignInButton extends StatelessWidget {
  const SignInButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
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
              S.of(context).signInButton,
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
