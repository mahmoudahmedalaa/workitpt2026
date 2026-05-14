part of 'theme_switch_bloc.dart';

@freezed
class ThemeSwitchState with _$ThemeSwitchState {
  const factory ThemeSwitchState.switchValue({required bool switchValue}) =
      _ThemeSwitchStateValue;
}
