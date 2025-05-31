import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../config/app_router.dart';
import '../../../data/hive_keys.dart';
import '../../../data/hive_storage.dart';
import '../../../widgets/scaffold/scaffold_f.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      final bool hasCompletedOnboarding =
          HiveStorage.get(HiveKeys.passUserOnboarding) ?? false;

      if (!hasCompletedOnboarding) {
        context.go(AppRouter.onboarding);
      } else {
        context.go(AppRouter.signIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ScaffoldF(
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
          Text("Salla7ly", style: theme.textTheme.bodyLarge),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
