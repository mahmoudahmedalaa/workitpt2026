part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getProfile() = _onGetProfile;
  const factory ProfileEvent.updateProfile(ProfileModel profileModel) =
      _onUpdateProfile;
  const factory ProfileEvent.changePassword(ChangePasswordModel model) =
      _onChangePassword;
  const factory ProfileEvent.uploadImage(FileUploadModel model) =
      _onUploadImage;
  const factory ProfileEvent.uploadMultipleImage(FileUploadModel model) =
      _onUploadMultipleImage;
  const factory ProfileEvent.deleteFile(DeleteFileModel model) = _onDeleteFile;
  const factory ProfileEvent.deleteAccount() = _onDeleteAccount;
  const factory ProfileEvent.contactUs(ContactUsModel model) = _onContactUs;
}
