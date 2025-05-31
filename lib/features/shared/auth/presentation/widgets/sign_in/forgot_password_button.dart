import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

import 'package:go_router/go_router.dart';
import '../../../../../../config/app_router.dart';

/// كلاس لزر نسيت كلمة المرور
class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.push(AppRouter.forgotPassword);
        },
        child: Text(
          S.of(context).forgotPassword,
          style: TextStyle(
            color: theme.textTheme.bodyMedium?.color,
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
