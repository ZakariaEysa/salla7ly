import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_router.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/app_logs.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../craft_man_flow/auth/presentation/cubit/cubit/craft_auth_cubit.dart';
import '../../../../shared/auth/presentation/widgets/auth_button.dart';
import '../../../../shared/auth/presentation/widgets/otp/otp_textfield.dart';
import '../../../../shared/auth/presentation/widgets/otp/timer.dart';
import '../cubit/cubit/craft_auth_state.dart';

class CraftsmanOtpScreen extends StatefulWidget {
  final Future<void> Function()? isSuccessOtp;
  const CraftsmanOtpScreen({super.key, this.isSuccessOtp});

  @override
  State<CraftsmanOtpScreen> createState() => _CraftsmanOtpScreenState();
}

class _CraftsmanOtpScreenState extends State<CraftsmanOtpScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();
  TextEditingController otpController6 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  void nextField({
    required String value,
    required FocusNode focusNode,
  }) {
    if (value.isNotEmpty) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(
      appBar: AppBar(
        centerTitle: true,
        title: Text(lang.confirm_otp_code,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 23.sp)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            CraftAuthCubit.get(context).isFirstOtp = true;
            context.pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            lang.please_enter_the_6_digit_code_sent_to_your_email,
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpFieldWidget(
                  controller: otpController1,
                  currentFocus: focusNode1,
                  nextFocus: focusNode2,
                  previousFocus: null,
                  nextField: nextField,
                  autofocus: true,
                ),
                OtpFieldWidget(
                  controller: otpController2,
                  currentFocus: focusNode2,
                  nextFocus: focusNode3,
                  previousFocus: focusNode1,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: otpController3,
                  currentFocus: focusNode3,
                  nextFocus: focusNode4,
                  previousFocus: focusNode2,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: otpController4,
                  currentFocus: focusNode4,
                  nextFocus: focusNode5,
                  previousFocus: focusNode3,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: otpController5,
                  currentFocus: focusNode5,
                  nextFocus: focusNode6,
                  previousFocus: focusNode4,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: otpController6,
                  currentFocus: focusNode6,
                  nextFocus: null,
                  previousFocus: focusNode5,
                  nextField: nextField,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CountdownTimer(
                  onResend: () async {
                    String email =
                        CraftAuthCubit.get(context).emailController.text;
                    if (email.isNotEmpty) {
                      CraftAuthCubit.get(context).sendVerificationOtp();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            lang.otp_has_been_resent,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onPrimaryFixed,
                            ),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          BlocConsumer<CraftAuthCubit, CraftAuthState>(
            listener: (context, state) {
              state.whenOrNull(signUpSuccess: () => context.go(AppRouter.home)
                  //  TODO : error not handeled  SignUpErrorState

                  );
            },
            builder: (context, state) {
              return state.maybeWhen(
                  signUpLoading: () => const LoadingIndicator(),
                  orElse: () => AuthButton(
                        text: lang.Continue,
                        onTap: () {
                          if (otpController1.text.isEmpty ||
                              otpController2.text.isEmpty ||
                              otpController3.text.isEmpty ||
                              otpController4.text.isEmpty ||
                              otpController5.text.isEmpty ||
                              otpController6.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(lang.please_enter_all_numbers_otp),
                                backgroundColor: Colors.white,
                              ),
                            );
                          } else {
                            CraftAuthCubit.get(context).otp =
                                otpController1.text +
                                    otpController2.text +
                                    otpController3.text +
                                    otpController4.text +
                                    otpController5.text +
                                    otpController6.text;
                            AppLogs.successLog("sending");
                            CraftAuthCubit.get(context).craftManSignUp();
                          }
                        },
                      ));
            },
          )
        ],
      ),
    );
  }
}
