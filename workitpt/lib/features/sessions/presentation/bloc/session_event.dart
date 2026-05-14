part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.addSession(SessionModel model) = _onAddSession;
  const factory SessionEvent.getSession({SessionFilterModel? filter}) =
      _onGetSession;
  const factory SessionEvent.getPreviousSession({SessionFilterModel? filter}) =
      _onGetPreviousSession;
  const factory SessionEvent.getUpcomingSession({SessionFilterModel? filter}) =
      _onGetUpcomingSession;

  const factory SessionEvent.deleteSession(String sessionID) = _onDeleteSession;
  const factory SessionEvent.validateSelectedTime(List<Date> timeList) =
      _onvalidateSelectedTime;
  const factory SessionEvent.viewSession(String sessionID) = _onViewSession;
  const factory SessionEvent.updateSession(
      SessionModel model, String referenceID) = _onUpdateSession;
  const factory SessionEvent.putRating(
      RatingModel model, String id) = _onPutRating;
}
