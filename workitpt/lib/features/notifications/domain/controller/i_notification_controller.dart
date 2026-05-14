import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/notifications/data/models/notification_model.dart';
import 'package:workitpt/features/notifications/domain/repository/i_notification_repository.dart';

abstract class INotificationController {
  Future<Either<String, List<NotificationModel>>> getNotification();

  Future<Either<String, NotificationModel>> view1Notification(String id);
}

@Injectable(as: INotificationController)
class NotificationController extends INotificationController {
  final INotificationRepository _repository;

  NotificationController(this._repository);

  @override
  Future<Either<String, List<NotificationModel>>> getNotification() async {
    final response = await _repository.getNotification();
    return response;
  }

  @override
  Future<Either<String, NotificationModel>> view1Notification(String id) async {
    final response = await _repository.view1Notification(id);
    return response;
  }
}
