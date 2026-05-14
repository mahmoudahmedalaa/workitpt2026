import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workitpt/core/injection/injection.dart';

import '../../core/routes/app_router.dart';
import '../../gen/assets.gen.dart';
import '../authentication/session/i_session_manager.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final splashDelay = 3;

  @override
  void initState() {
    _checkFirstRun();
    loadWidget();
    super.initState();
  }

  bool isFirstRun = true;

  Timer loadWidget() {
    final duration = Duration(seconds: splashDelay);
    return Timer(
        duration,
        () => isFirstRun
            ? context.router.replace(const OnBoardingRoute())
            : context.router.replace(LoginRoute()));
  }

  _checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstRun = prefs.getBool('firstRun') ?? true;
    if (firstRun) {
      prefs.setBool('firstRun', false);
      getIt<ISessionManager>().clearSession();
    } else {
      debugPrint('The app has been run before.');
    }
    setState(() {
      isFirstRun = firstRun;
    });
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Image.asset(
          Assets.icons.logoPng.path,
          height: 200,
          width: 340,
        ),
      );
}
