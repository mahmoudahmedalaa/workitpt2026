import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/notifications/data/models/notification_model.dart';
import 'package:workitpt/features/notifications/domain/controller/i_notification_controller.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

@Injectable()
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final INotificationController _controller;
  NotificationBloc(this._controller)
      : super(const NotificationState.initial()) {
    on<NotificationEvent>((event, emit) async {
      emit(const NotificationState.onLoading());
      await event.when<FutureOr<void>>(
        getNotifications: () async {
          try {
            final data = await _controller.getNotification();
            data.fold((l) => emit(NotificationState.onFailure(l)), (data) {
              emit(NotificationState.onGetNotificationSuccess(data));
            });
          } on Exception catch (e) {
            emit(NotificationState.onFailure(e.toString()));
          }
        }, viewOneNotification: (id) async {
          try {
            final data = await _controller.view1Notification(id);
            data.fold((l) => emit(NotificationState.onFailure(l)), (data) {
              emit(NotificationState.onViewOneNotification(data));
            });
          } on Exception catch (e) {
            emit(NotificationState.onFailure(e.toString()));
          }
        },
      );
    });
  }
}
