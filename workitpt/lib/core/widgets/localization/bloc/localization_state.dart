part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  // factory LocalizationState.initial() = _Initial;
  factory LocalizationState.changeLanguageState({required Locale locale}) =
      _ChangeLanguageState;
}
