part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotifications() = _getNotifications;
  const factory NotificationEvent.viewOneNotification(String id) = _viewOneNotification;
}
