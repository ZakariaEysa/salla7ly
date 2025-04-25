import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لعرض عنوان صفحة اختيار نوع الحساب
class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      S.of(context).selectAccountType,
      style: TextStyle(
        color: theme.textTheme.headlineLarge?.color,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
