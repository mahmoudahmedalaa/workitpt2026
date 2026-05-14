import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';

import '../../config/app_config.dart';
import '../../features/authentication/session/i_session_manager.dart';
import 'custom_interceptor.dart';

@Named('uploadConfig')
@Injectable(as: IHttpConfig)
class FileUploadConfig implements IHttpConfig {
  final ISessionManager _iSessionManager;
  final AppConfig _appConfig;
  final IHttpHelperEventListening httpListener;

  FileUploadConfig(this._appConfig, this._iSessionManager, this.httpListener);

  @override
  int connectionTimeout = 12000;

  @override
  String contentType = 'multipart/form-data';

  @override
  int receiveTimeout = 12000;

  @override
  String get baseUrl => _appConfig.baseUrl;

  @override
  Future<String?> get token => _iSessionManager.getToken();

  @override
  bool curlLogger = false;

  @override
  bool dioLogger = true;

  @override
  IHttpHelperEventListening get listener => httpListener;

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
  Future<void> onTokenRefreshed(String token) {
    // TODO: implement onTokenRefreshed
    throw UnimplementedError();
  }

  @override
  // TODO: implement refreshToken
  Future<String?> get refreshToken => throw UnimplementedError();

  @override
  // TODO: implement refreshTokenUrl
  String get refreshTokenUrl => throw UnimplementedError();
}
