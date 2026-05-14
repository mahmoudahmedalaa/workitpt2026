import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../session/i_session_manager.dart';
import '../../data/models/auth_model.dart';
import '../data/repository/i_social_repository.dart';

part 'social_bloc.freezed.dart';
part 'social_event.dart';
part 'social_state.dart';

enum SocialType { Facebook, Google, Apple }

@injectable
class SocialBloc extends Bloc<SocialEvent, SocialState> {
  late AuthModel socialModel;
  final ISocialAuthRepository socialAuthRepository;
  final ISessionManager iSessionManager;

  SocialBloc(this.socialAuthRepository, this.iSessionManager)
      : super(const SocialState.initial()) {
    on<SocialEvent>((event, emit) => event.whenOrNull(
          doSocialLogin: (socialType) async {
            switch (socialType) {
              case SocialType.Facebook:
                final data = await socialAuthRepository.facebookLogin();
                data.fold((l) => emit(SocialState.onFailure(l)),
                    (r) => emit(SocialState.onSuccess(r)));

                break;
              case SocialType.Google:
                final data = await socialAuthRepository.googleLoginIn();
                data.fold((l) => emit(SocialState.onFailure(l)),
                    (r) => emit(SocialState.onSuccess(r)));
                break;
              case null:
                break;
              case SocialType.Apple:
                final data = await socialAuthRepository.appleLoginIn();
                data.fold((l) => emit(SocialState.onFailure(l)),
                    (r) => emit(SocialState.onSuccess(r)));
                break;
            }
            return null;
          },
        ));
  }

  // @override
  // Stream<SocialState> mapEventToState(
  //   SocialEvent event,
  // ) async* {
  //   // if (event is SocialLoginTapEvent) {
  //   //   yield SocialStateLoading();
  //   //   switch (event.socialType) {
  //   //     case SocialType.Facebook:
  //   //       socialModel = await socialAuthRepository.facebookLogin();
  //   //       break;
  //   //     case SocialType.Google:
  //   //       socialModel = await socialAuthRepository.googleLoginIn();
  //   //       break;
  //   //     case SocialType.Apple:
  //   //       socialModel = await socialAuthRepository.appleLogin();
  //   //       break;
  //   //   }
  //   //   if (socialModel.ok) {
  //   //     await iSessionManager.saveToken(accessToken: socialModel.accessToken!);
  //   //     if (socialModel.user != null) {
  //   //       await iSessionManager.saveCurrentUser(user: socialModel.user!);
  //   //     }
  //   //     // if (socialModel.refreshToken != null) {
  //   //     //   iSessionManager.saveRefreshToken(
  //   //     //       refreshToken: socialModel.refreshToken!);
  //   //     // }
  //   //     yield SocialStateSuccess(socialModel: socialModel);
  //   //     return;
  //   //   }
  //   //   yield SocialStateFailed(
  //   //       message: socialModel.message ?? 'An unknown error occured.');
  //   // }
  // }
}
