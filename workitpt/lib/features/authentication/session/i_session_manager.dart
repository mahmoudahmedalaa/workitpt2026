import 'dart:ui';

import '../login/data/models/user_model.dart';

abstract class ISessionManager {
  Future<void> saveToken({required String accessToken});

  Future<String?> getToken();
  Future<void> saveFCMToken({required String fcmToken});

  Future<String?> getFCMToken();

  Future<void> saveUserSecret({required String userSecret});

  Future<String?> getUserSecret();

  Future<void> saveHeaderSecret({required String headerSecret});

  Future<String?> getHeaderSecret();

  Future<void> saveQuerySecret({required String querySecret});

  Future<String?> getQuerySecret();

  Future<void> clearSession();

  Future<bool> get isDark;

  Future<void> saveCurrentUser({required UserModel user});

  Future<UserModel?> getCurrentUser();
  Future<bool?> isTrainer();

  Future<void> saveCurrentSearchItem(String searchItem);

  Future<void> deleteAllPreviousSearchHistory();

  Future<void> saveTheme({bool isDarkTheme});
  Future<bool> getTheme();

  Future<Locale> saveLocale(Locale locale);
  Future<Locale> getLocale();
  Future<bool> get isAuthenticated;
}
