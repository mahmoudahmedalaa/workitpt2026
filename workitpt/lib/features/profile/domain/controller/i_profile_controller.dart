import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/profile/data/models/contact_us_model.dart';

import '../../data/models/change_password_model.dart';
import '../../data/models/delete_file_model.dart';
import '../../data/models/file_upload_model.dart';
import '../../data/models/profile_model.dart';
import '../repository/i_profile_repository.dart';

abstract class IProfileController {
  Future<Either<String, ProfileModel>> getProfile();

  Future<Either<String, ProfileModel>> updateProfile(ProfileModel profileModel);

  Future<Either<String, ProfileModel>> changePassword(
      ChangePasswordModel model);

  Future<Either<String, FileUploadResponseModel>> uploadImage(
      FileUploadModel model);

  Future<Either<String, FileUploadResponseModel>> uploadMultipleImage(
      FileUploadModel fileModel);

  Future<Either<String, FileUploadResponseModel>> deleteFile(
      DeleteFileModel fileModel);

  Future<Either<String, String>> deleteAccount();

  Future<Either<String, String>> contactUs(ContactUsModel model);
}

@Injectable(as: IProfileController)
class ProfileController extends IProfileController {
  final IProfileRepository _repository;

  ProfileController(this._repository);
  @override
  Future<Either<String, ProfileModel>> getProfile() async {
    final response = await _repository.getProfile();
    return response;
  }

  @override
  Future<Either<String, ProfileModel>> updateProfile(
      ProfileModel profileModel) async {
    final response = await _repository.updateProfile(profileModel);
    return response;
  }

  @override
  Future<Either<String, ProfileModel>> changePassword(
      ChangePasswordModel model) async {
    final response = await _repository.changePassword(model);
    return response;
  }

  @override
  Future<Either<String, FileUploadResponseModel>> uploadImage(
      FileUploadModel model) async {
    final response = await _repository.uploadImage(model);
    return response;
  }

  @override
  Future<Either<String, FileUploadResponseModel>> uploadMultipleImage(
      FileUploadModel fileModel) async {
    final response = await _repository.uploadMultipleImage(fileModel);
    return response;
  }

  @override
  Future<Either<String, FileUploadResponseModel>> deleteFile(
      DeleteFileModel fileModel) async {
    final response = await _repository.deleteFile(fileModel);
    return response;
  }

  @override
  Future<Either<String, String>> deleteAccount() async {
    final response = await _repository.deleteAccount();
    return response;
  }

  @override
  Future<Either<String, String>> contactUs(ContactUsModel model) async {
    final response = await _repository.contactUs(model);
    return response;
  }
}
