import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../login/data/models/auth_model.dart';
import '../../../session/i_session_manager.dart';
import '../../domain/controller/i_user_signup_controller.dart';

part 'user_signup_bloc.freezed.dart';
part 'user_signup_event.dart';
part 'user_signup_state.dart';

@injectable
class UserSignupBloc extends Bloc<UserSignupEvent, UserSignupState> {
  IUserSignupController controller;
  ISessionManager sessionManager;
  UserSignupBloc(this.controller, this.sessionManager)
      : super(const UserSignupState.initial()) {
    on<UserSignupEvent>((event, emit) async {
      emit(const UserSignupState.onLoading());
      await event.when<FutureOr<void>>(
        signUp: (firstName, lastName, email, password, role, fcmToken) async {
          var fcmToken = await sessionManager.getFCMToken();
          try {
            final data = await controller.userSignup(
                firstName, lastName, email, password, role, fcmToken??'');
            data.fold((l) => emit(UserSignupState.onFailure(l)),
                (r) => emit(UserSignupState.onSuccess(r)));
          } on Exception catch (e) {
            emit(UserSignupState.onFailure(e.toString()));
          }
        },
      );
    });
  }
}
