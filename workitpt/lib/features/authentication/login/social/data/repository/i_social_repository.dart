import 'package:dartz/dartz.dart';

import '../../../data/models/auth_model.dart';

abstract class ISocialAuthRepository {
  // Future<Either<String, AuthModel>> appleLogin();

  Future<Either<String, AuthModel>> facebookLogin();

  Future<Either<String, AuthModel>> googleLoginIn();

  Future<Either<String, AuthModel>> appleLoginIn();
}
