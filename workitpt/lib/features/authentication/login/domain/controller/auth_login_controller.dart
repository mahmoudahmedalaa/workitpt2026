import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../session/i_session_manager.dart';
import '../../data/models/auth_model.dart';
import '../../data/requests/model/user_login_request_model.dart';
import '../repositories/i_auth_repository.dart';

abstract class IAuthLoginController {
  Future<Either<String, AuthModel>> authLogin(
      {String? email,
      required String password,
      String? phone,
      String? role,
      String? fcmToken});
}

@Injectable(as: IAuthLoginController)
class AuthLoginController implements IAuthLoginController {
  final IAuthRepository iAuthRemoteRepository;
  final ISessionManager iSessionManager;

  AuthLoginController(
    this.iAuthRemoteRepository,
    this.iSessionManager,
  );

  @override
  Future<Either<String, AuthModel>> authLogin({
    String? email,
    required String password,
    String? phone,
    String? role,
    String? fcmToken,
  }) async {
    final model = UserLoginRequestModel(
        email: email,
        password: password,
        phone: phone,
        role: role,
        fcmToken: fcmToken);

    final response = await iAuthRemoteRepository.authLogin(model);

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
