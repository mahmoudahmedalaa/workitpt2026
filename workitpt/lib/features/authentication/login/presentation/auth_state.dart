part of 'bloc/auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.onLoading() = _onLoading;
  const factory AuthState.onSuccess(AuthModel user) = _onSuccess;
  const factory AuthState.onFailure(String message) = _onFailure;
}
