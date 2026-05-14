part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.onLoading() = _onLoading;
  const factory NotificationState.onGetNotificationSuccess(List<NotificationModel> model) = _onGetNotificationSuccess;
  const factory NotificationState.onViewOneNotification(NotificationModel model) = _onViewOneNotification;
  const factory NotificationState.onFailure(String? message) = _onFailure;
}
