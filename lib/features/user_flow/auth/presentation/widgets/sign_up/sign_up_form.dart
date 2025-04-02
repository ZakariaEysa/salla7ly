import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:salla7ly/features/user_flow/auth/presentation/views/sign_up_view.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:salla7ly/utils/validation_utils.dart';
import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/label_text.dart';
import '../../widgets/page_title.dart';
import '../sign_up_row.dart';
import 'birth_date_selector.dart';
import 'upload_id_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(text: S.of(context).nameLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: _userNameController,
              validator: (value) {
                return ValidationUtils.validateName(value, context);
              },
              prefixWidget: Image.asset("assets/icons/user.png"),
              hintText: S.of(context).nameHint,
            ),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).emailLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: _emailController,
              validator: (value) {
                return ValidationUtils.validateEmail(value, context);
              },
              prefixWidget: Image.asset("assets/icons/emailIcon.png"),
              hintText: S.of(context).emailHint,
            ),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).passwordLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: _passwordController,
              validator: (value) {
                return ValidationUtils.validatePassword(value, context);
              },
              prefixWidget: Image.asset("assets/icons/lockIcon.png"),
              suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
              // prefixIcon: Icons.lock_outline,
              hintText: S.of(context).passwordHint,
              isPassword: true,
              obscureText: _obscurePassword,
              onTogglePasswordVisibility: _togglePasswordVisibility,
            ),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).confirmPasswordLabel),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: _confirmPasswordController,
              validator: (value) {
                return ValidationUtils.validateConfirmPassword(
                    value, context, _passwordController.text);
              },
              prefixWidget: Image.asset("assets/icons/lockIcon2.png"),
              suffixWidget: Image.asset("assets/icons/EyeIcon.png"),
              hintText: S.of(context).confirmPasswordHint,
              isPassword: true,
              obscureText: _obscureConfirmPassword,
              onTogglePasswordVisibility: _toggleConfirmPasswordVisibility,
            ),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).birthDateLabel),
            SizedBox(height: 10.h),
            const BirthDateSelector(),
            SizedBox(height: 20.h),
            LabelText(text: S.of(context).uploadIdLabel),
            SizedBox(height: 10.h),
            const UploadIdButton(),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Implement sign up logic
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  S.of(context).signUpButton,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SignUpRow(
              navigationWidget: const SignInScreen(),
              text: S.of(context).signIn,

              // التنقل إلى صفحة اختيار نوع الحساب
            ),
          ],
        ),
      ),
    );
  }
}
