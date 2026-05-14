// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/super_keys.dart';
import 'i_app_manager.dart';

@Injectable(as: IAppManager)
class AppManager implements IAppManager {
  SharedPreferences sharedPreferences;

  AppManager(this.sharedPreferences);

  @override
  Future<bool> isAppFirstTime() async {
    try {
      final result = sharedPreferences.getBool(SuperKeys.isAppFirstTime);
      if (result != null) {
        return result;
      }

      return Future.value(true);
    } on Exception {
      return Future.value(false);
    }
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    try {
      await sharedPreferences.setBool(SuperKeys.isAppFirstTime, value);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<String?> getDeviceIpAddress() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      return sharedPreferences.getString('currentIP');
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> initiateDeviceIpAddress() async {
    try {
      final dio = Dio();
      final sharedPreferences = await SharedPreferences.getInstance();
      // ignore: inference_failure_on_function_invocation
      final response = await dio.get('https://api.ipify.org/?format=json');
      if (response.statusCode == 200) {
        // ignore: avoid_dynamic_calls
        final currentIP = response.data['ip'] as String;
        await sharedPreferences.setString('currentIP', currentIP);
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  bool getBool({required String key, bool defValue = false}) {
    try {
      final result = sharedPreferences.getBool(key);
      if (result != null) {
        return result;
      }

      return defValue;
    } on Exception {
      return defValue;
    }
  }
}
