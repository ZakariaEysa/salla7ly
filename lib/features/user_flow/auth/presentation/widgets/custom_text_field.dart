import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// كلاس لحقل الإدخال المخصص
class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final bool isPassword;
  final bool? obscureText;
  final VoidCallback? onTogglePasswordVisibility;

  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.isPassword = false,
    this.obscureText,
    this.onTogglePasswordVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.w,
        ),
        color: const Color(0xFF0D2249).withOpacity(0.5),
      ),
      child: TextFormField(
        obscureText: isPassword && obscureText != null ? obscureText! : false,
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 16.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Icon(
              prefixIcon,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 60.w),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText!
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                  onPressed: onTogglePasswordVisibility,
                )
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
