import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
        ? TextButton(
            onPressed: () {
              widget.onResend();
              resetTimer();
            },
            child: Text(
              lang.resend,
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
            ),
          )
        : Text(
            _formatTime(remainingSeconds),
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
          );
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
