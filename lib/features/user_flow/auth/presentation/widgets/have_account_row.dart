import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

class AccountRow extends StatelessWidget {
  const AccountRow(
      {Key? key, required this.text, required this.navigationWidget, required this.title})
      : super(key: key);
  final String text;
  final String title;
  final Widget navigationWidget;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: theme.textTheme.bodyMedium?.color,
            fontSize: 20.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => navigationWidget,
              ),
            );
            // التنقل إلى صفحة اختيار نوع الحساب
          },
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.only(left: 8.w),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 20.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900,
              height: 1.10,
              letterSpacing: -0.41,
            ),
          ),
        ),
      ],
    );
  }
}
