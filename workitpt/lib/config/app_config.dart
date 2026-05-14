import 'package:injectable/injectable.dart';

@LazySingleton()
class AppConfig {
  late String appName;
  late String baseUrl;
  late String flavorName;
  late String headerSecret;
  late String querySecret;

  String getBaseUrl() => baseUrl;

  void initialize(
      {required String appName,
      required String baseUrl,
      required String flavorName,
      required String headerSecret,
      required String querySecret}) {
    this.appName = appName;
    this.baseUrl = baseUrl;
    this.flavorName = flavorName;
    this.headerSecret = headerSecret;
    this.querySecret = querySecret;
  }
}
