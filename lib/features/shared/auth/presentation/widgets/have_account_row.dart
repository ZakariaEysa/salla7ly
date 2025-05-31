import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/app_logs.dart';

class AccountRow extends StatelessWidget {
  const AccountRow(
      {Key? key,
      required this.text,
      required this.navigationRoute,
      required this.title,
      this.isReplace = false})
      : super(key: key);
  final String text;
  final String title;
  final String navigationRoute;
  final bool isReplace; // Whether to replace the current route or push
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
            if (isReplace) {
              context.go(navigationRoute);
            } else {
              context.push(navigationRoute);
            }
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
