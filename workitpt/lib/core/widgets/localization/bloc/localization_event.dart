part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.changeLanguage(Locale language) =
      _ChangeLanguage;
  const factory LocalizationEvent.getCurrentLanguage() = _GetCurrentLanguage;
}
