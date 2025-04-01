import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/account_type_screen.dart';

/// كلاس لسطر التسجيل للحساب الجديد
class SignUpRow extends StatelessWidget {
  const SignUpRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: TextStyle(
            color: theme.textTheme.bodyMedium?.color,
            fontSize: 20.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AccountTypeScreen(),
              ),
            );
            // التنقل إلى صفحة اختيار نوع الحساب
          },
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.only(left: 8.w),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            S.of(context).signUp,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900,
              height: 1.10,
              letterSpacing: -0.41,
            ),
          ),
        ),
      ],
    );
  }
}
