import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus; // أضف هذا
  final Function({required String value, required FocusNode focusNode})
      nextField;
  final bool autofocus;

  const OtpFieldWidget({
    Key? key,
    required this.controller,
    required this.currentFocus,
    required this.nextFocus,
    required this.nextField,
    this.previousFocus, // أضف هذا
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final keyboardFocusNode = FocusNode();
    return SizedBox(
      width: 55.h,
      child: KeyboardListener(
        // focusNode: currentFocus,
        focusNode: keyboardFocusNode,

        onKeyEvent: (event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace &&
              controller.text.isEmpty) {
            previousFocus?.requestFocus();
          }
        },
        child: TextField(
          controller: controller,
          focusNode: currentFocus,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          autofocus: autofocus,
          onChanged: (value) {
            if (value.isNotEmpty && nextFocus != null) {
              nextField(value: value, focusNode: nextFocus!);
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0x66000000), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colorScheme.primary),
            ),
            counterText: "",
          ),
          style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          maxLength: 1,
        ),
      ),
    );
  }
}
