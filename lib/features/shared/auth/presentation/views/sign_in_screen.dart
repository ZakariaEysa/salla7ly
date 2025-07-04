import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../user_flow/auth/presentation/cubit/cubit/user_auth_cubit.dart';
import '../cubit/auth_cubit.dart';
import '../../../../../widgets/failure_toast.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../../widgets/page_title.dart';

import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../services/failure_service.dart';
import '../../../../../utils/app_logs.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/app_router.dart';
import '../../../../../utils/validation_utils.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../widgets/label_text.dart';
import '../cubit/auth_state.dart';
import '../widgets/have_account_row.dart';
import '../widgets/sign_in/google_sign_in_button.dart';
import '../widgets/sign_in/or_sign_in_with_divider.dart';
import '../widgets/auth_button.dart';
import '../widgets/sign_in/welcome_text.dart';
import '../widgets/sign_in/forgot_password_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserAuthCubit.get(context).isFirstOtp = true;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  final signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: signInKey,
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
                      hintText: S.of(context).passwordHint,
                      isPassword: true,
                      obscureText: _obscurePassword,
                      onTogglePasswordVisibility: _togglePasswordVisibility,
                    ),
                    const ForgotPasswordButton(),
                    SizedBox(height: 10.h),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        AppLogs.successLog(state.toString());
                        state.whenOrNull(
                            signInSuccess: () => context.go(AppRouter.home),
                            authError: (errorMsg) =>
                                FailureToast.showToast(errorMsg));
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          signInLoading: () => LoadingIndicator(),
                          orElse: () => Align(
                              alignment: Alignment.center,
                              child: AuthButton(
                                text: S.of(context).signInButton,
                                onTap: () {
                                  if (signInKey.currentState!.validate()) {
                                    AuthCubit.get(context).signIn();
                                  }
                                },
                              )),
                        );
                      },
                    ),
                    SizedBox(height: 30.h),
                    const OrSignInWithDivider(),
                    SizedBox(height: 30.h),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        state.whenOrNull(
                            googleAuthSuccess: () => context.go(AppRouter.home),
                            authError: (errorMsg) =>
                                FailureToast.showToast(errorMsg));
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                            googleAuthLoading: () => const LoadingIndicator(),
                            orElse: () => GoogleSignInButton(
                                  onTap: () {
                                    AuthCubit.get(context).signInWithGoogle();
                                  },
                                ));
                      },
                    ),
                    SizedBox(height: 30.h),
                    AccountRow(
                      title: S.of(context).dontHaveAccount,
                      navigationRoute: AppRouter.accountType,
                      text: S.of(context).signUp,
                      isReplace: false,
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
