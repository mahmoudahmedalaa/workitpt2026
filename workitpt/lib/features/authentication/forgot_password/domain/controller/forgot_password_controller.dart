import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/constants/model/no_data_model.dart';
import '../../../session/i_session_manager.dart';
import '../../data/models/forgot_password_request_model/forgot_password_response_model.dart';
import '../../data/models/forgot_password_token_model/forgot_password_token_model.dart';
import '../../data/requests/models/forgot_password_change_request_model.dart';
import '../../data/requests/models/forgot_password_request_model.dart';
import '../../data/requests/models/forgot_password_token_request_model.dart';
import '../repositories/i_forgot_password_repository.dart';

abstract class IForgotPasswordController {
  Future<Either<String, ForgotPasswordResponseModel>> forgotPasswordRequest({
    required String email,
  });

  Future<Either<String, ForgotPasswordTokenModel>> forgotPasswordTokenRequest({
    required String code,
    required String key,
  });

  Future<Either<String, NoDataModel>> forgotPasswordChangeRequest({
    required String token,
    required String newPassword,
  });
}

@Injectable(as: IForgotPasswordController)
class ForgotPasswordController implements IForgotPasswordController {
  final IForgotPasswordRepository iForgotPasswordRepository;
  final ISessionManager iSessionManager;

  ForgotPasswordController(
    this.iForgotPasswordRepository,
    this.iSessionManager,
  );

  @override
  Future<Either<String, ForgotPasswordResponseModel>> forgotPasswordRequest({
    required String email,
  }) async {
    final model = ForgotPasswordRequestModel(
      email: email,
    );

    final response =
        await iForgotPasswordRepository.forgotPasswordRequest(model);

    return response;
    // return response;
  }

  @override
  Future<Either<String, ForgotPasswordTokenModel>> forgotPasswordTokenRequest(
      {required String code, required String key}) async {
    final model = ForgotPasswordTokenRequestModel(code: code, key: key);

    final response =
        await iForgotPasswordRepository.forgotPasswordTokenRequest(model);

    return response;
  }

  @override
  Future<Either<String, NoDataModel>> forgotPasswordChangeRequest(
      {required String token, required String newPassword}) async {
    final model = ForgotPasswordChangeRequestModel(
        token: token, newPassword: newPassword);

    final response =
        await iForgotPasswordRepository.forgotPasswordChangeRequest(model);

    return response;
  }
}
