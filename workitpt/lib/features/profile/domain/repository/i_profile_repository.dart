import 'package:dartz/dartz.dart';

import '../../data/models/change_password_model.dart';
import '../../data/models/contact_us_model.dart';
import '../../data/models/delete_file_model.dart';
import '../../data/models/file_upload_model.dart';
import '../../data/models/profile_model.dart';

abstract class IProfileRepository {
  Future<Either<String, ProfileModel>> getProfile();

  Future<Either<String, ProfileModel>> updateProfile(ProfileModel profileModel);

  Future<Either<String, ProfileModel>> changePassword(
      ChangePasswordModel passwordModel);

  Future<Either<String, FileUploadResponseModel>> uploadImage(
      FileUploadModel fileModel);

  Future<Either<String, FileUploadResponseModel>> uploadMultipleImage(
      FileUploadModel fileModel);

  Future<Either<String, FileUploadResponseModel>> deleteFile(
      DeleteFileModel fileModel);

  Future<Either<String, String>> deleteAccount();

  Future<Either<String, String>> contactUs(ContactUsModel model);
}
