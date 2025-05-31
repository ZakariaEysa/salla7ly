import 'package:go_router/go_router.dart';
import '../features/craft_man_flow/auth/presentation/views/craftsman_otp_screen.dart';
import '../features/shared/splash_screen/splash_screen.dart';
import '../features/shared/on_boarding/presentation/views/on_boarding.dart';
import '../features/shared/auth/presentation/views/sign_in_screen.dart';
import '../features/shared/auth/presentation/views/account_type_screen.dart';
import '../features/shared/auth/presentation/views/home_screen.dart';
import '../features/shared/auth/presentation/views/forgot_password_screen.dart';
import '../features/shared/auth/presentation/views/forgot_password_otp_screen.dart';
import '../features/shared/auth/presentation/views/new_password_screen.dart';
import '../features/user_flow/auth/presentation/views/user_sign_up_view.dart';
import '../features/user_flow/auth/presentation/views/user_otp.dart';
import '../features/craft_man_flow/auth/presentation/views/craftman_sign_up_view.dart';
import '../features/craft_man_flow/auth/presentation/views/national_id.dart';

/// App Router Configuration using GoRouter
class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/sign-in';
  static const String accountType = '/account-type';
  static const String home = '/home';
  static const String forgotPassword = '/forgot-password';
  static const String forgotPasswordOtp = '/forgot-password-otp';
  static const String newPassword = '/new-password';
  static const String userSignUp = '/user-signup';
  static const String userOtp = '/user-otp';
  static const String craftmanSignUp = '/craftman-signup';
  static const String craftmanOtp = '/craftman-otp';
  static const String nationalId = '/national-id';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      // Splash Screen Route
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding Route
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnBoarding(),
      ),

      // Authentication Routes
      GoRoute(
        path: signIn,
        name: 'signIn',
        builder: (context, state) => const SignInScreen(),
      ),

      GoRoute(
        path: accountType,
        name: 'accountType',
        builder: (context, state) => const AccountTypeScreen(),
      ),

      GoRoute(
        path: forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      GoRoute(
        path: forgotPasswordOtp,
        name: 'forgotPasswordOtp',
        builder: (context, state) => const ForgotPasswordOtpScreen(),
      ),

      GoRoute(
        path: newPassword,
        name: 'newPassword',
        builder: (context, state) => const NewPasswordScreen(),
      ),

      // User Flow Routes
      GoRoute(
        path: userSignUp,
        name: 'userSignUp',
        builder: (context, state) => const UserSignUpView(),
      ),

      GoRoute(
        path: userOtp,
        name: 'userOtp',
        builder: (context, state) => UserOtp(),
      ),

      // Craftman Flow Routes
      GoRoute(
        path: craftmanSignUp,
        name: 'craftmanSignUp',
        builder: (context, state) => const CraftManSignUpView(),
      ),

      GoRoute(
        path: craftmanOtp,
        name: 'craftmanOtp',
        builder: (context, state) => const CraftsmanOtpScreen(),
      ),

      GoRoute(
        path: nationalId,
        name: 'nationalId',
        builder: (context, state) {
          // Get parameters from the route state
          final extra = state.extra as Map<String, dynamic>?;
          return NationalId(
            text: extra?['text'] ?? 'Upload National ID',
            buttonText: extra?['buttonText'] ?? 'Continue',
            onTap: extra?['onTap'],
          );
        },
      ),

      // Home Route
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],

    // No automatic redirects - let screens handle their own navigation
    redirect: (context, state) {
      return null;
    },
  );
}
