import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../features/authentication/session/i_session_manager.dart';
import '../injection/injection.dart';
import '../super_keys.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  // ignore: strict_raw_type
  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription<dynamic>? streamSubscription;
    // ignore: strict_raw_type
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        if (connectivityResult != ConnectivityResult.none) {
          await streamSubscription?.cancel();
          // Complete the completer instead of returning
          responseCompleter.complete(
            dio.fetch(requestOptions),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}

class CustomInterceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  CustomInterceptor({
    required this.requestRetrier,
  });

  InterceptorsWrapper getInterceptor() => InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers[SuperKeys.headerSecret] =
              'a9284717ab78f00a0b539972710c7427';
          options.headers[SuperKeys.userSecret] =
              await getIt<ISessionManager>().getUserSecret();
          options.queryParameters[SuperKeys.querySecret] =
              'b5c5dae9cb4caed79221a77f36c13a86';
          return handler.next(options);
        },
        // onResponse: (response, responseInterceptorHandler) =>
        //     responseInterceptor(response, responseInterceptorHandler),
        onError: onError,
      );

  dynamic onError(DioException error,
      ErrorInterceptorHandler errorInterceptorHandler) async {
    if (_shouldRetry(error)) {
      await EasyLoading.showInfo('Network Error');
      // try {
      //   return requestRetrier.scheduleRequestRetry(error.requestOptions);
      //   // ignore: avoid_catches_without_on_clauses
      // } catch (e) {
      //   return e;
      // }
    }
    // Let the error pass through if it's not the error we're looking for
    return error;
  }

  bool _shouldRetry(DioException err) =>
      err.type == DioExceptionType.unknown &&
      err.error != null &&
      err.error is SocketException;
}
