import 'package:firebase_messaging/firebase_messaging.dart';

import '../../features/authentication/session/i_session_manager.dart';

class NotificationConfig {
  final ISessionManager sessionManager;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings? settings;
  String? token;

  NotificationConfig(this.sessionManager);
  Future<void> getPermissions() async {
    settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    token = await messaging.getToken();

    await sessionManager.saveFCMToken(fcmToken: token!);

    print('User granted permission: ${settings?.authorizationStatus}');
    print('FCM Token: $token');
  }
}
