import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../../craft_man_flow/auth/presentation/cubit/cubit/auth_cubit.dart';
import '../../../../craft_man_flow/auth/presentation/widgets/auth_button.dart';
import '../widgets/otp/otp_textfield.dart';
import '../widgets/otp/timer.dart';

class Otp extends StatefulWidget {
  final Future<void> Function()? isSuccessOtp;
  Otp({super.key, this.isSuccessOtp});
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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

  // Future<void> sendOtpResend(String email) async {
  //   try {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(child: CircularProgressIndicator());
  //       },
  //     );
  //
  //     var res = await EmailOtpAuth.sendOTP(email: email);
  //     if (context.mounted) {
  //       Navigator.of(context).pop();
  //     }
  //     if (res["message"] == "Email Send" && context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("OTP Sent Successfully ✅")),
  //       );
  //     } else if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Invalid E-Mail Address ❌")),
  //       );
  //     }
  //   } catch (error) {
  //     throw error.toString();
  //   }
  // }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    // bool isOtpValid = (await EmailOtpAuth.verifyOtp(otp: otp))["message"] == "OTP Verified";
    // if (isOtpValid) {
    //   if (widget.isSuccessOtp == null) {
    //     await AuthCubit.get(context).verifyedSendOtp();
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const HomeLayout()),
    //     );
    //   } else {
    //     await widget.isSuccessOtp!();
    //   }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Invalid OTP'),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    // }
  }

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
                  nextField: nextField,
                  autofocus: true,
                ),
                OtpFieldWidget(
                  controller: N2,
                  currentFocus: F2,
                  nextFocus: F3,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N3,
                  currentFocus: F3,
                  nextFocus: F4,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N4,
                  currentFocus: F4,
                  nextFocus: F5,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N5,
                  currentFocus: F5,
                  nextFocus: F6,
                  nextField: nextField,
                ),
                OtpFieldWidget(
                  controller: N6,
                  currentFocus: F6,
                  nextFocus: null,
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
                        AuthCubit.get(context).emailController.text ?? '';
                    if (email.isNotEmpty) {
                      // AuthCubit.get(context).sendOtp(email);
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
          AuthButton(
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
                String otp =
                    N1.text + N2.text + N3.text + N4.text + N5.text + N6.text;
                print("OTP entered: $otp");
                verifyOtp(context, otp);
              }
            },
          )
          // ButtonBuilder(
          //   text: 'Continue',
          //   onTap: () {
          //     if (N1.text.isEmpty || N2.text.isEmpty || N3.text.isEmpty || N4.text.isEmpty || N5.text.isEmpty || N6.text.isEmpty) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text('Please enter all numbers OTP'),
          //           backgroundColor: Colors.red,
          //         ),
          //       );
          //     } else {
          //       String otp = N1.text + N2.text + N3.text + N4.text + N5.text + N6.text;
          //       print("OTP entered: $otp");
          //       verifyOtp(context, otp);
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
