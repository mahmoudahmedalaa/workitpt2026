part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _profileInitial;
  const factory ProfileState.onLoading() = _onLoading;
  const factory ProfileState.onGetProfileSuccess(ProfileModel model) =
      _onGetProfileSuccess;
  const factory ProfileState.onFailure(String? message) = _onFailure;
  const factory ProfileState.onUpdateProfileSuccess(ProfileModel model) =
      _onUpdateProfileSuccess;
  const factory ProfileState.onChangePasswordSuccess(ProfileModel model) =
      _onChangePasswordSuccess;
  const factory ProfileState.onUploadImageSuccess(
      FileUploadResponseModel model) = _onUploadImageSuccess;
  const factory ProfileState.onUploadMultipleImageSuccess(
      FileUploadResponseModel model) = _onUploadMultipleImageSuccess;
  const factory ProfileState.onDeleteFileSuccess(
      FileUploadResponseModel model) = _onDeleteFileSuccess;
  const factory ProfileState.onDeleteAccountSuccess(String msg) =
      _onDeleteAccountSuccess;
  const factory ProfileState.onContactUsSuccess(String msg) =
      _onContactUsSuccess;
}
