part of 'social_bloc.dart';

@freezed
class SocialState with _$SocialState {
  const factory SocialState.initial() = _Initial;
  const factory SocialState.onLoading() = _onLoading;
  const factory SocialState.onSuccess(AuthModel user) = _onSuccess;
  const factory SocialState.onFailure(String message) = _onFailure;
}
