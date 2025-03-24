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
          // أشكال الخلفية - الشكل الرئيسي (Union) في الأعلى على اليمين
          Positioned(
            top: -100.h,
            right: -120.w,
            child: Image.asset(
              'assets/images/Union.png',
              width: 400.w,
              fit: BoxFit.contain,
            ),
          ),
          // الدائرة الأولى (Ellipse 4) على اليسار فوق
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
          // الدائرة الثانية (Ellipse 5) على اليسار تحت
          Positioned(
            top: 195.h,
            left: -20.w,
            child: Image.asset(
              'assets/images/Ellipse 5.png',
              width: 200.w,
              height: 50.h,
              fit: BoxFit.contain,
            ),
          ),

          // محتوى الصفحة
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),

                  // العنوان الرئيسي
                  PageTitle(title: S.of(context).signIn),

                  SizedBox(height: 40.h),

                  // رسالة الترحيب
                  WelcomeText(text: S.of(context).fillCredentials),

                  SizedBox(height: 60.h),

                  // حقل البريد الإلكتروني
                  LabelText(text: S.of(context).emailLabel),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    prefixIcon: Icons.mail_outline,
                    hintText: S.of(context).emailHint,
                  ),

                  SizedBox(height: 20.h),

                  // حقل كلمة المرور
                  LabelText(text: S.of(context).passwordLabel),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    prefixIcon: Icons.lock_outline,
                    hintText: S.of(context).passwordHint,
                    isPassword: true,
                    obscureText: _obscurePassword,
                    onTogglePasswordVisibility: _togglePasswordVisibility,
                  ),

                  // نص نسيت كلمة المرور
                  const ForgotPasswordButton(),

                  SizedBox(height: 10.h),

                  // زر تسجيل الدخول
                  const SignInButton(),

                  SizedBox(height: 30.h),

                  // فاصل "أو تسجيل الدخول باستخدام"
                  const OrSignInWithDivider(),

                  SizedBox(height: 30.h),

                  // زر تسجيل الدخول بجوجل
                  const GoogleSignInButton(),

                  SizedBox(height: 40.h),

                  // سطر التسجيل للحساب الجديد
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
