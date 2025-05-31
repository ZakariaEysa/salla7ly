import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import 'config/app_router.dart';
import 'config/language_bloc/switch_language_bloc.dart';
import 'data/hive_keys.dart';
import 'data/hive_storage.dart';
import 'features/craft_man_flow/auth/domain/repos/craft_auth_repo.dart';
import 'features/craft_man_flow/auth/presentation/cubit/cubit/craft_auth_cubit.dart';
import 'features/shared/auth/domain/repos/auth_repo.dart';
import 'features/shared/auth/presentation/cubit/auth_cubit.dart';
import 'features/user_flow/auth/domain/repos/user_auth_repo.dart';
import 'features/user_flow/auth/presentation/cubit/cubit/user_auth_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'services/simple_bloc_observer_service.dart';
import 'utils/app_logs.dart';
import 'utils/di.dart';
import 'widgets/application_theme/application_theme.dart';
import 'widgets/application_theme/theme_provider.dart';

//  client id
//968497369177-jm8e12fp5ll1n7e710tmvd5r69uqcm6j.apps.googleusercontent.com
Future<void> requestGalleryPermission() async {
  final status = await Permission.photos.request(); // iOS
  // لو Android استخدم Permission.storage
  // final status = await Permission.storage.request();

  if (status.isGranted) {
    debugPrint('تم منح الإذن للوصول إلى الصور');
  } else if (status.isDenied) {
    debugPrint('تم رفض الإذن، تقدر تطلبه تاني لاحقًا');
  } else if (status.isPermanentlyDenied) {
    debugPrint('تم رفض الإذن بشكل دائم، افتح الإعدادات يدويًا');
    await openAppSettings();
  }
}

ThemeMode getThemeMode(bool isDark) =>
    isDark ? ThemeMode.dark : ThemeMode.light;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SimpleBlocObserverService();

  await HiveStorage.init();
  configureDependencies();
  await requestGalleryPermission();
  AppLogs.infoLog(': ${HiveStorage.get(HiveKeys.accessToken)}');
  AppLogs.infoLog(': ${HiveStorage.get(HiveKeys.refreshToken)}');
  AppLogs.infoLog(': ${HiveStorage.get(HiveKeys.email)}');
  AppLogs.infoLog(': ${HiveStorage.get(HiveKeys.id)}');
  AppLogs.infoLog(': ${HiveStorage.get(HiveKeys.username)}');
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
    MultiBlocProvider(
      providers: [
        BlocProvider<CraftAuthCubit>(
            create: (context) => CraftAuthCubit(getIt<CraftAuthRepo>())),
        BlocProvider<UserAuthCubit>(
            create: (context) => UserAuthCubit(getIt<UserAuthRepo>())),
        BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(getIt<AuthRepo>())),
      ],
      child: DevicePreview(
        enabled: kDebugMode,
        builder: (context) => BlocProvider<SwitchLanguageCubit>(
          create: (context) => SwitchLanguageCubit(),
          child: const ProviderScope(
            child: MyApp(),
          ),
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
            return MaterialApp.router(
              routerConfig: AppRouter.router,
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
