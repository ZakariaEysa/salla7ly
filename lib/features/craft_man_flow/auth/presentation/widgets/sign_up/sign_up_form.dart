import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../cubit/cubit/craft_auth_cubit.dart';
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
import '../../../../../shared/auth/presentation/widgets/auth_button.dart';
import 'birth_date_selector.dart';
import 'upload_id_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void _togglePasswordVisibility(CraftAuthCubit cubit) {
    setState(() {
      cubit.obscurePassword = !cubit.obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility(CraftAuthCubit cubit) {
    setState(() {
      cubit.obscureConfirmPassword = !cubit.obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    CraftAuthCubit cubit = CraftAuthCubit.get(context);

    return Form(
      key: cubit.formKey,
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
            LabelText(text: S.of(context).birthDateLabel),
            SizedBox(height: 10.h),
            const BirthDateSelector(),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).uploadIdLabel),
            SizedBox(height: 20.h),
            UploadIdButton(
              onTap: () {
                AppLogs.scussessLog("Upload ID");
                context.push(
                  AppRouter.nationalId,
                  extra: {
                    'text': "Upload the front of the National ID card.",
                    'buttonText': "continue",
                    'onTap': () {
                      AppLogs.scussessLog("front");
                      AppLogs.scussessLog(
                          CraftAuthCubit.get(context).frontId ?? "");
                      AppLogs.scussessLog("Back");

                      AppLogs.scussessLog(
                          CraftAuthCubit.get(context).backId ?? "");
                      AppLogs.scussessLog("NextPage");
                      if (CraftAuthCubit.get(context).frontId != null) {
                        context.push(
                          AppRouter.nationalId,
                          extra: {
                            'text': "Upload the Back of the National ID card.",
                            'buttonText': "SignUp",
                            'onTap': () {
                              if (CraftAuthCubit.get(context).backId != null) {
                                // Pop back to the signup form (2 screens back)
                                context.pop(); // Pop back screen
                                context.pop(); // Pop front screen
                                AppLogs.scussessLog("front");
                                AppLogs.scussessLog(
                                    CraftAuthCubit.get(context).frontId ?? "");
                                AppLogs.scussessLog("Back");
                                AppLogs.scussessLog(
                                    CraftAuthCubit.get(context).backId ?? "");
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please upload the back of the National ID card first.");
                              }
                            },
                          },
                        );
                      } else {
                        AppLogs.scussessLog(
                            CraftAuthCubit.get(context).frontId.toString());
                        Fluttertoast.showToast(
                            msg:
                                "Please upload the front of the National ID card first.");
                      }
                    },
                  },
                );
              },
              width: 300.w,
              height: 48.h,
            ),

            SizedBox(height: 30.h),
            BlocConsumer<CraftAuthCubit, CraftAuthState>(
              listener: (context, state) {
                AppLogs.scussessLog(state.toString());

                if (state is OtpSuccessState) {
                  if (CraftAuthCubit.get(context).isFirstOtp) {
                    CraftAuthCubit.get(context).isFirstOtp = false;
                    context.push(AppRouter.craftmanOtp);
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
                            if (cubit.formKey.currentState!.validate()) {
                              if (CraftAuthCubit.get(context).backId == null ||
                                  CraftAuthCubit.get(context).frontId == null) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please upload the National ID card first.");
                                return;
                              }
                              CraftAuthCubit.get(context).sendVerificationOtp();
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
