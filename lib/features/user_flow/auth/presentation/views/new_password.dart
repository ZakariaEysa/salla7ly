
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'sign_in.dart';
// import '../../../../../utils/navigation.dart';
// import '../../../../../widgets/scaffold/scaffold_f.dart';

// import '../../../../../data/hive_keys.dart';
// import '../../../../../generated/l10n.dart';
// import '../../../../../utils/validation_utils.dart';
// import '../../../../../widgets/loading_indicator.dart';

// import 'forget.dart';

// class NewPassword extends StatefulWidget {
//   const NewPassword({super.key});

//   @override
//   State<NewPassword> createState() => _NewPasswordState();
// }

// class _NewPasswordState extends State<NewPassword> {
//   bool obscure = true;
//   bool obscure2 = true;
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     var lang = S.of(context);
//     return ScaffoldF(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF2E1371),
//           leading: IconButton(
//               onPressed: () {
//                 navigateTo(context: context, screen: ForgotPassword());
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//                 size: 25,
//               )),
//           title: Text(
//             lang.createNewPassword,
//             style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
//           ),
//           titleSpacing: 20,
//         ),
//         body: Stack(
//           children: [
//             BlocConsumer<AuthCubit, AuthState>(
//               listener: (context, state) {
//                 if (state is UpdatePasswordSuccess) {
//                   navigateAndRemoveUntil(
//                     context: context,
//                     screen: BlocProvider<AuthCubit>(
//                       create: (context) => AuthCubit(AuthRepoImpl(
//                           AuthRemoteDataSourceImpl(
//                               FirebaseAuth.instance, GoogleSignIn()))),
//                       child: SignIn(),
//                     ),
//                   );
//                   BotToast.showText(text: lang.password_updated_successfully);
//                 } else if (state is UpdatePasswordError) {
//                   BotToast.showText(
//                       text: lang.SorryThereWasAnErrorPleaseTryAgainLater);

//                   // BotToast.showText(text: state.errorMessage);
//                 }
//               },
//               builder: (context, state) {
//                 return Form(
//                   key: formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 50.h),
//                           child: Image.asset(
//                             "assets/images/image 14.png",
//                             width: 210.w,
//                             height: 207.h,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50.h,
//                         ),
//                         Text(
//                             lang.yourNewPasswordMustBeDifferentFromPreviouslyUsedPassword,
//                             style: theme.textTheme.bodyMedium!.copyWith(
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center),
//                         SizedBox(
//                           height: 50.h,
//                         ),
//                         TextFormFieldBuilder(
//                           validator: (text) {
//                             if (text == null || text.trim().isEmpty) {
//                               return lang.enterPassword;
//                             }
//                             if (!isValidPassword(text)) {
//                               return lang.password_validation;
//                             }
//                             return null;
//                           },
//                           width: 330.w,
//                           height: 80.h,
//                           controller: newPasswordController,
//                           type: TextInputType.visiblePassword,
//                           label: lang.newPassword,
//                           imagePath: "assets/images/padlock.png",
//                           color: Color(0xFF2E126E),
//                           obsecure: obscure,
//                           suffixIcon: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   obscure = !obscure;
//                                 });
//                               },
//                               child: Icon(
//                                 obscure
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: Colors.grey,
//                               )),
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         TextFormFieldBuilder(
//                           validator: (text) {
//                             if (text == null || text.trim().isEmpty) {
//                               return lang.enterConfirmPassword;
//                             }
//                             if (text != newPasswordController.text) {
//                               return lang.wrongConfirmPassword;
//                             }
//                             return null;
//                           },
//                           width: 330.w,
//                           height: 80.h,
//                           controller: confirmPasswordController,
//                           type: TextInputType.visiblePassword,
//                           label: lang.confirmPassword,
//                           hinitText: "",
//                           imagePath: "assets/icons/access (1).png",
//                           color: Color(0xFF2E126E),
//                           obsecure: obscure2,
//                           suffixIcon: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   obscure2 = !obscure2;
//                                 });
//                               },
//                               child: Icon(
//                                 obscure2
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: Colors.grey,
//                               )),
//                         ),
//                         SizedBox(
//                           height: 50.h,
//                         ),
//                         ButtonBuilder(
//                           width: 220.w,
//                           height: 52.h,
//                           image: HiveStorage.get(HiveKeys.isArabic)
//                               ? "assets/icons/save1_arabic.png"
//                               : "assets/icons/save1111.png",
//                           text: "",
//                           onTap: () async {
//                             if (!formKey.currentState!.validate()) return;

//                             AuthCubit cubit = AuthCubit.get(context);

//                             await cubit.updateUserPassword(
//                                 cubit.emailController.text,
//                                 newPasswordController.text);
//                           },
//                         ),
//                         SizedBox(
//                           height: 60.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             BlocBuilder<AuthCubit, AuthState>(
//               builder: (context, state) {
//                 if (state is UpdatePasswordLoading) {
//                   return const AbsorbPointer(
//                     absorbing: true,
//                     child: LoadingIndicator(),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ));
//   }
// }
