import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/model/no_data_model.dart';

import '../../../../../core/export.dart';
import '../../../signup/data/models/common_model.dart';
import '../../domain/repositories/i_forgot_password_repository.dart';
import '../models/forgot_password_request_model/forgot_password_response_model.dart';
import '../models/forgot_password_token_model/forgot_password_token_model.dart';
import '../requests/endpoints/forgot_password_change_endpoint.dart';
import '../requests/endpoints/forgot_password_request_endpoint.dart';
import '../requests/endpoints/forgot_password_token_request_endpoint.dart';
import '../requests/models/forgot_password_change_request_model.dart';
import '../requests/models/forgot_password_request_model.dart';
import '../requests/models/forgot_password_token_request_model.dart';

@Injectable(as: IForgotPasswordRepository)
class ForgotPasswordRepository implements IForgotPasswordRepository {
  ForgotPasswordRepository(
    this.httpHelper,
  );

  final IHttpHelper httpHelper;

  @override
  Future<Either<String, NoDataModel>> forgotPasswordChangeRequest(
      ForgotPasswordChangeRequestModel requestModel) async {
    try {
      final response = await httpHelper.request(
        ForgotPasswordChangeEndPoint(),
        requestModel,
      );
      if (response != null) {
        final model = CommonModel.fromJson(response as Map<String, dynamic>,
            (data) => NoDataModel.fromJson(data as Map<String, dynamic>));
        // return model;
        if (model.ok) {
          return right(model.data!);
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
  Future<Either<String, ForgotPasswordResponseModel>> forgotPasswordRequest(
      ForgotPasswordRequestModel requestModel) async {
    try {
      final response = await httpHelper.request(
        ForgotPasswordRequestEndPoint(),
        requestModel,
      );
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>,
            (data) => ForgotPasswordResponseModel.fromJson(
                data as Map<String, dynamic>));
        // return model;
        if (model.ok) {
          return right(model.data!);
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
  Future<Either<String, ForgotPasswordTokenModel>> forgotPasswordTokenRequest(
      ForgotPasswordTokenRequestModel requestModel) async {
    try {
      final response = await httpHelper.request(
        ForgotPasswordTokenEndPoint(),
        requestModel,
      );
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>,
            (data) => ForgotPasswordTokenModel.fromJson(
                data as Map<String, dynamic>));
        // return model;
        if (model.ok) {
          return right(model.data!);
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
