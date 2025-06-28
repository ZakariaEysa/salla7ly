import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../generated/l10n.dart';

class CountdownTimer extends StatefulWidget {
  final int startSeconds;
  final VoidCallback onResend;

  const CountdownTimer({
    super.key,
    this.startSeconds = 120,
    required this.onResend,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int remainingSeconds;
  Timer? timer;
  bool showResend = false;
  int resendCount = 0;
  static const int maxResendLimit = 2;

  @override
  void initState() {
    super.initState();
    resetTimer();
    _initializeResendCount();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> _initializeResendCount() async {
    final preferences = await SharedPreferences.getInstance();
    final currentDate = DateTime.now().toString().split(' ')[0]; // YYYY-MM-DD
    final storedDate = preferences.getString('resend_date');
    if (storedDate != currentDate) {
      // Reset count if date has changed
      await preferences.setString('resend_date', currentDate);
      await preferences.setInt('resend_count', 0);
    }
    setState(() {
      resendCount = preferences.getInt('resend_count') ?? 0;
    });
  }

  Future<void> _incrementResendCount() async {
    final preferences = await SharedPreferences.getInstance();
    resendCount++;
    await preferences.setInt('resend_count', resendCount);
  }
  

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          showResend = true;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      remainingSeconds = widget.startSeconds;
      showResend = false;
    });
    timer?.cancel();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    return showResend
        ? (resendCount < maxResendLimit
            ? TextButton(
                onPressed: () async {
                  await _incrementResendCount();
                  widget.onResend();
                  resetTimer();
                },
                child: Text(lang.resend,
                    style:
                        theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp)),
              )
            : Text(
                lang.resend_limit_reached_for_today,
                style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 18.sp,
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold),
              ))
        : Text(_formatTime(remainingSeconds),
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp));
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
