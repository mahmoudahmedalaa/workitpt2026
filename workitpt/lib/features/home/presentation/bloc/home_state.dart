part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.onLoading() = _onLoading;
  const factory HomeState.onGetUserActivitySuccess(List<ActivityModel> model) =
  _onGetUserActivitySuccess;
  const factory HomeState.onGetCompletedSessionSuccess(List<SessionResponseModel> model) =
  _onGetCompletedSessionSuccess;
  const factory HomeState.onGetUserStreakSuccess(StreakModel model) =
  _onGetUserStreakSuccess;
  const factory HomeState.onGetAnalyticsSuccess(AnalyticsModel model) =
  _onGetAnalyticsSuccess;
  const factory HomeState.onFailure(String? message) = _onFailure;
}
