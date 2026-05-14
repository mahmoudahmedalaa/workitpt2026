// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> zh_CN = {
    "loginText": "登录",
    "descriptionText": "qǐng shūrù yòngyú Sayapatri kǎ zhùcè de shǒujīhàomǎ",
    "rememberMe": "qǐng",
    "User": "qǐn"
  };
  static const Map<String, dynamic> en_US = {
    "loginText": "Login",
    "descriptionText":
        "Please enter the mobile number used for Sayapatri Card registration",
    "rememberMe": "Remember me",
    "User": "User"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "zh_CN": zh_CN,
    "en_US": en_US
  };
}
