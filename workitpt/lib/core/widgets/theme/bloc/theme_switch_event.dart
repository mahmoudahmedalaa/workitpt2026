part of 'theme_switch_bloc.dart';

@freezed
class ThemeSwitchEvent with _$ThemeSwitchEvent {
  const factory ThemeSwitchEvent.switchOn() = _SwitchOn;
  const factory ThemeSwitchEvent.switchOff() = _SwitchOff;
  const factory ThemeSwitchEvent.getCurrentThemeEvent() = _GetCurrentThemeEvent;
}
