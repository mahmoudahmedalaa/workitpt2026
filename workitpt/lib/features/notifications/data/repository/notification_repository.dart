import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/notifications/data/requests/notification_endpoint.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../authentication/signup/data/models/common_model.dart';
import '../../domain/repository/i_notification_repository.dart';
import '../models/notification_model.dart';
import '../requests/view1_notification_endpoint.dart';

@Injectable(as: INotificationRepository)
class NotificationRepository extends INotificationRepository {
  final IHttpHelper _iHttpHelper;

  NotificationRepository(this._iHttpHelper);
  @override
  Future<Either<String, List<NotificationModel>>> getNotification() async {
    try {
      final response = await _iHttpHelper.request(
          GetNotificationEndPoint(), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<List<NotificationModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<NotificationModel>(
                data as List<dynamic>, NotificationModel.fromJson));

        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, NotificationModel>> view1Notification(String id) async {
    try {
      final response = await _iHttpHelper.request(
          ViewOneNotificationEndPoint(id: id), BaseRequestModel());
      if (response != null) {
        final model = CommonModel<NotificationModel>.fromJson(
            response as Map<String, dynamic>,
            (data) => NotificationModel.fromJson(data as Map<String, dynamic>));
        return model.ok ? right(model.data!) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
