// import 'package:bot_toast/bot_toast.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../../../../data/hive_keys.dart';
// import '../../../../../data/hive_stroage.dart';
// import '../cubit/auth_cubit.dart';
// import 'otp.dart';
// import 'sign_in.dart';
// import '../../../../../utils/navigation.dart';

// import '../../../../../generated/l10n.dart';
// import '../../../../../utils/validation_utils.dart';
// import '../../../../../widgets/button/button_builder.dart';
// import '../../../../../widgets/scaffold/scaffold_f.dart';
// import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
// import '../../data/remote_data_source/auth_remote_data_source.dart';
// import '../../data/repos_impl/auth_repo_impl.dart';
// import 'new_password.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});

//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {
//   GlobalKey<FormState> formKeyForgot = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     AuthCubit cubit = AuthCubit.get(context);

//     var lang = S.of(context);
//     return ScaffoldF(
//       appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               navigateAndRemoveUntil(
//                 context: context,
//                 screen: BlocProvider<AuthCubit>(
//                   create: (context) => AuthCubit(AuthRepoImpl(
//                       AuthRemoteDataSourceImpl(
//                           FirebaseAuth.instance, GoogleSignIn()))),
//                   child: SignIn(),
//                 ),
//               );
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//               size: 25,
//             ),
//           ),
//           backgroundColor: const Color(0xFF2E1371),
//           title: Text(
//             lang.forgetPassword,
//             style: theme.textTheme.labelLarge!.copyWith(fontSize: 28.sp),
//           ),
//           titleSpacing: 30.0),
//       body: Form(
//         key: formKeyForgot,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 50.h),
//                 child: Image.asset(
//                   "assets/images/forget.png",
//                   width: 242.w,
//                   height: 250.h,
//                 ),
//               ),
//               SizedBox(
//                 height: 50.h,
//               ),
//               Text(lang.pleaseEnterYourEmailToReceiveAVerificationCard,
//                   style: theme.textTheme.bodyMedium!.copyWith(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center),
//               SizedBox(
//                 height: 50.h,
//               ),
//               TextFormFieldBuilder(
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return lang.enterEmailAddress;
//                   }
//                   if (!isValidEmail(value)) {
//                     return lang.invalidEmailFormat;
//                   }
//                   return null;
//                 },
//                 width: 312.w,
//                 height: 80.h,
//                 controller: cubit.emailController,
//                 type: TextInputType.emailAddress,
//                 obsecure: false,
//                 label: "Email",
//                 imagePath: "assets/images/email 2.png",
//                 color: Color(0xFF1E126E),
//               ),
//               SizedBox(
//                 height: 60.h,
//               ),
//               ButtonBuilder(
//                 width: 191.w,
//                 height: 48.h,
//                 image: HiveStorage.get(HiveKeys.isArabic)
//                     ? "assets/icons/send11_arabic.png"
//                     : "assets/icons/send11.png",
//                 text: '',
//                 onTap: () async {
//                   if (!formKeyForgot.currentState!.validate()) return;
//                   if (isValidEmail(cubit.emailController.text)) {
//                   } else {
//                     BotToast.showText(text: lang.enter_valid_email);
//                     return;
//                   }

// // TODO: check if the user exists or not first
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

//   BotToast.showText(text: " something went wrong please check your network");


// }
//                 } ,
//               ),
//               SizedBox(
//                 height: 60.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
