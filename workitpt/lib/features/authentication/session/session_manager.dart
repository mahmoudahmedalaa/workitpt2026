import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/super_keys.dart';
import '../login/data/models/user_model.dart';
import 'i_session_manager.dart';

const String LANGUAGE_CODE = 'languageCode';

@Injectable(as: ISessionManager)
class SessionManager implements ISessionManager {
  final FlutterSecureStorage _secureStorage;

  SessionManager(this._secureStorage);

  @override
  Future<String?> getToken() {
    try {
      return _secureStorage.read(key: SuperKeys.tokenKey);
      // return Future.value(
      //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTA0MDJkMTQzODM5ZTRjYWFmZmEyYmIiLCJpYXQiOjE2OTUxMDY2OTUsImV4cCI6MTY5NTE5MzA5NSwiYXVkIjoiW29iamVjdCBPYmplY3RdIiwiaXNzIjoiV29ya0l0UFQifQ.KpJRWcytSF2rfHbJ7CUfrISCuky_1IqoYujlyuOd5EA');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveToken({required String accessToken}) async {
    try {
      await _secureStorage.write(key: SuperKeys.tokenKey, value: accessToken);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    try {
      final token = await getToken();
      if (token != null) {
        return !Jwt.isExpired(token);
      }

      return false;
    } on Exception {
      return false;
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      await _secureStorage.delete(key: SuperKeys.userSecret);
      await _secureStorage.delete(key: SuperKeys.tokenKey);
      await _secureStorage.delete(key: SuperKeys.userKey);
      debugPrint('session cleared successfully!!');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveCurrentUser({UserModel? user}) async {
    try {
      await _secureStorage.write(
        key: SuperKeys.userKey,
        value: json.encode(user),
      );
      debugPrint('User ${user?.name} saved in local storage.');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final stringUser = await _secureStorage.read(key: SuperKeys.userKey);
      if (stringUser != null) {
        final user =
            UserModel.fromJson(json.decode(stringUser) as Map<String, dynamic>);
        debugPrint('User ${user.name} reading from local storage.');

        return Future.value(user);
      }

      return null;
    } on Exception {
      await _secureStorage.delete(key: SuperKeys.userKey);
      rethrow;
    }
  }

  Future<bool> isBiometricsEnabled() async {
    final response = await _secureStorage.read(key: SuperKeys.userBiometricKey);

    return response != null;
  }

  Future<void> clearBiometrics() async {
    try {
      await _secureStorage.delete(key: SuperKeys.userBiometricKey);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllPreviousSearchHistory() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(SuperKeys.searchHistoryDate);
    await sharedPreferences.remove(SuperKeys.searchHistoryName);
  }

  @override
  Future<void> saveCurrentSearchItem(String searchItem) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (searchItem.trim().isNotEmpty) {
        final nameHistoryList =
            sharedPreferences.getStringList(SuperKeys.searchHistoryName) ?? [];
        final dateHistoryList =
            sharedPreferences.getStringList(SuperKeys.searchHistoryDate) ?? [];
        nameHistoryList.add(searchItem);
        dateHistoryList.add(DateTime.now().toString());
        await sharedPreferences.setStringList(
          SuperKeys.searchHistoryName,
          nameHistoryList,
        );
        await sharedPreferences.setStringList(
          SuperKeys.searchHistoryDate,
          dateHistoryList,
        );
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> getTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final response = sharedPreferences.getBool(
      SuperKeys.SAVE_THEME,
    );
    return response ?? false;
  }

  @override
  Future<void> saveTheme({bool isDarkTheme = false}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // final response =
    await sharedPreferences.setBool(SuperKeys.SAVE_THEME, isDarkTheme);
  }

  @override
  Future<bool> get isDark => throw UnimplementedError();

  @override
  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(LANGUAGE_CODE) ?? 'en';
    return Locale(languageCode);
  }

  @override
  Future<Locale> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LANGUAGE_CODE, locale.languageCode);
    return Locale(locale.countryCode!, locale.languageCode);
  }

  @override
  Future<String?> getHeaderSecret() {
    try {
      return _secureStorage.read(key: SuperKeys.headerSecret);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<String?> getQuerySecret() {
    try {
      return _secureStorage.read(key: SuperKeys.querySecret);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<String?> getUserSecret() async {
    try {
      final val = await _secureStorage.read(key: SuperKeys.userSecret);

      return val;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveHeaderSecret({required String headerSecret}) async {
    try {
      await _secureStorage.write(
          key: SuperKeys.headerSecret, value: headerSecret);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveQuerySecret({required String querySecret}) async {
    try {
      await _secureStorage.write(
          key: SuperKeys.querySecret, value: querySecret);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveUserSecret({required String userSecret}) async {
    try {
      await _secureStorage.write(key: SuperKeys.userSecret, value: userSecret);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<bool?> isTrainer() async {
    try {
      final stringUser = await _secureStorage.read(key: SuperKeys.userKey);
      if (stringUser != null) {
        final user =
            UserModel.fromJson(json.decode(stringUser) as Map<String, dynamic>);
        debugPrint('User ${user.name} reading from local storage.');

        return Future.value(user.role?.toLowerCase() == 'trainer');
      }

      return null;
    } on Exception {
      await _secureStorage.delete(key: SuperKeys.userKey);
      rethrow;
    }
  }

  @override
  Future<String?> getFCMToken() {
    try {
      return _secureStorage.read(key: SuperKeys.fcmToken);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> saveFCMToken({required String fcmToken}) async {
    try {
      await _secureStorage.write(key: SuperKeys.fcmToken, value: fcmToken);
    } on Exception {
      rethrow;
    }
  }

// @override
// Future<void> saveTheme({required bool isThemeDark}) async {

// }
}
