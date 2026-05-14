import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';

import '../../config/app_config.dart';
import '../../features/authentication/session/i_session_manager.dart';
import '../constants/keys/app_keys.dart';
import 'custom_interceptor.dart';

@Named('httpConfig')
@Singleton(as: IHttpConfig)
class HttpConfig implements IHttpConfig {
  final AppConfig _appConfig;
  final ISessionManager _iSessionManager;
  final IHttpHelperEventListening httpListener;

  HttpConfig(this._appConfig, this._iSessionManager, this.httpListener);

  @override
  String contentType = AppKeys.applicationJson;

  @override
  int receiveTimeout = 8000;

  @override
  String get baseUrl => _appConfig.baseUrl;

  @override
  int connectionTimeout = 8000;

  @override
  bool curlLogger = true;

  @override
  bool dioLogger = true;

  @override
  IHttpHelperEventListening get listener => httpListener;

  @override
  Future<String?> get token => _iSessionManager.getToken();

  @override
  // TODO: implement socketUrl
  String get socketUrl => throw UnimplementedError();

  @override
  Interceptor? customRequestInterceptor = CustomInterceptor(
    requestRetrier: DioConnectivityRequestRetrier(
      dio: Dio(),
      connectivity: Connectivity(),
    ),
  ).getInterceptor();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
