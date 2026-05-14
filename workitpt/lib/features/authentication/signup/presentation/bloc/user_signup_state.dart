part of 'user_signup_bloc.dart';

@freezed
class UserSignupState with _$UserSignupState {
  const factory UserSignupState.initial() = _Initial;
  const factory UserSignupState.onLoading() = _onLoading;
  const factory UserSignupState.onSuccess(AuthModel user) = _onSuccess;
  const factory UserSignupState.onFailure(String message) = _onFailure;
}
