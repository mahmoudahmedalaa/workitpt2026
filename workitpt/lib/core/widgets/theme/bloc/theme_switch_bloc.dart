import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../features/authentication/session/i_session_manager.dart';

part 'theme_switch_bloc.freezed.dart';
part 'theme_switch_event.dart';
part 'theme_switch_state.dart';

@injectable
class ThemeSwitchBloc extends Bloc<ThemeSwitchEvent, ThemeSwitchState> {
  final ISessionManager sessionManager;
  bool isDark = false;

  ThemeSwitchBloc(this.sessionManager)
      : super(const ThemeSwitchState.switchValue(switchValue: true)) {
    on<ThemeSwitchEvent>((event, emit) async {
      isDark = await sessionManager.getTheme();
      await event.when<FutureOr<void>>(switchOn: () async {
        emit(ThemeSwitchState.switchValue(switchValue: isDark));
      }, switchOff: () async {
        emit(ThemeSwitchState.switchValue(switchValue: isDark));
      }, getCurrentThemeEvent: () {
        emit(ThemeSwitchState.switchValue(switchValue: isDark));
      });
    });
  }
}
