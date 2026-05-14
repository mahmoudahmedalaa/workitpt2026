import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../session/i_session_manager.dart';
import '../../data/models/auth_model.dart';
import '../../domain/controller/auth_login_controller.dart';

part '../auth_event.dart';
part '../auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthLoginController controller;
  final ISessionManager sessionManager;

  AuthBloc(this.controller, this.sessionManager)
      : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      emit(const AuthState.onLoading());
      await event.when<FutureOr<void>>(
        doLogin: (email, pass) async {
          try {
            final data = await controller.authLogin(
                email: email,
                password: pass ?? '',
                fcmToken: await sessionManager.getFCMToken());
            data.fold((l) => emit(AuthState.onFailure(l)),
                (r) => emit(AuthState.onSuccess(r)));
          } on Exception catch (e) {
            emit(AuthState.onFailure(e.toString()));
          }
        },
        getToken: () async {
          final token = await sessionManager.getToken();
          emit(AuthState.onFailure(token!));
        },
      );
    });
  }
}
