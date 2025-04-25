import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/views/national_id.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:salla7ly/utils/app_logs.dart';
import 'package:salla7ly/utils/navigation.dart';
import 'package:salla7ly/utils/validation_utils.dart';
import '../../../../../../widgets/custom_text_field.dart';
import '../../../../../../widgets/label_text.dart';
import '../../../../../shared/auth/presentation/views/sign_in.dart';
import '../have_account_row.dart';
import '../auth_button.dart';
import 'birth_date_selector.dart';
import 'upload_id_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

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
    AuthCubit cubit = AuthCubit().get(context);

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
                navigateTo(
                    context: context,
                    screen: NationalId(
                        onTap: () {
                          AppLogs.scussessLog("front");
                          AppLogs.scussessLog(
                              AuthCubit().get(context).frontId ?? "");
                          AppLogs.scussessLog("Back");

                          AppLogs.scussessLog(
                              AuthCubit().get(context).backId ?? "");
                          AppLogs.scussessLog("NextPage");
                          if (AuthCubit().get(context).frontId != null) {
                            navigateTo(
                                context: context,
                                screen: NationalId(
                                    onTap: () {
                                      if (AuthCubit().get(context).backId !=
                                          null) {
                                        int count = 0;
                                        Navigator.popUntil(context, (route) {
                                          return count++ == 2;
                                        });
                                        AppLogs.scussessLog("front");
                                        AppLogs.scussessLog(
                                            AuthCubit().get(context).frontId ??
                                                "");
                                        AppLogs.scussessLog("Back");

                                        AppLogs.scussessLog(
                                            AuthCubit().get(context).backId ??
                                                "");
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please upload the back of the National ID card first.");
                                      }
                                    },
                                    buttonText: "SignUp",
                                    text:
                                        "Upload the Back of the National ID card."));
                          } else {
                            AppLogs.scussessLog(
                                AuthCubit().get(context).frontId.toString());
                            Fluttertoast.showToast(
                                msg:
                                    "Please upload the front of the National ID card first.");
                          }
                        },
                        buttonText: "continue",
                        text: "Upload the front of the National ID card."));
              },
              width: 300.w,
              height: 48.h,
            ),

            SizedBox(height: 30.h),
            Align(
                alignment: Alignment.center,
                child: AuthButton(
                  onTap: () {
                    if (cubit.formKey.currentState!.validate()) {}
                  },
                  text: S.of(context).signUpButton,
                )),
            //signUpButton

            SizedBox(height: 20.h),
            AccountRow(
              title: S.of(context).alreadyHaveAccount,
              navigationWidget: const SignInScreen(),
              text: S.of(context).signIn,
            ),
          ],
        ),
      ),
    );
  }
}
