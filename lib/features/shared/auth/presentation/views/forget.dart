import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/widgets/auth_button.dart';
import 'package:salla7ly/features/shared/auth/presentation/views/forget_password_otp.dart';
import 'package:salla7ly/features/shared/auth/presentation/views/sign_in.dart';

import '../../../../../utils/app_logs.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../../../widgets/label_text.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../craft_man_flow/auth/presentation/cubit/cubit/craft_auth_cubit.dart';
import '../../data/model/send_forget_password_model.dart';
import '../cubit/auth_cubit.dart';
import 'new_password.dart';
import 'craft_man_otp.dart';

import 'package:go_router/go_router.dart';
import '../../../../../config/app_router.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/validation_utils.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formKeyForgot = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AuthCubit cubit = AuthCubit.get(context);

    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          lang.forgotPassword,
          style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Form(
          key: formKeyForgot,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Image.asset(
                    alignment: Alignment.center,
                    "assets/images/forget.png",
                    width: 242.w,
                    height: 250.h,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                    lang.please_enter_your_email_to_receive_a_verification_card,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 25.h,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: LabelText(text: S.of(context).emailLabel)),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: cubit.emailController,
                  validator: (value) {
                    return ValidationUtils.validateEmail(value, context);
                  },
                  prefixWidget: Image.asset("assets/icons/emailIcon.png"),
                  hintText: S.of(context).emailHint,
                ),
                SizedBox(
                  height: 60.h,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    AppLogs.scussessLog(state.toString());
                    if (state is SendForgetOtpSuccessState) {
                      if (AuthCubit.get(context).isFirstOtp) {
                        AuthCubit.get(context).isFirstOtp = false;

                        context.push(AppRouter.forgotPasswordOtp);
                      }

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
                        : AuthButton(
                            // width: 191.w,
                            // height: 48.h,

                            text: 'Send',
                            // style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            //   fontWeight: FontWeight.bold,
                            // ),
                            onTap: () async {
                              if (!formKeyForgot.currentState!.validate())
                                return;

                              cubit.sendForgetPassword(
                                  sendForgetPasswordModel:
                                      SendForgetPasswordModel(
                                          email: cubit.emailController.text));
                              // if (isValidEmail(cubit.emailController.text)) {
                              // } else {
                              //   BotToast.showText(text: lang.enter_valid_email);
                              //   return;
                              // }

                              // TODO: check if the user exists or not first
                              // try {
                              //   final userDoc = await FirebaseFirestore.instance

                              //       .collection('users')

                              //       .doc(cubit.emailController.text)

                              //       .get().timeout(Duration(seconds: 1));
                              //   if (userDoc.exists) {
                              //     cubit.sendOtp(cubit.emailController.text);
                              //     navigateTo(
                              //         context: context,
                              //         screen: Otp(
                              //           isSuccessOtp: () async {
                              //             navigateAndReplace(
                              //                 context: context, screen: NewPassword());
                              //           },
                              //         ));
                              //   } else {
                              //     BotToast.showText(text: lang.user_not_found);
                              //   }
                              // } catch (e) {

                              //   BotToast.showText(text: lang.something_went_wrong_please_check_your_network);

                              // }
                            },
                          );
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
