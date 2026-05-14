part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.requestPassword({required String email}) =
      requestPassword;
  const factory ForgotPasswordEvent.requestToken(
      {required String code, required String key}) = requestToken;
  const factory ForgotPasswordEvent.changePassword(
      {required String token, required String newPassword}) = changePassword;
}
