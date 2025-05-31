import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_logs.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/app_router.dart';
import '../../../../../widgets/loading_indicator.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../craft_man_flow/auth/presentation/cubit/cubit/craft_auth_cubit.dart';
import '../../../../shared/auth/presentation/widgets/auth_button.dart';
import '../../../../shared/auth/presentation/widgets/otp/otp_textfield.dart';
import '../../../../shared/auth/presentation/widgets/otp/timer.dart';

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

  TextEditingController N1 = TextEditingController();
  TextEditingController N2 = TextEditingController();
  TextEditingController N3 = TextEditingController();
  TextEditingController N4 = TextEditingController();
  TextEditingController N5 = TextEditingController();
  TextEditingController N6 = TextEditingController();

  final FocusNode F1 = FocusNode();
  final FocusNode F2 = FocusNode();
  final FocusNode F3 = FocusNode();
  final FocusNode F4 = FocusNode();
  final FocusNode F5 = FocusNode();
  final FocusNode F6 = FocusNode();

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
                  controller: N1,
                  currentFocus: F1,
                  nextFocus: F2,
                  previousFocus: null,
                  nextField: nextField,
                  autofocus: true,
                ),
                OtpFieldWidget(
                  controller: N2,
                  currentFocus: F2,
                  nextFocus: F3,
                  previousFocus: F1,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N3,
                  currentFocus: F3,
                  nextFocus: F4,
                  previousFocus: F2,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N4,
                  currentFocus: F4,
                  nextFocus: F5,
                  previousFocus: F3,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N5,
                  currentFocus: F5,
                  nextFocus: F6,
                  previousFocus: F4,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N6,
                  currentFocus: F6,
                  nextFocus: null,
                  previousFocus: F5,
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
              AppLogs.scussessLog(state.toString());
              if (state is SignUpSuccessState) {
                context.go(AppRouter.home);
              } else if (state is SignUpErrorState) {
                // Handle error
              }
            },
            builder: (context, state) {
              return state is SignUpLoadingState
                  ? const LoadingIndicator()
                  : AuthButton(
                      text: lang.Continue,
                      onTap: () {
                        if (N1.text.isEmpty ||
                            N2.text.isEmpty ||
                            N3.text.isEmpty ||
                            N4.text.isEmpty ||
                            N5.text.isEmpty ||
                            N6.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(lang.please_enter_all_numbers_otp),
                              backgroundColor: Colors.white,
                            ),
                          );
                        } else {
                          CraftAuthCubit.get(context).otp = N1.text +
                              N2.text +
                              N3.text +
                              N4.text +
                              N5.text +
                              N6.text;
                          AppLogs.scussessLog("sending");
                          CraftAuthCubit.get(context).craftManSignUp();
                        }
                      },
                    );
            },
          )
        ],
      ),
    );
  }
}
