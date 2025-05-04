import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/features/shared/auth/presentation/views/sign_in.dart';
import '../../../data/hive_keys.dart';
import '../../../data/hive_storage.dart';
import '../../../utils/navigation.dart';
import '../../../widgets/scaffold/scaffold_f.dart';
import '../auth/presentation/views/home_screen.dart';
import '../on_boarding/presentation/views/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (HiveStorage.get(
            HiveKeys.passUserOnboarding,
          ) ==
          true) {
        navigateAndReplace(context: context, screen: const SignInScreen());
      } else {
        navigateAndReplace(context: context, screen: const OnBoarding());
      }
    });
    super.initState();
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
