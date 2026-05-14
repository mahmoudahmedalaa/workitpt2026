// part of 'social_bloc.dart';

// @immutable
// abstract class SocialEvent {}

// class SocialLoginTapEvent extends SocialEvent {
//   final SocialType socialType;

//   SocialLoginTapEvent({required this.socialType});
// }

part of 'social_bloc.dart';

@freezed
class SocialEvent with _$SocialEvent {
  const factory SocialEvent.doSocialLogin({SocialType? socialType}) =
      doSocialLogin;
}
