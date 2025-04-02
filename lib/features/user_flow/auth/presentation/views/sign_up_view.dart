import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';
import '../../../../craft_man_flow/auth/presentation/widgets/sign_up/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.h),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        S.of(context).welcomeToSalla7ly,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      const SignUpForm(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
