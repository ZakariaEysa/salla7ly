import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/page_title.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../shared/auth/presentation/widgets/sign_in/welcome_text.dart';
import '../widgets/sign_up/user_sign_up_form.dart';
import 'package:salla7ly/generated/l10n.dart';

class UserSignUpView extends StatefulWidget {
  const UserSignUpView({super.key});

  @override
  State<UserSignUpView> createState() => _UserSignUpViewState();
}

class _UserSignUpViewState extends State<UserSignUpView> {
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  PageTitle(title: S.of(context).signUp),
                  SizedBox(height: 40.h),
                  WelcomeText(text: S.of(context).fillCredentials),
                  SizedBox(height: 40.h),
                  const SignUpForm(),
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
