import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/keys/app_keys.dart';
import '../../../../signup/data/models/common_model.dart';
import '../../domain/repositories/i_verify_number_repository.dart';
import '../models/otp_model.dart';
import '../request/endpoints/get_otp_request_endpoint.dart';
import '../request/endpoints/verify_number_request_endpoint.dart';

@Injectable(as: IVerifyNumberRepository)
class VerifyNumberRepository implements IVerifyNumberRepository {
  final IHttpHelper httpHelper;

  VerifyNumberRepository(this.httpHelper);

  @override
  Future<Either<String, OTPModel>> getOTP() async {
    try {
      final response = await httpHelper
          .request(GetOtpRequestEndpoint(), BaseRequestModel(), headers: {
        'Authorization': 'Bearer ${AppKeys.accessToken}',
        'userSecret': AppKeys.userSecret
      });
      final model = CommonModel.fromJson(
          response as Map<String, dynamic>,
          (profileData) =>
              OTPModel.fromJson(profileData as Map<String, dynamic>));

      return model.ok ? right(model.data!) : left(model.message!);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, OTPModel>> verifyOTP(String otp, String key) async {
    try {
      final response = await httpHelper.request(
        VerifyNumberRequestEndpoiunt(),
        OTPModel(key: key, code: otp),
      );
      final model = CommonModel.fromJson(
          response as Map<String, dynamic>,
          (profileData) =>
              OTPModel.fromJson(profileData as Map<String, dynamic>));

      return model.ok ? right(model.data!) : left(model.message!);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
