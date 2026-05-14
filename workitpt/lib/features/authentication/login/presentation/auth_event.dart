part of 'bloc/auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.doLogin({String? email, String? pass}) = doLogin;
  const factory AuthEvent.getToken() = getToken;
}
