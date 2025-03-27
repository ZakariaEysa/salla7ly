import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// كلاس لحقل الإدخال المخصص
class CustomTextField extends StatelessWidget {
  final IconData? prefixIcon;
  final String hintText;
  final bool isPassword;
  final bool? obscureText;
  final TextEditingController? controller;
  final VoidCallback? onTogglePasswordVisibility;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? autofillHints;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.isPassword = false,
    this.obscureText,
    this.onTogglePasswordVisibility,
    this.controller,
    this.prefixWidget,
    this.suffixWidget,
    this.autofillHints,
    this.keyboardType,
    this.validator,
  });
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      autofillHints: autofillHints != null ? [autofillHints!] : null,
      cursorColor: theme.colorScheme.primary,
      controller: controller,
      obscureText: isPassword && obscureText != null ? obscureText! : false,
      style:
          TextStyle(color: theme.textTheme.bodyMedium?.color, fontSize: 18.sp),
      decoration: InputDecoration(
      
        hintText: hintText,
        hintStyle: theme.inputDecorationTheme.hintStyle,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
          child: SizedBox(
            width: 24.sp,
            height: 24.sp,
            child: prefixWidget ??
                Icon(
                  prefixIcon,
                  color: theme.textTheme.bodyMedium?.color,
                ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 20.w),
        suffixIconConstraints: BoxConstraints(minWidth: 20.w),
        suffixIcon: isPassword
            ? Padding(
                padding: EdgeInsetsDirectional.only(end: 10.w, start: 10.w),
                child: SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: GestureDetector(
                    onTap: onTogglePasswordVisibility,
                    child: suffixWidget ??
                        IconButton(
                          icon: Icon(
                            obscureText!
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                          onPressed: onTogglePasswordVisibility,
                        ),
                  ),
                ))
            : null,
        border: InputBorder.none,
        contentPadding: theme.inputDecorationTheme.contentPadding,
      ),
    );
  }
}
