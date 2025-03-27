import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لزر نسيت كلمة المرور
class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          S.of(context).forgotPassword,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
