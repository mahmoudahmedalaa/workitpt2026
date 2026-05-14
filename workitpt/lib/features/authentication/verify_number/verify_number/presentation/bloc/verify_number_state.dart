part of 'verify_number_bloc.dart';

@freezed
class VerifyNumberState with _$VerifyNumberState {
  const factory VerifyNumberState.initial() = _verifyNumberInitial;
  const factory VerifyNumberState.onLoading() = _onLoading;
  const factory VerifyNumberState.onGetOTPSuccess(OTPModel model) =
      _onGetOTPSuccess;
  const factory VerifyNumberState.onFailure(String? message) = _onFailure;
  const factory VerifyNumberState.onVerifyOTPSuccess() = _onVerifyOTPSuccess;
}
