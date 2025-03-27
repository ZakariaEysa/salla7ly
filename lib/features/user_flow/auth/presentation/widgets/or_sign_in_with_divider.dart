import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لفاصل "أو تسجيل الدخول باستخدام"
class OrSignInWithDivider extends StatelessWidget {
  const OrSignInWithDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xff6DE5E5),
            thickness: 1.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            S.of(context).orSignInWith,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xff6DE5E5),
            thickness: 1.h,
          ),
        ),
      ],
    );
  }
}
