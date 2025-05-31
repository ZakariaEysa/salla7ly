import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../services/failure_service.dart';
import '../../../../../../utils/app_logs.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../config/app_router.dart';
import '../../../../../../utils/validation_utils.dart';
import '../../../../../../widgets/custom_text_field.dart';
import '../../../../../../widgets/failure_toast.dart';
import '../../../../../../widgets/label_text.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../shared/auth/presentation/widgets/have_account_row.dart';
import '../../cubit/cubit/user_auth_cubit.dart';
import '../../../../../shared/auth/presentation/widgets/auth_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void _togglePasswordVisibility(UserAuthCubit cubit) {
    setState(() {
      cubit.obscurePassword = !cubit.obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility(UserAuthCubit cubit) {
    setState(() {
      cubit.obscureConfirmPassword = !cubit.obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserAuthCubit cubit = UserAuthCubit.get(context);

    return Form(
      key: cubit.userFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(text: S.of(context).usernameLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: cubit.userNameController,
              validator: (value) {
                return ValidationUtils.validateUsername(value, context);
              },
              prefixWidget: Image.asset("assets/icons/user.png"),
              hintText: S.of(context).usernameHint,
            ),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).emailLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: cubit.emailController,
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
              controller: cubit.passwordController,
              validator: (value) {
                return ValidationUtils.validatePassword(value, context);
              },
              prefixWidget: Image.asset("assets/icons/lockIcon.png"),
              suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
              // prefixIcon: Icons.lockcubit.outline,
              hintText: S.of(context).passwordHint,
              isPassword: true,
              obscureText: cubit.obscurePassword,
              onTogglePasswordVisibility: () =>
                  _togglePasswordVisibility(cubit),
            ),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).confirmPasswordLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: cubit.confirmPasswordController,
              validator: (value) {
                return ValidationUtils.validateConfirmPassword(
                    value, context, cubit.passwordController.text);
              },
              prefixWidget: Image.asset("assets/icons/lockIcon2.png"),
              suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
              hintText: S.of(context).confirmPasswordHint,
              isPassword: true,
              obscureText: cubit.obscureConfirmPassword,
              onTogglePasswordVisibility: () =>
                  _toggleConfirmPasswordVisibility(cubit),
            ),
            SizedBox(height: 20.h),

            BlocConsumer<UserAuthCubit, UserAuthState>(
              listener: (context, state) {
                AppLogs.successLog(state.toString());

                if (state is OtpSuccessState) {
                  if (UserAuthCubit.get(context).isFirstOtp) {
                    UserAuthCubit.get(context).isFirstOtp = false;

                    context.push(AppRouter.userOtp);
                  }
                } else if (state is SignUpErrorState) {
                  FailureToast.showToast(
                      ServiceFailure(state.message.errorMsg).errorMsg);
                }
              },
              builder: (context, state) {
                return state is OtpLoadingState
                    ? const LoadingIndicator()
                    : Align(
                        alignment: Alignment.center,
                        child: AuthButton(
                          onTap: () {
                            if (cubit.userFormKey.currentState!.validate()) {
                              UserAuthCubit.get(context).sendVerificationOtp();
                            }
                          },
                          text: S.of(context).signUpButton,
                        ));
              },
            ),
            //signUpButton

            SizedBox(height: 20.h),
            AccountRow(
              title: S.of(context).alreadyHaveAccount,
              navigationRoute: AppRouter.signIn,
              text: S.of(context).signIn,
              isReplace: true,
            ),
          ],
        ),
      ),
    );
  }
}
