import 'package:dartz/dartz.dart';

import '../../data/models/auth_model.dart';
import '../../data/requests/model/user_login_request_model.dart';

abstract class IAuthRepository {
  Future<Either<String, AuthModel>> authLogin(
      UserLoginRequestModel requestModel);

  Future<Either<String, AuthModel>> loginWithFacebook({required String token});

  Future<Either<String, AuthModel>> loginWithGoogle({required String token});

  Future<Either<String, AuthModel>> loginWithApple({required String token});
}
