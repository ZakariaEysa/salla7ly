import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPart extends StatelessWidget {
  final String title;
  const SignInPart(
      {super.key, required this.title, this.onTap, this.imagePath});

  final void Function()? onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 333.w, // تم تعديل العرض باستخدام ScreenUtil
        height: 57.h, // تم تعديل الارتفاع باستخدام ScreenUtil
        decoration: BoxDecoration(
          color: const Color(0xFF2D1468),
          borderRadius: BorderRadius.circular(
              40.sp), // تم تعديل الزوايا باستخدام ScreenUtil
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 30.w), // تم تعديل التباعد باستخدام ScreenUtil
          child: Row(
            children: [
              // تم إلغاء الكود المعطل للـ Icon
              Image.asset(
                imagePath!,
                width: 35.w, // تم تعديل العرض باستخدام ScreenUtil
                height: 35.h, // تم تعديل الارتفاع باستخدام ScreenUtil
              ),
              SizedBox(width: 20.w), // تم تعديل التباعد باستخدام ScreenUtil
              Text(
                title,
                style: theme.textTheme.labelLarge!.copyWith(
                    fontSize: 17.sp), // تم تعديل الحجم باستخدام ScreenUtil
              ),
            ],
          ),
        ),
      ),
    );
  }
}
