import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_theme/theme_extention.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    this.text,
    this.onTap,
  });

  final double width;
  final double height;
  final String? text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (text != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
                width: width,
                height: height,
                decoration: ShapeDecoration(
                  gradient: theme.extension<GradientTheme>()?.buttonGradient,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                   const   Icon(Icons.arrow_forward)
                  ],
                )),
          ),
      const  SizedBox(width: 8.0),
        if (text == null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3F9FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF0062FF),
              ),
            ),
          ),
      ],
    );
  }
}
