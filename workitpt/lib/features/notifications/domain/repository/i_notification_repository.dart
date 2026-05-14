import 'package:dartz/dartz.dart';
import 'package:workitpt/features/notifications/data/models/notification_model.dart';


abstract class INotificationRepository {
  Future<Either<String, List<NotificationModel>>> getNotification(
    );
  Future<Either<String, NotificationModel>> view1Notification(String id
    );

}
