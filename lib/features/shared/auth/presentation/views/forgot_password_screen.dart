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
import '../../data/model/send_forget_password_model.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                    AppLogs.successLog(state.toString());
                    if (state is SendForgetOtpSuccessState) {
                      if (AuthCubit.get(context).isFirstOtp) {
                        AuthCubit.get(context).isFirstOtp = false;

                        context.push(AppRouter.forgotPasswordOtp);
                      }
                    } else if (state is AuthErrorState) {
                      // Handle error
                    }
                  },
                  builder: (context, state) {
                    return state is ResetPasswordLoadingState
                        ? const LoadingIndicator()
                        : AuthButton(
                            text: 'Send',
                            onTap: () async {
                              if (!formKeyForgot.currentState!.validate()) {
                                return;
                              }

                              cubit.sendForgetPassword(
                                  sendForgetPasswordModel:
                                      SendForgetPasswordModel(
                                          email: cubit.emailController.text));
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
