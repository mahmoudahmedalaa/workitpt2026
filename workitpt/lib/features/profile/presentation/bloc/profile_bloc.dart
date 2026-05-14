import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/profile/data/models/contact_us_model.dart';

import '../../../authentication/session/i_session_manager.dart';
import '../../data/models/change_password_model.dart';
import '../../data/models/delete_file_model.dart';
import '../../data/models/file_upload_model.dart';
import '../../data/models/profile_model.dart';
import '../../domain/controller/i_profile_controller.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileController _controller;
  final ISessionManager sessionManager;
  ProfileBloc(this._controller, this.sessionManager)
      : super(const _profileInitial()) {
    on<ProfileEvent>(
      (event, emit) async {
        emit(const ProfileState.onLoading());
        await event.when<FutureOr<void>>(
          getProfile: () async {
            try {
              final data = await _controller.getProfile();
              data.fold((l) => emit(ProfileState.onFailure(l)), (data) {
                emit(ProfileState.onGetProfileSuccess(data));
              });
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          updateProfile: (model) async {
            try {
              final data = await _controller.updateProfile(model);
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onUpdateProfileSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          changePassword: (model) async {
            try {
              final data = await _controller.changePassword(model);
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onChangePasswordSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          uploadImage: (model) async {
            try {
              final data = await _controller.uploadImage(model);
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onUploadImageSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          uploadMultipleImage: (model) async {
            try {
              final data = await _controller.uploadMultipleImage(model);
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onUploadMultipleImageSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          deleteFile: (model) async {
            try {
              final data = await _controller.deleteFile(model);
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onDeleteFileSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          deleteAccount: () async {
            try {
              final data = await _controller.deleteAccount();
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onDeleteAccountSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
          contactUs: (model) async {
            try {
              final data = await _controller.contactUs(model);
              data.fold((l) => emit(ProfileState.onFailure(l)),
                  (r) => emit(ProfileState.onContactUsSuccess(r)));
            } on Exception catch (e) {
              emit(ProfileState.onFailure(e.toString()));
            }
          },
        );
      },
    );
  }
}
