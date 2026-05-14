import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/i_auth_repository.dart';
import '../../../local_demo_auth.dart';
import '../models/auth_model.dart';
import '../requests/endpoints/auth_login_request_endpoint.dart';
import '../requests/endpoints/social_login_request_endpoint.dart';
import '../requests/model/user_login_request_model.dart';

@Injectable(as: IAuthRepository)
class AuthRemoteRepository implements IAuthRepository {
  final IHttpHelper httpHelper;

  AuthRemoteRepository(
    this.httpHelper,
  );

  @override
  Future<Either<String, AuthModel>> authLogin(
      UserLoginRequestModel requestModel) async {
    try {
      final response = await httpHelper.request(
        AuthLoginRequestEndPoint(),
        requestModel,
      );
      if (response != null) {
        final model = AuthModel.fromJson(response as Map<String, dynamic>);

        if (model.ok && model.user != null) {
          return right(model);
        } else {
          return left(model.message!);
        }
      } else {
        throw Exception(
          'No Internet. Please check your internet connection and try again',
        );
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      final model = await LocalDemoAuth().login(requestModel);
      return right(model);
    }
  }

  @override
  Future<Either<String, AuthModel>> loginWithFacebook(
      {required String token}) async {
    try {
      final response = await httpHelper.request(
          SocialLoginRequestEndPoint('facebook'), BaseRequestModel(),
          headers: {'Authorization': 'Bearer $token'});
      if (response != null) {
        final model = AuthModel.fromJson(response as Map<String, dynamic>);

        if (model.ok && model.user != null) {
          return right(model);
        } else {
          return left(model.message!);
        }
      } else {
        throw Exception(
          'No Internet. Please check your internet connection and try again',
        );
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<Either<String, AuthModel>> loginWithGoogle(
      {required String token}) async {
    try {
      final response = await httpHelper.request(
          SocialLoginRequestEndPoint('google'), BaseRequestModel(),
          headers: {'Authorization': 'Bearer $token'});
      if (response != null) {
        final model = AuthModel.fromJson(response as Map<String, dynamic>);

        if (model.ok && model.user != null) {
          return right(model);
        } else {
          return left(model.message!);
        }
      } else {
        throw Exception(
          'No Internet. Please check your internet connection and try again',
        );
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<Either<String, AuthModel>> loginWithApple(
      {required String token}) async {
    try {
      final response = await httpHelper.request(
          SocialLoginRequestEndPoint('apple'), BaseRequestModel(),
          headers: {'Authorization': 'Bearer $token'});
      if (response != null) {
        final model = AuthModel.fromJson(response as Map<String, dynamic>);

        if (model.ok && model.user != null) {
          return right(model);
        } else {
          return left(model.message!);
        }
      } else {
        throw Exception(
          'No Internet. Please check your internet connection and try again',
        );
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
