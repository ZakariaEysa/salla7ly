import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// كلاس لنص الترحيب
class WelcomeText extends StatelessWidget {
  final String text;

  const WelcomeText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: TextStyle(
        color: theme.textTheme.bodyMedium?.color,
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
