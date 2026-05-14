import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/otp_model.dart';
import '../repositories/i_verify_number_repository.dart';

abstract class IVerifyNumberController {
  Future<Either<String, OTPModel>> getOTP();
  Future<Either<String, OTPModel>> verifyOTP(String otp, String key);
}

@Injectable(as: IVerifyNumberController)
class VerifyNumberController implements IVerifyNumberController {
  final IVerifyNumberRepository repository;

  VerifyNumberController(this.repository);

  @override
  Future<Either<String, OTPModel>> getOTP() async {
    final response = await repository.getOTP();
    return response;
  }

  @override
  Future<Either<String, OTPModel>> verifyOTP(String otp, String key) async {
    final response = await repository.verifyOTP(otp, key);
    return response;
  }
}
