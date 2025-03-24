// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../../generated/l10n.dart';

// class CountdownTimer extends StatefulWidget {
//   final int startSeconds;
//   final VoidCallback onResend;

//   const CountdownTimer({
//     Key? key,
//     this.startSeconds = 59,
//     required this.onResend,
//   }) : super(key: key);

//   @override
//   State<CountdownTimer> createState() => _CountdownTimerState();
// }

// class _CountdownTimerState extends State<CountdownTimer> {
//   late int remainingSeconds;
//   Timer? timer;
//   bool showResend = false;
//   int resendCount = 0;
//   static const int maxResendLimit = 2;

//   @override
//   void initState() {
//     super.initState();
//     resetTimer();
//     _initializeResendCount();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future<void> _initializeResendCount() async {
//     final prefs = await SharedPreferences.getInstance();
//     final currentDate = DateTime.now().toString().split(' ')[0]; // YYYY-MM-DD
//     final storedDate = prefs.getString('resend_date');
//     if (storedDate != currentDate) {
//       // Reset count if date has changed
//       await prefs.setString('resend_date', currentDate);
//       await prefs.setInt('resend_count', 0);
//     }
//     setState(() {
//       resendCount = prefs.getInt('resend_count') ?? 0;
//     });
//   }

//   Future<void> _incrementResendCount() async {
//     final prefs = await SharedPreferences.getInstance();
//     resendCount++;
//     await prefs.setInt('resend_count', resendCount);
//   }

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (remainingSeconds > 0) {
//         setState(() {
//           remainingSeconds--;
//         });
//       } else {
//         timer.cancel();
//         setState(() {
//           showResend = true;
//         });
//       }
//     });
//   }

//   void resetTimer() {
//     setState(() {
//       remainingSeconds = widget.startSeconds;
//       showResend = false;
//     });
//     timer?.cancel();
//     startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var lang = S.of(context);
//     return showResend
//         ? (resendCount < maxResendLimit
//             ? TextButton(
//                 onPressed: () async {
//                   await _incrementResendCount();
//                   widget.onResend();
//                   resetTimer();
//                 },
//                 child:  Text(
//                   lang.Resend,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               )
//             :  Text(
//                 lang.Resendlimitreachedfortoday,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.red,
//                 ),
//               ))
//         : Text(
//             _formatTime(remainingSeconds),
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             ),
//           );
//   }

//   String _formatTime(int seconds) {
//     final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
//     final secs = (seconds % 60).toString().padLeft(2, '0');
//     return "$minutes:$secs";
//   }
// }
