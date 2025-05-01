import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FailureToast {
  const FailureToast();

  static void showToast(String message) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.sp,
        gravity: ToastGravity.CENTER,
        msg: message);
  }
}
