import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sizer/sizer.dart';
import 'config/app_env.dart';
import 'config/app_theme.dart';
import 'core/constants/app_colors.dart';
import 'core/export.dart';
import 'core/injection/injection.dart';
import 'core/routes/app_router.dart';
import 'core/widgets/localization/bloc/localization_bloc.dart';
import 'core/widgets/theme/bloc/theme_switch_bloc.dart';
import 'features/authentication/session/i_session_manager.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const flavor = String.fromEnvironment('flavor');
  try {
    await Firebase.initializeApp(
      name: 'Workitpt',
      options: flavor == Environment.dev
          ? DefaultFirebaseOptions.devCurrentPlatform
          : DefaultFirebaseOptions.releaseCurrentPlatform,
    ).timeout(const Duration(seconds: 4));
  } catch (e) {
    debugPrint('Firebase skipped for demo build: $e');
  }
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = colorPrimary
    ..backgroundColor = lightPrimary
    ..indicatorColor = colorPrimary
    ..textColor = colorPrimary
    ..maskColor = Colors.black
    ..userInteractions = true
    ..dismissOnTap = false;

  EasyLocalization.logger.enableBuildModes = [];
  EasyLoading.instance.dismissOnTap = false;
  await AppEnv().startDevelopment();
  runApp(
    EasyLocalization(
      child: const MyApp(),
      assetLoader: const CodegenLoader(),
      supportedLocales: const [Locale('en', 'US'), Locale('zh', 'CN')],
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      path: 'assets/translations',
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final sessionManager = getIt<ISessionManager>();

  final _appRouter = AppRouter(getIt<ISessionManager>());

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ThemeSwitchBloc>(
            create: (_) => ThemeSwitchBloc(sessionManager)
              ..add(const ThemeSwitchEvent.getCurrentThemeEvent()),
          ),
          BlocProvider<LocalizationBloc>(
            create: (_) => LocalizationBloc(sessionManager)
              ..add(const LocalizationEvent.getCurrentLanguage()),
          )
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const SizedBox(),
            builder: (_, extendedNav) {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
                builder: (_, state) => MaterialApp.router(
                  key: ValueKey('${context.locale}'),
                  debugShowCheckedModeBanner: false,
                  theme: state.switchValue
                      ? AppThemes.appThemeData[AppTheme.darkTheme]
                      : AppThemes.appThemeData[AppTheme.lightTheme],
                  themeMode: ThemeMode.light,
                  builder: EasyLoading.init(),
                  routerConfig: _appRouter.config(),
                ),
              );
            },
          ),
        ),
      );
}
