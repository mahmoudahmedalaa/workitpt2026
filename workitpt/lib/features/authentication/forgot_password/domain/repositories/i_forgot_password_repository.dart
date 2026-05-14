import 'package:dartz/dartz.dart';
import '../../../../../core/constants/model/no_data_model.dart';

import '../../data/models/forgot_password_request_model/forgot_password_response_model.dart';
import '../../data/models/forgot_password_token_model/forgot_password_token_model.dart';
import '../../data/requests/models/forgot_password_change_request_model.dart';
import '../../data/requests/models/forgot_password_request_model.dart';
import '../../data/requests/models/forgot_password_token_request_model.dart';

abstract class IForgotPasswordRepository {
  Future<Either<String, ForgotPasswordResponseModel>> forgotPasswordRequest(
      ForgotPasswordRequestModel requestModel);
  Future<Either<String, ForgotPasswordTokenModel>> forgotPasswordTokenRequest(
      ForgotPasswordTokenRequestModel requestModel);
  Future<Either<String, NoDataModel>> forgotPasswordChangeRequest(
      ForgotPasswordChangeRequestModel requestModel);
}
