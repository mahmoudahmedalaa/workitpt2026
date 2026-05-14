part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.onLoading() = _onLoading;
  const factory ForgotPasswordState.onSuccess(
      ForgotPasswordResponseModel response) = _onSuccess;
  const factory ForgotPasswordState.onTokenSuccess(
      ForgotPasswordTokenModel response) = _onTokenSuccess;
  const factory ForgotPasswordState.onChangePasswordSuccess(
      NoDataModel response) = _onChangePasswordSuccess;
  const factory ForgotPasswordState.onFailure(String message) = _onFailure;
}
