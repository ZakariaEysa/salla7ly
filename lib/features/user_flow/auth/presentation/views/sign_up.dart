// import 'package:animate_do/animate_do.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:neon_widgets/neon_widgets.dart';
// import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';
// import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
// import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/otp.dart';
// import 'package:yourseatgraduationproject/generated/l10n.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
// import 'package:yourseatgraduationproject/utils/app_logs.dart';
// import 'package:yourseatgraduationproject/utils/navigation.dart';
// import 'package:yourseatgraduationproject/utils/validation_utils.dart';
// import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
// import '../../../../../data/hive_keys.dart';
// import '../../../../../data/hive_stroage.dart';
// import '../../../../../widgets/button/button_builder.dart';
// import '../../../../../widgets/loading_indicator.dart';
// import '../../../../../widgets/scaffold/scaffold_f.dart';
// import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';

// import '../../data/model/user_model.dart';
// import '../widgets/BirthDateDropdown.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   bool agree = false; // يبدأ بدون موافقة.
//   bool obscure = true;
//   bool obscure2 = true;
//   bool privacyPolicy = false;
//   String verificationId = "";
//   FirebaseAuth auth = FirebaseAuth.instance;

//   bool isError = false;

//   final List<int> days = List<int>.generate(31, (index) => index + 1);
//   final List<int> years = List<int>.generate(70, (index) => 2015 - index);

//   @override
//   Widget build(BuildContext context) {
//     var cubit = AuthCubit.get(context);

//     var local = S.of(context);
//     var theme = Theme.of(context);
//     final List<String> months = [
//       local.january,
//       local.february,
//       local.march,
//       local.april,
//       local.may,
//       local.june,
//       local.july,
//       local.august,
//       local.september,
//       local.october,
//       local.november,
//       local.december,
//     ];

//     return ScaffoldF(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(size: 28, color: Colors.white),
//         backgroundColor: theme.primaryColor,
//         title: Padding(
//           padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 0, 20),
//           child: HeadAppBar(
//             title: local.signUp,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Form(
//             key: cubit.formKeyRegister,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 25.h),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.w),
//                     child: FadeInRight(
//                       delay: const Duration(milliseconds: 550),
//                       child: Text(
//                         local.pleaseFillTheCredentials,
//                         style: theme.textTheme.bodySmall!
//                             .copyWith(fontSize: 18.sp),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   FadeInRight(
//                     delay: const Duration(milliseconds: 550),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                       child: TextFormFieldBuilder(
//                         height: 80.h,
//                         controller: cubit.userName,
//                         type: TextInputType.text,
//                         obsecure: false,
//                         label: local.username,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return local.enterUsername;
//                           }
//                           if (!nameRegex.hasMatch(value)) {
//                             return local.invalidUsername;
//                           }
//                           return null;
//                         },
//                         imagePath: 'assets/images/user.png',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   FadeInRight(
//                     delay: const Duration(milliseconds: 550),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                       child: TextFormFieldBuilder(
//                         height: 80.h,
//                         controller: cubit.emailController,
//                         label: local.email,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return local.enterEmailAddress;
//                           }
//                           if (!isValidEmail(value)) {
//                             return local.invalidEmailFormat;
//                           }
//                           return null;
//                         },
//                         obsecure: false,
//                         type: TextInputType.emailAddress,
//                         imagePath: 'assets/images/email 2.png',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   FadeInRight(
//                     delay: const Duration(milliseconds: 550),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                       child: TextFormFieldBuilder(
//                         height: isError ? 130.h : 80.h,
//                         controller: cubit.password,
//                         type: TextInputType.text,
//                         label: local.password,
//                         validator: (text) {
//                           if (text == null || text.trim().isEmpty) {
//                             return local.enterPassword;
//                           }
//                           if (!isValidPassword(text)) {
//                             isError = true;
//                             setState(() {});
//                             return local.password_requirements;
//                           }
//                           isError = false;
//                           setState(() {});
//                           return null;
//                         },
//                         obsecure: obscure,
//                         imagePath: "assets/images/padlock.png",
//                         suffixIcon: InkWell(
//                           onTap: () {
//                             setState(() {
//                               obscure = !obscure;
//                             });
//                           },
//                           child: Icon(
//                             obscure ? Icons.visibility_off : Icons.visibility,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   FadeInRight(
//                     delay: const Duration(milliseconds: 550),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                       child: TextFormFieldBuilder(
//                         height: 80.h,
//                         controller: cubit.confirmPassword,
//                         label: local.confirmPassword,
//                         validator: (text) {
//                           if (text == null || text.trim().isEmpty) {
//                             return local.enterConfirmPassword;
//                           }
//                           if (text != cubit.password.text) {
//                             return local.wrongConfirmPassword;
//                           }
//                           return null;
//                         },
//                         type: TextInputType.text,
//                         obsecure: obscure2,
//                         imagePath: "assets/images/access.png",
//                         suffixIcon: InkWell(
//                           onTap: () {
//                             setState(() {
//                               obscure2 = !obscure2;
//                             });
//                           },
//                           child: Icon(
//                             obscure2 ? Icons.visibility_off : Icons.visibility,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   FadeInRight(
//                     delay: const Duration(milliseconds: 550),
//                     child: Container(
//                       padding: EdgeInsets.only(left: 13.w),
//                       child: Text(
//                         local.birthDate,
//                         style: theme.textTheme.labelLarge!
//                             .copyWith(fontSize: 16.sp),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15.h),
//                   FadeInLeft(
//                     delay: const Duration(milliseconds: 550),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 8.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           BirthDateDropdown<String>(
//                             hintText: local.month,
//                             selectedValue: cubit.selectedMonth,
//                             itemsList: months,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 cubit.selectedMonth = newValue;
//                               });
//                             },
//                           ),
//                           BirthDateDropdown<int>(
//                             hintText: local.day,
//                             selectedValue: cubit.selectedDay,
//                             itemsList: days,
//                             onChanged: (int? newValue) {
//                               setState(() {
//                                 cubit.selectedDay = newValue;
//                               });
//                             },
//                           ),
//                           BirthDateDropdown<int>(
//                             hintText: local.year,
//                             selectedValue: cubit.selectedYear,
//                             itemsList: years,
//                             onChanged: (int? newValue) {
//                               setState(() {
//                                 cubit.selectedYear = newValue;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 35.h),
//                   FadeInRight(
//                     delay: const Duration(milliseconds: 550),
//                     child: Padding(
//                       padding: EdgeInsets.only(right: 17.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(width: 40.w),
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 agree = !agree;
//                                 privacyPolicy = agree;
//                               });
//                             },
//                             child: Container(
//                               width: 28.w,
//                               height: 28.h,
//                               decoration: BoxDecoration(
//                                 color:
//                                     agree ? Colors.purple : Colors.transparent,
//                                 shape: BoxShape.circle,
//                                 border:
//                                     Border.all(color: Colors.white, width: 2.w),
//                               ),
//                               child: Icon(
//                                 Icons.check,
//                                 size: 20.sp,
//                                 color: agree ? Colors.black : Colors.white,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10.w),
//                           Text(
//                             local.iAgreeWith,
//                             style: theme.textTheme.bodySmall!
//                                 .copyWith(fontSize: 16.sp),
//                           ),
//                           SizedBox(width: 4.w),
//                           InkWell(
//                             onTap: () {
//                               navigateTo(
//                                   context: context, screen: const AboutUs());
//                             },
//                             child: FlickerNeonText(
//                               text: local.privacyPolicy,
//                               flickerTimeInMilliSeconds: 1000,
//                               spreadColor: Colors.white,
//                               blurRadius: 20.r,
//                               textSize: 14.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   FadeInLeft(
//                     delay: const Duration(milliseconds: 550),
//                     child: Text(
//                       privacyPolicy ? "" : local.pleaseAcceptPrivacyAndPolicy,
//                       style: TextStyle(color: Colors.red),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   FadeInUp(
//                     delay: const Duration(milliseconds: 550),
//                     child: ButtonBuilder(
//                       image: HiveStorage.get(HiveKeys.isArabic)
//                           ? "assets/images/sign_up_arabic.png"
//                           : "assets/images/Sign up.png",
//                       text: "",
//                       onTap: createAccount,
//                       width: 220.w,
//                       height: 55.h,
//                     ),
//                   ),
//                   SizedBox(height: 25.h),
//                   FadeInUp(
//                     delay: const Duration(milliseconds: 550),
//                     child: Center(
//                       child: InkWell(
//                         onTap: () {
//                           cubit.emailController.clear();
//                           cubit.password.clear();
//                           cubit.confirmPassword.clear();

//                           cubit.userName.clear();
//                           cubit.selectedDay = null;

//                           cubit.selectedMonth = null;

//                           cubit.selectedYear = null;

//                           navigateAndReplace(
//                             context: context,
//                             screen: const SignIn(),
//                           );
//                         },
//                         child: Text(local.alreadyHaveAccount,
//                             style: theme.textTheme.bodySmall),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 25.h),
//                 ],
//               ),
//             ),
//           ),
//           BlocConsumer<AuthCubit, AuthState>(
//             listener: (context, state) {
//               if (state is AuthError) {
//                 showCenteredSnackBar(context, state.errorMessage);
//               }
//               if (state is AuthSuccess) {
//                 AppLogs.scussessLog("create");

//                 // HiveStorage.set(HiveKeys.role, Role.email.toString());
//                 navigateTo(context: context, screen: Otp());
//               }
//             },
//             builder: (context, state) {
//               if (state is AuthLoading) {
//                 return const AbsorbPointer(
//                   absorbing: true,
//                   child: LoadingIndicator(),
//                 );
//               }
//               return const SizedBox.shrink();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void createAccount() async {
//     AuthCubit auth = AuthCubit.get(context);

//     if (!auth.formKeyRegister.currentState!.validate()) return;

//     if (auth.selectedMonth == null ||
//         auth.selectedDay == null ||
//         auth.selectedYear == null) {
//       showCenteredSnackBar(context, "Please select your full birth date");
//       //
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text(),
//       //     duration: Duration(seconds: 2),
//       //   ),
//       // );
//       return;
//     }

//     // تحقق من قبول سياسة الخصوصية
//     if (!privacyPolicy) {
//       setState(() {
//         agree = false;
//       });
//       showCenteredSnackBar(context, S.of(context).pleaseAcceptPrivacyAndPolicy);

//       return;
//     }

//     if (auth.selectedMonth == null ||
//         auth.selectedDay == null ||
//         auth.selectedYear == null) {
//       showCenteredSnackBar(context, "Please select your full birth date");

//       return;
//     }

//     auth.registerUser(
//       userModel: UserModel(
//         name: auth.userName.text,
//         password: auth.password.text,
//         dateOfBirth:
//             "${auth.selectedDay}/${auth.selectedMonth}/${auth.selectedYear}",
//         email: auth.emailController.text,
//         location: "",
//         gender: "",
//         image: "",
//       ),
//     );
//   }
// }
