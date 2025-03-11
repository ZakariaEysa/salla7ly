import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'data/hive_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'services/simple_bloc_observer_service.dart';
import 'config/language_bloc/switch_language_bloc.dart';
import 'data/hive_keys.dart';
import 'features/user_flow/Splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SimpleBlocObserverService();

  await HiveStorage.init();

  if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
    HiveStorage.set(HiveKeys.passUserOnboarding, false);
  }

  // GoogleUserModel? currentUser = HiveStorage.getGoogleUser();
  // UserModel? currentUser2 = HiveStorage.getDefaultUser();

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(HiveKeys.isArabic, false);
  }
  // HiveStorage.set(HiveKeys.passUserOnboarding, false);

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      // enabled: false,
      builder: (context) => BlocProvider<SwitchLanguageCubit>(
        create: (context) => SwitchLanguageCubit(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchLanguageCubit, SwitchLanguageState>(
        builder: (context, state) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          ensureScreenSize: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              // theme: ApplicationTheme.darkTheme,
              locale: HiveStorage.get(HiveKeys.isArabic)
                  ? const Locale('ar')
                  : const Locale('en'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              // builder: DevicePreview.appBuilder,
              builder: (context, child) {
                return DevicePreview.appBuilder(context, child);
              },
              // navigatorObservers: [BotToastNavigatorObserver()],
              home: const SplashScreen(),
            );
          });
    });
  }
}
