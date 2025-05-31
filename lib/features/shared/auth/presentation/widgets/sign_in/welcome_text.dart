import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// كلاس لنص الترحيب
class WelcomeText extends StatelessWidget {
  final String text;

  const WelcomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(text,
        style: GoogleFonts.vollkorn(
          color: theme.textTheme.bodyMedium?.color,
          fontWeight: FontWeight.w500,
          fontSize: 19.sp,
        ));
  }
}
