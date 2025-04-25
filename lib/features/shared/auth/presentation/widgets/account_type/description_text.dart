import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// كلاس لعرض وصف نوع الحساب (مستخدم أو حرفي)
class DescriptionText extends StatelessWidget {
  final String text;

  const DescriptionText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: TextStyle(
        color: theme.textTheme.bodyMedium?.color,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}
