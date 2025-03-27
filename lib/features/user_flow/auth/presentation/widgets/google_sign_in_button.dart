import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لزر تسجيل الدخول بجوجل
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.r,
            spreadRadius: 1.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google.png',
                height: 24.h,
              ),
              SizedBox(width: 12.w),
              Text(
                S.of(context).continueWithGoogle,
                style: const TextStyle(
                  color: const Color(0xFF172E4A),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.10,
                  letterSpacing: -0.41,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
