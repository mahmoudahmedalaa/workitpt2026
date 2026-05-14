// part of 'user_signup_bloc.dart';

// @immutable
// abstract class UserSignupEvent {}

// class UserSignUpTapEvent extends UserSignupEvent {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String password;
//   final String role;

//   UserSignUpTapEvent(
//       this.firstName, this.lastName, this.email, this.password, this.role);
// }
part of 'user_signup_bloc.dart';

@freezed
class UserSignupEvent with _$UserSignupEvent {
  const factory UserSignupEvent.signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String role,
    String? fcmToken,
  }) = signUp;
}
