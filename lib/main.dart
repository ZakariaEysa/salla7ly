import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'utils/app_logs.dart';
import 'data/hive_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'services/simple_bloc_observer_service.dart';
import 'config/language_bloc/switch_language_bloc.dart';
import 'data/hive_keys.dart';
import 'features/user_flow/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/application_theme/application_theme.dart';
import 'widgets/application_theme/theme_provider.dart';

ThemeMode getThemeMode(bool isDark) =>
    isDark ? ThemeMode.dark : ThemeMode.light;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SimpleBlocObserverService();

  await HiveStorage.init();

  // HiveStorage.set(HiveKeys.passUserOnboarding, false);

  if (HiveStorage.get(HiveKeys.passUserOnboarding) == null) {
    HiveStorage.set(HiveKeys.passUserOnboarding, false);
  }

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(HiveKeys.isArabic, false);
  }

  AppLogs.infoLog('isDark: ${HiveStorage.get(HiveKeys.isDark)}');
  if (HiveStorage.get(HiveKeys.isDark) == null) {
    HiveStorage.set(HiveKeys.isDark, true);
  }

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => BlocProvider<SwitchLanguageCubit>(
        create: (context) => SwitchLanguageCubit(),
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);

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
              theme: ApplicationTheme.lightTheme,
              darkTheme: ApplicationTheme.darkTheme,
              themeMode: getThemeMode(isDark),
              title: "",
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
              builder: (context, child) {
                return DevicePreview.appBuilder(context, child);
              },
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}
