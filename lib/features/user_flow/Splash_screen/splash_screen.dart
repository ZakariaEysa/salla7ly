import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/utils/navigation.dart';

import '../onBoarding/presentation/views/OnBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      navigateAndReplace(context: context, screen: OnBoarding());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            fit: BoxFit.cover,
            "assets/images/Logo.png",
          ),
          SizedBox(
            height: 28.h,
          ),
          Text(
            "Salla7ly",
            style: TextStyle(
              color: theme.splashColor,
              fontSize: 50.sp,
            ),
          ),
          const Spacer(
            flex: 4,
          )
        ],
      ),
    );
  }
}

// class ThemeToggleScreenExample extends ConsumerWidget {
//   const ThemeToggleScreenExample({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isDark = ref.watch(themeProvider); // مراقبة حالة الثيم

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Theme Switcher"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Current Theme: ${isDark ? 'Dark' : 'Light'}",
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             SizedBox(height: 20.h),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(themeProvider.notifier).state = !isDark; 
//                 HiveStorage.set(
//                     HiveKeys.isDark, !isDark);
//               },
//               child: const Text("Toggle Theme"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
