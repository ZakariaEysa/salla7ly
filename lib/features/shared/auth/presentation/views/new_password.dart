import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/widgets/auth_button.dart';
import 'package:salla7ly/features/shared/auth/presentation/views/sign_in.dart';

import '../../../../../data/hive_storage.dart';
import '../../../../../utils/app_logs.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../utils/validation_utils.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../widgets/label_text.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/loading_indicator.dart';

import '../../../../craft_man_flow/auth/presentation/cubit/cubit/craft_auth_cubit.dart';
import '../../data/model/sign_in_model.dart';
import '../cubit/auth_cubit.dart';
import 'forget.dart';
import 'home_screen.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool obscure = true;
  bool obscure2 = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
    var lang = S.of(context);
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
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                          lang.your_new_password_must_be_different_from_previously_used_password,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 50.h,
                      ),
                      SizedBox(height: 20.h),
                      LabelText(text: S.of(context).passwordLabel),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        controller: cubit.passwordController,
                        validator: (value) {
                          return ValidationUtils.validatePassword(
                              value, context);
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
                      SizedBox(
                        height: 50.h,
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          AppLogs.scussessLog(state.toString());
                          if (state is ResetPasswordSuccessState) {
                            // if (!mounted) return;
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HomeScreen()),
                            //   (Route<dynamic> route) => false,
                            // );

                            // )

                            navigateAndRemoveUntil(
                                context: context, screen: HomeScreen());

                            // navigateAndRemoveUntil(
                            //     context: context,
                            //     screen: Container(
                            //       child: Text("home Page"),
                            //     ));
                          } else if (state is AuthErrorState) {
                            // Fluttertoast.showToast(
                            //     msg: ServiceFailure(state.message.errorMsg).errorMsg);
                          }
                        },
                        builder: (context, state) {
                          return state is ResetPasswordLoadingState
                              ? const LoadingIndicator()
                              : Align(
                                  alignment: Alignment.center,
                                  child: AuthButton(
                                    // width: 220.w,
                                    // height: 52.h,
                                    // image: HiveStorage.get(HiveKeys.isArabic)
                                    //     ? "assets/icons/save1_arabic.png"
                                    //     : "assets/icons/save1111.png",
                                    text: lang.Change_Password,
                                    onTap: () async {
                                      if (!newPasswordUniqueKey.currentState!
                                          .validate()) return;

                                      cubit.changePassword(
                                          signInModel: SignInModel(
                                              email: cubit.emailController.text,
                                              password: cubit
                                                  .passwordController.text));

                                      // await cubit.updateUserPassword(
                                      // cubit.emailController.text,
                                      // newPasswordController.text);
                                    },
                                  ),
                                );
                        },
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                    ],
                  ),
                ),
              )

              // BlocBuilder<AuthCubit, AuthState>(
              //   builder: (context, state) {
              //     if (state is UpdatePasswordLoading) {
              //       return const AbsorbPointer(
              //         absorbing: true,
              //         child: LoadingIndicator(),
              //       );
              //     }
              //     return const SizedBox.shrink();
              //   },
              // ),
            ],
          ),
        ));
  }
}
