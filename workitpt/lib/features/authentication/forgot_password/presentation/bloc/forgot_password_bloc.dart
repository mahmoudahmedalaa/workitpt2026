import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/constants/model/no_data_model.dart';
import '../../data/models/forgot_password_request_model/forgot_password_response_model.dart';
import '../../data/models/forgot_password_token_model/forgot_password_token_model.dart';
import '../../domain/controller/forgot_password_controller.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

@injectable
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  IForgotPasswordController controller;
  ForgotPasswordBloc(this.controller)
      : super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      emit(const ForgotPasswordState.onLoading());
      await event.when<FutureOr<void>>(
        requestPassword: (email) async {
          try {
            final data = await controller.forgotPasswordRequest(email: email);
            data.fold((l) => emit(ForgotPasswordState.onFailure(l)),
                (r) => emit(ForgotPasswordState.onSuccess(r)));
          } on Exception catch (e) {
            emit(ForgotPasswordState.onFailure(e.toString()));
          }
        },
        requestToken: (code, key) async {
          try {
            final data = await controller.forgotPasswordTokenRequest(
                code: code, key: key);
            data.fold((l) => emit(ForgotPasswordState.onFailure(l)),
                (r) => emit(ForgotPasswordState.onTokenSuccess(r)));
          } on Exception catch (e) {
            emit(ForgotPasswordState.onFailure(e.toString()));
          }
        },
        changePassword: (token, newPassword) async {
          try {
            final data = await controller.forgotPasswordChangeRequest(
                newPassword: newPassword, token: token);
            data.fold((l) => emit(ForgotPasswordState.onFailure(l)),
                (r) => emit(ForgotPasswordState.onChangePasswordSuccess(r)));
          } on Exception catch (e) {
            emit(ForgotPasswordState.onFailure(e.toString()));
          }
        },
      );
    });
  }
}
