part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.onLoading() = _onLoading;
  const factory SessionState.onGetSessionSuccess(
      CommonModel<List<SessionResponseModel>> model) = _onGetSessionSuccess;
  const factory SessionState.onRatingSuccess(String message) = _onRatingSuccess;
  const factory SessionState.onGetPreviousSessionSuccess(
          CommonModel<List<SessionResponseModel>> model) =
      _onGetPreviousSessionSuccess;
  const factory SessionState.onGetSessionDetailsSuccess(
      SessionResponseModel model) = _onGetSessionDetailsSuccess;
  const factory SessionState.onGetUpcomingSessionSuccess(
          CommonModel<List<SessionResponseModel>> model) =
      _onGetUpcomingSessionSuccess;
  const factory SessionState.onGetUpcomingBookingsSuccess(
          CommonModel<List<SessionResponseModel>> model) =
      _onGetUpcomingBookingsSuccess;
  const factory SessionState.onFailure(String? message) = _onFailure;
  const factory SessionState.onTimeValidateSuccess() = _onTimeValidateSuccess;
  const factory SessionState.onTimeValidateFailure(String? message) =
      _onTimeValidateFailure;
  const factory SessionState.onUpdateSessionSuccess(
      List<SessionResponseModel> model) = _onUpdateSessionSuccess;
  const factory SessionState.onAddSessionSuccess(String model) =
      _onAddSessionSuccess;
  const factory SessionState.onDeleteSessionSuccess(SessionModel model) =
      _onDeleteSessionSuccess;
}
