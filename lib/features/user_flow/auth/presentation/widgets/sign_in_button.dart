import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:salla7ly/features/user_flow/auth/presentation/views/account_type_screen.dart';

/// كلاس لزر تسجيل الدخول
class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: ShapeDecoration(
        color: const Color(0x77182F4C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        shadows: [
          const BoxShadow(
            color: const Color(0x3F000000),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: () {},
          child: Center(
            child: Text(
              S.of(context).signInButton,
              style: TextStyle(
                color: Colors.white,
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
