import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/injection/injection.dart';
import '../core/notifications/notification_config.dart';
import '../features/authentication/session/i_session_manager.dart';
import 'app_config.dart';

class AppEnv {
  Future<void> injectFlavor({String? flavor}) async {
    final flavor =
        await const MethodChannel('flavor').invokeMethod('getFlavor');
    debugPrint('Running Env $flavor');
    if (flavor == Environment.dev) {
      await startDevelopment();
    } else if (flavor == Environment.test) {
      await startUat();
    } else if (flavor == Environment.prod) {
      await startProduction();
    } else {
      await startDevelopment();
    }
  }

  Future<void> startDevelopment() async {
    await configureInjection(environment: Environment.dev);
    GetIt.I<AppConfig>().initialize(
      appName: 'DEV',
      flavorName: Environment.dev,
      baseUrl: 'https://workitpt-api.goswivt.com/api/v1',
      // baseUrl: 'https://3e55-103-10-29-166.ngrok-free.app/api/v1',
      headerSecret: 'a9284717ab78f00a0b539972710c7427',
      querySecret: 'b5c5dae9cb4caed79221a77f36c13a86',
      // port: 80,
    );
    await NotificationConfig(getIt<ISessionManager>()).getPermissions();
  }

  Future<void> startUat() async {
    await configureInjection(environment: Environment.test);
    GetIt.I<AppConfig>().initialize(
      appName: 'UAT',
      flavorName: 'uat',
      baseUrl: 'https://workitpt-api.goswivt.com/api/v1',
      headerSecret: 'a9284717ab78f00a0b539972710c7427',
      querySecret: 'b5c5dae9cb4caed79221a77f36c13a86',
    );
  }

  Future<void> startProduction() async {
    await configureInjection(environment: Environment.prod);
    GetIt.I<AppConfig>().initialize(
      appName: '',
      flavorName: Environment.prod,
      baseUrl: 'https://workitpt-api.goswivt.com/api/v1',
      headerSecret: 'a9284717ab78f00a0b539972710c7427',
      querySecret: 'b5c5dae9cb4caed79221a77f36c13a86',
    );
    await NotificationConfig(getIt<ISessionManager>()).getPermissions();
  }
}
