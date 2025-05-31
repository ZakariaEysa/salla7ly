import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لفاصل "أو تسجيل الدخول باستخدام"
class OrSignInWithDivider extends StatelessWidget {
  const OrSignInWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: theme.textTheme.bodyMedium?.color,
            thickness: 1.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            S.of(context).orSignInWith,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 20.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: theme.textTheme.bodyMedium?.color,
            thickness: 1.h,
          ),
        ),
      ],
    );
  }
}
