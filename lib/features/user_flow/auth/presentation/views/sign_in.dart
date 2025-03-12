// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../data/hive_keys.dart';
// import '../../../../../data/hive_stroage.dart';
// import '../cubit/auth_cubit.dart';
// import 'sign_up.dart';
// import '../widgets/sign_in_part.dart';
// import '../../../home/presentation/views/home_layout.dart';
// import '../../../../../generated/l10n.dart';
// import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
// import '../../../../../utils/app_logs.dart';
// import '../../../../../utils/navigation.dart';
// import '../../../../../utils/validation_utils.dart';
// import '../../../../../widgets/app_bar/head_appbar.dart';
// import '../../../../../widgets/button/button_builder.dart';
// import '../../../../../widgets/loading_indicator.dart';
// import '../../../../../widgets/scaffold/scaffold_f.dart';
// import 'forget.dart';
// import '../../data/model/user_model.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   bool obscure2 = true;

//   @override
//   Widget build(BuildContext context) {
//     var cubit = AuthCubit.get(context);
//     var lang = S.of(context);
//     final theme = Theme.of(context);
//     return ScaffoldF(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2E1371),
//         title: Padding(
//           padding: const EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
//           child: HeadAppBar(title: lang.sign_in),
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: BlocConsumer<AuthCubit, AuthState>(
//               listener: (context, state) {
//                 if (state is GoogleAuthSuccess)  {
//                   HiveStorage.set(HiveKeys.role, Role.google.toString());
//                   AppLogs.debugLog('${lang.login_successful} ${state.user.name}');

//                   showCenteredSnackBar(context, '${lang.login_successful} ${state.user.name}');
//                   navigateAndRemoveUntil(
//                       context: context, screen: const HomeLayout());
//                 } else if (state is FacebookAuthSuccess) {
//                   HiveStorage.set(HiveKeys.role, Role.facebook.toString());


//                   showCenteredSnackBar(context, '${lang.login_successful} ${state.user.name}');
//                   navigateAndRemoveUntil(
//                       context: context, screen: const HomeLayout());
//                 } else if (state is UserValidationSuccess) {
//                   HiveStorage.set(HiveKeys.role, Role.email.toString());

//                   showCenteredSnackBar(context, lang.login_successful);
//                   navigateAndRemoveUntil(
//                       context: context, screen: const HomeLayout());
//                 } else if (state is GoogleAuthError) {

//                   showCenteredSnackBar(context, state.errorMsg);
//                 } else if (state is FacebookAuthError) {

//                   showCenteredSnackBar(context,state.errorMsg);
//                 } else if (state is UserValidationError) {

//                   showCenteredSnackBar(context, state.error);
//                 }
//               },
//               builder: (context, state) {
//                 return Form(
//                   key: cubit.formKeyLogin,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 25.h,
//                       ),
//                       FadeInRight(
//                         delay: const Duration(milliseconds: 200),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.only(
//                               start: 20.w, bottom: 15.h),
//                           child: Text(
//                             lang.pleaseFillTheCredentials,
//                             style: theme.textTheme.bodySmall!
//                                 .copyWith(fontSize: 16.sp),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15.h),
//                       FadeInRight(
//                         delay: const Duration(milliseconds: 550),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                           child: TextFormFieldBuilder(
//                             height: 80.h,
//                             label: lang.email,
//                             controller: cubit.emailController,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return lang.enterEmailAddress;
//                               }
//                               if (!isValidEmail(value)) {
//                                 return lang.invalidEmailFormat;
//                               }
//                               return null;
//                             },
//                             obsecure: false,
//                             type: TextInputType.emailAddress,
//                             imagePath: 'assets/images/email 2.png',
//                           ),
//                         ),
//                       ),
//                       FadeInRight(
//                         delay: const Duration(milliseconds: 600),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.sp),
//                           child: TextFormFieldBuilder(
//                             height: 80.h,
//                             type: TextInputType.text,
//                             obsecure: obscure2,
//                             imagePath: "assets/images/padlock.png",
//                             suffixIcon: InkWell(
//                               onTap: () {
//                                 setState(() => obscure2 = !obscure2);
//                               },
//                               child: Icon(
//                                   obscure2
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: Colors.grey),
//                             ),
//                             controller: cubit.passwordController,
//                             label: lang.password,
//                             validator: (text) {
//                               if (text == null || text.trim().isEmpty) {
//                                 return lang.enterPassword;
//                               }
//                               if (!isValidPassword(text)) {
//                                 return lang.password_validation;
//                               }

//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 700),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.only(
//                               end: 20.w, bottom: 15.h, top: 12.h),
//                           child: GestureDetector(
//                             onTap: () {
//                               navigateTo(
//                                   context: context, screen: ForgotPassword());
//                               // if (
//                               // isValidEmail(
//                               // cubit.emailController.text)) {
//                               //   navigateTo(
//                               //       context: context, screen:  Otp());
//                               // } else {
//                               //   BotToast.showText(text: lang.enter_valid_email);
//                               // }
//                             },
//                             child: Align(
//                               alignment: AlignmentDirectional.centerEnd,
//                               child: Text(
//                                 lang.forgotPassword,
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                   fontSize: 14.sp,
//                                   color: const Color(0xFFC1B2B2),
//                                 ),
//                                 textAlign: TextAlign.right,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15.h),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 750),
//                         child: ButtonBuilder(
//                           // image:"assets/images/SignInAR.png",
//                           image: HiveStorage.get(HiveKeys.isArabic)
//                               ? "assets/images/SignInAR.png"
//                               : "assets/images/SignIn.png",
//                           text: "",
//                           onTap: () async {
//                             if (cubit.formKeyLogin.currentState!.validate()) {
//                               cubit.validateUser(cubit.emailController.text,
//                                   cubit.passwordController.text);
//                             } else {
//                               showCenteredSnackBar(context,lang.fill_all_fields);
//                               // ScaffoldMessenger.of(context).showSnackBar(
//                               //
//                               //     SnackBar(
//                               //
//                               //         content: Center(child: Text(lang.fill_all_fields))));
//                             }
//                           },
//                           width: 220.w,
//                           height: 55.h,
//                         ),
//                       ),
//                       SizedBox(height: 20.h),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 800),
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0.sp),
//                           child: Row(
//                             children: [
//                               const Expanded(
//                                   child: Divider(
//                                       color: Colors.white, thickness: 1)),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8.h),
//                                 child: Text(lang.or,
//                                     style: theme.textTheme.titleMedium),
//                               ),
//                               const Expanded(
//                                   child: Divider(
//                                       color: Colors.white, thickness: 1)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 850),
//                         child: Padding(
//                           padding: EdgeInsets.all(16.0.sp),
//                           child: SignInPart(
//                             onTap: () {
//                               // cubit.loginWithFacebook();
//                             },
//                             title: lang.continue_with_facebook,
//                             imagePath: "assets/images/facebook.png",
//                           ),
//                         ),
//                       ),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 900),
//                         child: Padding(
//                           padding: EdgeInsets.all(16.0.sp),
//                           child: SignInPart(
//                             onTap: () {
//                               cubit.signInWithGoogle();
//                             },
//                             title: lang.continue_with_google,
//                             imagePath: "assets/images/mdi_google.png",
//                           ),
//                         ),
//                       ),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 950),
//                         child: Padding(
//                           padding: EdgeInsets.all(16.0.sp),
//                           child: SignInPart(
//                             onTap: () {
//                               HiveStorage.saveDefaultUser(UserModel(
//                                   name: "guest",
//                                   email: '-',
//                                   password: '-',
//                                   dateOfBirth: '-',
//                                   image: ''));
//                               HiveStorage.set(
//                                   HiveKeys.role, Role.guest.toString());
//                               navigateAndRemoveUntil(
//                                   context: context, screen: const HomeLayout());
//                             },
//                             title: lang.continue_as_guest,
//                             imagePath: "assets/images/Vector.png",
//                           ),
//                         ),
//                       ),
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 1000),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               lang.no_account,
//                               style: theme.textTheme.bodySmall!
//                                   .copyWith(fontSize: 17.sp),
//                             ),
//                             SizedBox(width: 5.w),
//                             InkWell(
//                               onTap: () {
//                                 cubit.emailController.clear();
//                                 cubit.passwordController.clear();
//                                 navigateAndReplace(
//                                   context: context,
//                                   screen: const SignUp(),
//                                 );
//                               },
//                               child: Text(
//                                 lang.sign_up,
//                                 style: theme.textTheme.labelLarge!
//                                     .copyWith(fontSize: 17.sp),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       SizedBox(height: 25.h),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           BlocBuilder<AuthCubit, AuthState>(
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
// }

// void showCenteredSnackBar(BuildContext context, String message) {
//   final overlay = Overlay.of(context);
//   final overlayEntry = OverlayEntry(
//     builder: (context) => Center(
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 20.w, // استخدام ScreenUtil للـ horizontal padding
//             vertical: 12.h, // استخدام ScreenUtil للـ vertical padding
//           ),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.8),
//             borderRadius: BorderRadius.circular(8.r), // استخدام ScreenUtil للـ borderRadius
//           ),
//           child: Text(
//             message,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14.sp, // استخدام ScreenUtil للـ fontSize
//             ),
//           ),
//         ),
//       ),
//     ),
//   );

//   // إظهار الـ SnackBar
//   overlay.insert(overlayEntry);

//   // إخفاء الـ SnackBar بعد 3 ثواني
//   Future.delayed(Duration(seconds: 3), () {
//     overlayEntry.remove();
//   });
// }