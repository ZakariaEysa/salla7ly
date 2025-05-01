import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla7ly/features/shared/auth/presentation/cubit/auth_cubit.dart';
import 'package:salla7ly/widgets/failure_toast.dart';
import 'package:salla7ly/widgets/loading_indicator.dart';
import 'package:salla7ly/widgets/page_title.dart';

import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';
import 'package:salla7ly/generated/l10n.dart';
import '../../../../../services/failure_service.dart';
import '../../../../../utils/app_logs.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../utils/validation_utils.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../widgets/label_text.dart';

import '../widgets/have_account_row.dart';
import '../widgets/sign_in/forgot_password_button.dart';
import '../widgets/sign_in/google_sign_in_button.dart';
import '../widgets/sign_in/or_sign_in_with_divider.dart';
import '../widgets/auth_button.dart';
import '../widgets/sign_in/welcome_text.dart';
import 'account_type_screen.dart';

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
      resizeToAvoidBottomInset: true,
      body: Form(
        key: AuthCubit.get(context).signInKey,
        child: Stack(
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    PageTitle(title: S.of(context).signIn),
                    SizedBox(height: 40.h),
                    WelcomeText(text: S.of(context).fillCredentials),
                    SizedBox(height: 60.h),
                    LabelText(text: S.of(context).emailLabel),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: AuthCubit.get(context).emailController,
                      validator: (value) {
                        return ValidationUtils.validateEmail(value, context);
                      },
                      prefixWidget: Image.asset("assets/icons/emailIcon.png"),
                      // prefixIcon: Icons.mail,
                      hintText: S.of(context).emailHint,
                    ),
                    SizedBox(height: 20.h),
                    LabelText(text: S.of(context).passwordLabel),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: AuthCubit.get(context).passwordController,

                      validator: (value) {
                        return ValidationUtils.validatePassword(value, context);
                      },
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
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        AppLogs.scussessLog(state.toString());

                        if (state is SignInSuccessState) {
                          navigateAndRemoveUntil(
                              context: context,
                              screen: Container(
                                child: Text("home Page"),
                              ));
                        } else if (state is AuthErrorState) {
                          FailureToast.showToast(
                              ServiceFailure(state.message.errorMsg).errorMsg);
                        }
                      },
                      builder: (context, state) {
                        return state is SignInLoadingState
                            ? LoadingIndicator()
                            : Align(
                                alignment: Alignment.center,
                                child: AuthButton(
                                  text: S.of(context).signInButton,
                                  onTap: () {
                                    if (AuthCubit.get(context)
                                        .signInKey
                                        .currentState!
                                        .validate()) {
                                      AuthCubit.get(context).signIn();
                                    }
                                  },
                                ));
                      },
                    ),
                    SizedBox(height: 30.h),
                    const OrSignInWithDivider(),
                    SizedBox(height: 30.h),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        AppLogs.scussessLog(state.toString());

                        if (state is GoogleAuthSuccessState) {
                          navigateAndRemoveUntil(
                              context: context,
                              screen: Container(
                                child: Text("home Page"),
                              ));
                        } else if (state is AuthErrorState) {
                          FailureToast.showToast(
                              ServiceFailure(state.message.errorMsg).errorMsg);
                        }
                      },
                      builder: (context, state) {
                        return state is GoogleAuthLoadingState
                            ? LoadingIndicator()
                            : GoogleSignInButton(
                                onTap: () {
                                  AuthCubit.get(context).signInWithGoogle();
                                },
                              );
                      },
                    ),
                    SizedBox(height: 30.h),
                    AccountRow(
                      title: S.of(context).dontHaveAccount,
                      navigationWidget: const AccountTypeScreen(),
                      text: S.of(context).signUp,
                      // التنقل إلى صفحة اختيار نوع الحساب
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
