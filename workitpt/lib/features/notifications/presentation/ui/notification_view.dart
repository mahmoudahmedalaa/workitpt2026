import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/constants/app_colors.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/features/notifications/presentation/bloc/notification_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/base_view.dart';

@RoutePage()
class NotificationView extends StatefulWidget {
  final ValueNotifier<bool> hasNotification;
  const NotificationView({super.key, required this.hasNotification});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationBloc notificationBloc;

  _NotificationViewState() : notificationBloc = getIt<NotificationBloc>();

  @override
  void initState() {
    notificationBloc.add(NotificationEvent.getNotifications());
    super.initState();
  }

  String clickedID = '';

  @override
  Widget build(BuildContext context) => BaseView(
        color: Colors.white,
        titleText: 'Notifications',
        appBarColor: Colors.white,
        padding: EdgeInsets.zero,
        elevation: 0,
        body: BlocProvider(
          create: (context) => notificationBloc,
          child: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (context, state) {
              state.whenOrNull(
                onLoading: () {
                  EasyLoading.show(dismissOnTap: true);
                },
                onGetNotificationSuccess: (notificationList) {
                  final unreadNoti = notificationList
                      .where((element) => !element.seen!)
                      .toList();
                  if (unreadNoti.isNotEmpty) {
                    widget.hasNotification.value = true;
                  } else {
                    widget.hasNotification.value = false;
                  }
                  EasyLoading.dismiss();
                },
                onViewOneNotification: (model) {
                  notificationBloc.add(NotificationEvent.getNotifications());
                },
                onFailure: (error) {
                  EasyLoading.showError(error ?? '');
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                onGetNotificationSuccess: (notificationList) {
                  return notificationList.isEmpty
                      ? Center(
                          child: Text(
                            'No Notifications found!',
                            style: AppTextStyle.bodyLgRegular
                                .copyWith(color: colorLightGrey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: notificationList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            bool seen = false;
                            if (clickedID == notificationList[index].id) {
                              seen = true;
                            } else {
                              seen = notificationList[index].seen!;
                            }
                            return InkWell(
                              onTap: () {
                                !notificationList[index].seen!
                                    ? notificationBloc.add(
                                        NotificationEvent.viewOneNotification(
                                            notificationList[index].id!),
                                      )
                                    : () {};
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                  color: seen ? Colors.white : buttonBG,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  dense: true,
                                  title: Text(
                                    notificationList[index].title ?? '',
                                    style: AppTextStyle.subHeadLgRegular,
                                  ),
                                  subtitle: Text(
                                    notificationList[index].body ?? '',
                                    style: AppTextStyle.tinySMRegular
                                        .copyWith(color: darkText),
                                  ),
                                  trailing: seen
                                      ? SizedBox()
                                      : Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: colorPrimary),
                                        ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    padding: allPadding12,
                                    decoration: BoxDecoration(
                                      color: seen
                                          ? Color(0xffFDD4B7)
                                          : Color(0xff43A047).withOpacity(0.2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: seen
                                        ? Image.asset(Assets.images.send.path)
                                        : Image.asset(Assets.images.notif.path),
                                  ),
                                ).padding(horizontal: 8),
                              ),
                            );
                          },
                        );
                },
              );
            },
          ),
        ),
      );
}
