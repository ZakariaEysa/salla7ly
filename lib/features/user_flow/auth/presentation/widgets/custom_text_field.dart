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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF182F4C),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: const Color(0xFF218C83),
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        shadows: [
          const BoxShadow(
            color: const Color(0x3F000000),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        autofillHints: autofillHints != null ? [autofillHints!] : null,
        cursorColor: Theme.of(context).colorScheme.primary,
        controller: controller,
        obscureText: isPassword && obscureText != null ? obscureText! : false,
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
        decoration: InputDecoration(
          // disabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xff218C83)),
          // ),

          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 16.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
            child: SizedBox(
              width: 24.sp,
              height: 24.sp,
              child: prefixWidget ??
                  Icon(
                    prefixIcon,
                    color: Colors.white,
                    // size: 22.sp,
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
                              color: Colors.white,
                            ),
                            onPressed: onTogglePasswordVisibility,
                          ),
                    ),
                  ))
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsetsDirectional.only(
            top: 20.h,
            bottom: 20.h,
            end: 20.w,
          ),
        ),
      ),
    );
  }
}
