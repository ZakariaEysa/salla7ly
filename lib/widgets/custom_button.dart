// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    this.text,
    this.onTap,
  }) : super(key: key);

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
                  gradient: LinearGradient(
                    begin: Alignment(0.50, 0.00),
                    end: Alignment(1.07, 1.00),
                    colors: [Color(0xFF0138FD), Color(0xFF0FF0FF)],
                  ),
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
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),
        SizedBox(width: 8.0),
        if (text == null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              decoration: ShapeDecoration(
                color: Color(0xFFF3F9FF),
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
