import 'package:dartz/dartz.dart';

import '../../../login/data/models/auth_model.dart';

abstract class IUserSignUpRepository {
  Future<Either<String, AuthModel>> userSignup(
      String firstName,
      String lastName,
      String email,
      String password,
      String role,
      String fcmToken);
}
