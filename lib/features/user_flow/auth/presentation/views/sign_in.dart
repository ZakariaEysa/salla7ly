import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';
import 'package:salla7ly/generated/l10n.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/forgot_password_button.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/label_text.dart';
import '../widgets/or_sign_in_with_divider.dart';
import '../widgets/page_title.dart';
import '../widgets/sign_in_button.dart';
import '../widgets/sign_up_row.dart';
import '../widgets/welcome_text.dart';

/// الشاشة الرئيسية لتسجيل الدخول
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      body: Stack(
        children: [
          Positioned(
            top: -100.h,
            right: -120.w,
            child: Image.asset(
              'assets/images/Union.png',
              width: 400.w,
              height: 600.h,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 100.h,
            left: -60.w,
            child: Image.asset(
              'assets/images/Ellipse 5.png',
              width: 200.w,
              height: 57.h,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 185.h,
            left: -10.w,
            child: Image.asset(
              'assets/images/Ellipse 5.png',
              width: 200.w,
              height: 30.h,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  PageTitle(title: S.of(context).signIn),
                  SizedBox(height: 40.h),
                  WelcomeText(text: S.of(context).fillCredentials),
                  SizedBox(height: 60.h),
                  LabelText(text: S.of(context).emailLabel),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    prefixWidget: Image.asset("assets/icons/emailIcon.png"),
                    // prefixIcon: Icons.mail,
                    hintText: S.of(context).emailHint,
                  ),
                  SizedBox(height: 20.h),
                  LabelText(text: S.of(context).passwordLabel),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    prefixWidget: Image.asset("assets/icons/lockIcon.png"),
                    suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
                    // prefixIcon: Icons.lock_outline,
                    hintText: S.of(context).passwordHint,
                    isPassword: true,
                    obscureText: _obscurePassword,
                    onTogglePasswordVisibility: _togglePasswordVisibility,
                  ),
                  const ForgotPasswordButton(),
                  SizedBox(height: 10.h),
                  const Align(
                      alignment: Alignment.center, child: const SignInButton()),
                  SizedBox(height: 30.h),
                  const OrSignInWithDivider(),
                  SizedBox(height: 30.h),
                  const GoogleSignInButton(),
                  SizedBox(height: 40.h),
                  const SignUpRow(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
