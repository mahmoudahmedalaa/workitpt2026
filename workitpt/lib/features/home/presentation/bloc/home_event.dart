part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getUserActivity() = _onGetUserActivity;
  const factory HomeEvent.getUserStreak() = _onGetUserStreak;
  const factory HomeEvent.getAnalytics() = _onGetAnalytics;
  const factory HomeEvent.getCompletedSessions() = _onGetCompletedSessions;
}
