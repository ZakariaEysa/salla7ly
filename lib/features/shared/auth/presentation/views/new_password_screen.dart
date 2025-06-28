import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_router.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/app_logs.dart';
import '../../../../../utils/validation_utils.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../widgets/label_text.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/failure_toast.dart';

import '../../data/model/sign_in_model/sign_in_model.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_button.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final newPasswordUniqueKey = GlobalKey<FormState>();

  void _togglePasswordVisibility(AuthCubit cubit) {
    setState(() {
      cubit.obscurePassword = !cubit.obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility(AuthCubit cubit) {
    setState(() {
      cubit.obscureConfirmPassword = !cubit.obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    final theme = Theme.of(context);
    final lang = S.of(context);

    return ScaffoldF(
      appBar: AppBar(
        title: Text(
          lang.create_new_password,
          style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
        ),
        titleSpacing: 20,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Stack(
          children: [
            Form(
              key: newPasswordUniqueKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Image.asset(
                          "assets/images/image 14.png",
                          width: 210.w,
                          height: 207.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      lang.your_new_password_must_be_different_from_previously_used_password,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    LabelText(text: lang.passwordLabel),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: cubit.passwordController,
                      validator: (value) {
                        return ValidationUtils.validatePassword(value, context);
                      },
                      prefixWidget: Image.asset("assets/icons/lockIcon.png"),
                      suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
                      hintText: lang.passwordHint,
                      isPassword: true,
                      obscureText: cubit.obscurePassword,
                      onTogglePasswordVisibility: () =>
                          _togglePasswordVisibility(cubit),
                    ),
                    SizedBox(height: 20.h),
                    LabelText(text: lang.confirmPasswordLabel),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: cubit.confirmPasswordController,
                      validator: (value) {
                        return ValidationUtils.validateConfirmPassword(
                          value,
                          context,
                          cubit.passwordController.text,
                        );
                      },
                      prefixWidget: Image.asset("assets/icons/lockIcon2.png"),
                      suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
                      hintText: lang.confirmPasswordHint,
                      isPassword: true,
                      obscureText: cubit.obscureConfirmPassword,
                      onTogglePasswordVisibility: () =>
                          _toggleConfirmPasswordVisibility(cubit),
                    ),
                    SizedBox(height: 50.h),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        AppLogs.successLog(state.toString());
                        state.whenOrNull(
                          resetPasswordSuccess: () =>
                              context.go(AppRouter.home),
                          authError: (msg) => FailureToast.showToast(msg),
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          resetPasswordLoading: () => const LoadingIndicator(),
                          orElse: () => Align(
                            alignment: Alignment.center,
                            child: AuthButton(
                              text: lang.Change_Password,
                              onTap: () {
                                if (!newPasswordUniqueKey.currentState!
                                    .validate()) return;

                                cubit.changePassword(
                                  signInModel: SignInModel(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 60.h),
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
