import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salahly/utils/app_logs.dart';
import 'package:salahly/widgets/application_theme/applicaton_theme.dart'; // تأكد من المسار صحيح
import 'package:salahly/data/hive_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salahly/generated/l10n.dart';
import 'package:salahly/services/simple_bloc_observer_service.dart';
import 'package:salahly/config/language_bloc/switch_language_bloc.dart';
import 'package:salahly/data/hive_keys.dart';
import 'package:salahly/features/user_flow/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/application_theme/theme_provider.dart'; // استيراد ملف الثيم Provider

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

  if (HiveStorage.get(HiveKeys.isArabic) == null) {
    HiveStorage.set(HiveKeys.isArabic, false);
  }
  AppLogs.infoLog('isDark: ${HiveStorage.get(HiveKeys.isDark)}');
  // إضافة تخزين حالة الثيم في Hive (اختياري)
  if (HiveStorage.get(HiveKeys.isDark) == null) {
    HiveStorage.set(HiveKeys.isDark, true); // افتراضي Dark
  }

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => BlocProvider<SwitchLanguageCubit>(
        create: (context) => SwitchLanguageCubit(),
        child: ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  // تغيير إلى ConsumerWidget
  const MyApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // مراقبة حالة الثيم من Riverpod
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
              themeMode:
                  getThemeMode(isDark), // استخدام Riverpod للتحكم في الثيم
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

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    // هنا بنستخدم ConsumerWidget بدل State مباشرة
    return const MyApp();
  }
}
