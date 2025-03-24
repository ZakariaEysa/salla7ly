import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final Function({required String value, required FocusNode focusNode}) nextField;
  final bool autofocus; // إضافة خاصية التركيز التلقائي

  const OtpFieldWidget({
    Key? key,
    required this.controller,
    required this.currentFocus,
    required this.nextFocus,
    required this.nextField,
    this.autofocus = false, // قيمة افتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        autofocus: autofocus, // استخدام خاصية التركيز التلقائي
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (nextFocus != null) {
              nextFocus?.requestFocus();
            }
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2E1371),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0x66000000), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
          counterText: "",
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        textDirection: TextDirection.ltr, // Force left-to-right text direction
      ),
    );
  }
}
