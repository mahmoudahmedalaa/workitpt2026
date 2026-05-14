import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/profile/data/models/contact_us_model.dart';
import 'package:workitpt/features/profile/data/requests/contact_endpoint.dart';
import 'package:workitpt/features/profile/data/requests/delete_account_endpoint.dart';

import '../../../authentication/signup/data/models/common_model.dart';
import '../../domain/repository/i_profile_repository.dart';
import '../models/change_password_model.dart';
import '../models/delete_file_model.dart';
import '../models/file_upload_model.dart';
import '../models/profile_model.dart';
import '../requests/change_password_endpoint.dart';
import '../requests/delete_file_endpoint.dart';
import '../requests/get_profile_endpoint.dart';
import '../requests/update_profile_endpoint.dart';
import '../requests/upload_image_endpoint.dart';

@Injectable(as: IProfileRepository)
class ProfileRepository extends IProfileRepository {
  final IHttpHelper _iHttpHelper;
  final IFileUploadRepository iFileUploadRepository;
  ProfileRepository(this._iHttpHelper, this.iFileUploadRepository);

  @override
  Future<Either<String, ProfileModel>> getProfile() async {
    try {
      final response =
          await _iHttpHelper.request(GetProfileEndpoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<ProfileModel>.fromJson(
            response as Map<String, dynamic>,
            (profileData) =>
                ProfileModel.fromJson(profileData as Map<String, dynamic>));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, ProfileModel>> updateProfile(
      ProfileModel profileModel) async {
    try {
      final response =
          await _iHttpHelper.request(UpdateProfileEndpoint(), profileModel);
      final model = CommonModel.fromJson(
          response as Map<String, dynamic>,
          (profileData) =>
              ProfileModel.fromJson(profileData as Map<String, dynamic>));

      return model.ok ? right(model.data!) : left(model.message!);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, ProfileModel>> changePassword(
      ChangePasswordModel passwordModel) async {
    try {
      final response =
          await _iHttpHelper.request(ChangePasswordEndpoint(), passwordModel);
      final model = CommonModel.fromJson(
          response as Map<String, dynamic>,
          (profileData) =>
              ProfileModel.fromJson(profileData as Map<String, dynamic>));

      return model.ok ? right(model.data!) : left(model.message!);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, FileUploadResponseModel>> uploadImage(
      FileUploadModel fileModel) async {
    try {
      final response = await iFileUploadRepository.uploadSingleFile(
          endPoint: UploadImageEndpoint(),
          filePath: fileModel.files[0],
          key: 'files');
      final model =
          FileUploadResponseModel.fromJson(response as Map<String, dynamic>);
      return right(model);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, FileUploadResponseModel>> uploadMultipleImage(
      FileUploadModel fileModel) async {
    try {
      final response = await iFileUploadRepository.uploadMultipleFile(
          endPoint: UploadImageEndpoint(),
          filePath: fileModel.files,
          key: 'files');
      final model =
          FileUploadResponseModel.fromJson(response as Map<String, dynamic>);
      return right(model);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, FileUploadResponseModel>> deleteFile(
      DeleteFileModel fileModel) async {
    try {
      final response =
          await _iHttpHelper.request(DeleteFileEndpoint(), fileModel);
      final model = CommonModel.fromJson(
          response as Map<String, dynamic>,
          (profileData) => FileUploadResponseModel.fromJson(
              profileData as Map<String, dynamic>));

      return model.ok ? right(model.data!) : left(model.message!);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> deleteAccount() async {
    try {
      final response = await _iHttpHelper.request(
          DeleteAccountEndpoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok ? right(model.message!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> contactUs(ContactUsModel model) async {
    try {
      final response = await _iHttpHelper.request(ContactEndpoint(), model);
      if (response != null) {
        final model = CommonModel.fromJson(
            response as Map<String, dynamic>, (data) => null);

        return model.ok ? right(model.message!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
