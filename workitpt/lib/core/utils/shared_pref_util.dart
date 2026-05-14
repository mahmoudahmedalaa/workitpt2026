import 'package:shared_preferences/shared_preferences.dart';

// ignore: always_declare_return_types, inference_failure_on_function_return_type, type_annotate_public_apis
addStringToPref(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

// ignore: always_declare_return_types, avoid_positional_boolean_parameters, inference_failure_on_function_return_type, type_annotate_public_apis
addBoolToPref(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

Future<String?> getStringPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final stringValue = prefs.getString(key);
  return stringValue;
}

Future<bool?> getBoolPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getBool(key);
  return value;
}

// ignore: always_declare_return_types, inference_failure_on_function_return_type, type_annotate_public_apis
clearAllPref() async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}
