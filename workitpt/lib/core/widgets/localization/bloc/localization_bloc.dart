import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../features/authentication/session/i_session_manager.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

@injectable
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final language = <String>['Chinese', 'English'];
  final ISessionManager sessionManager;
  Locale locale = const Locale('en', 'US');

  String getLanguage(Locale locale) {
    var language = 'English';
    switch (locale.countryCode) {
      case 'US':
        language = 'English';
        break;
      case 'CN':
        language = 'Chinese';
        break;
      default:
    }
    return language;
  }

  LocalizationBloc(this.sessionManager)
      : super(LocalizationState.changeLanguageState(
            locale: const Locale('en', 'US'))) {
    on<LocalizationEvent>((event, emit) async {
      await event.when(
        changeLanguage: (language) {
          sessionManager.saveLocale(language);
          emit(LocalizationState.changeLanguageState(locale: language));
        },
        getCurrentLanguage: () async {
          locale = await sessionManager.getLocale();
          switch (locale.languageCode) {
            case 'en':
              emit(LocalizationState.changeLanguageState(
                  locale: const Locale('en', 'US')));
              break;
            case 'zh':
              emit(LocalizationState.changeLanguageState(
                  locale: const Locale('zh', 'CN')));
          }
        },
      );
    });
  }
}
