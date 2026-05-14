part of 'verify_number_bloc.dart';

@freezed
class VerifyNumberEvent with _$VerifyNumberEvent {
  const factory VerifyNumberEvent.getOTP() = _onGetOTP;
  const factory VerifyNumberEvent.verifyOTP(String key, String code) =
      _onVerifyOTP;
}
