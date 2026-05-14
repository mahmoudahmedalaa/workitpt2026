import 'package:dartz/dartz.dart';

import '../../data/models/otp_model.dart';

abstract class IVerifyNumberRepository {
  Future<Either<String, OTPModel>> getOTP();
  Future<Either<String, OTPModel>> verifyOTP(String otp, String key);
}
