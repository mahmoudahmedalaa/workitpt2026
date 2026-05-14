import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../login/data/models/auth_model.dart';
import '../../../session/i_session_manager.dart';
import '../repository/i_user_signup_repository.dart';

abstract class IUserSignupController {
  Future<Either<String, AuthModel>> userSignup(
    String firstName,
    String lastName,
    String email,
    String password,
    String role,
    String fcmToken,
  );
}

@Injectable(as: IUserSignupController)
class UserSignUpController implements IUserSignupController {
  final IUserSignUpRepository repository;
  final ISessionManager iSessionManager;

  UserSignUpController(this.repository, this.iSessionManager);

  @override
  Future<Either<String, AuthModel>> userSignup(
      String firstName,
      String lastName,
      String email,
      String password,
      String role,
      String fcmToken) async {
    final response = await repository.userSignup(
        firstName, lastName, email, password, role, fcmToken);
    response.fold((l) => l, (r) {
      if (r.user!.accessToken != null) {
        iSessionManager.saveToken(accessToken: r.user!.accessToken!);
      }
      if (r.user!.userSecret != null) {
        iSessionManager.saveUserSecret(userSecret: r.user!.userSecret!);
      }
      if (r.user != null) {
        iSessionManager.saveCurrentUser(user: r.user!);
      }
    });

    return response;
  }
}
