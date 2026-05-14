import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';

import '../../../login/data/models/auth_model.dart';
import '../../../local_demo_auth.dart';
import '../../domain/repository/i_user_signup_repository.dart';
import '../endpoint/signup_endpoint.dart';
import '../models/user_signup_model.dart';

@Injectable(as: IUserSignUpRepository)
class CheckoutRepository implements IUserSignUpRepository {
  final IHttpHelper iHttpHelper;

  CheckoutRepository(this.iHttpHelper);

  @override
  Future<Either<String, AuthModel>> userSignup(
      String firstName,
      String lastName,
      String email,
      String password,
      String role,
      String fcmToken) async {
    final requestModel = UserSignUpModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        fcmToken: fcmToken,
        password: password,
        role: role);

    try {
      final response =
          await iHttpHelper.request(SignUpUserEndPoint(), requestModel);
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
      final model = await LocalDemoAuth().register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        role: role,
      );
      return right(model);
    }
  }
}
