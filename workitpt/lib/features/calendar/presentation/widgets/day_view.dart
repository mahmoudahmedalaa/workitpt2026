import 'package:calendar_view/calendar_view.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/core/utils/date_util.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../../../sessions/data/models/session_response_model.dart';
import '../../../sessions/presentation/bloc/session_bloc.dart';
import '../../../sessions/presentation/widgets/delete_dialog_widget.dart';

class CalendarDayView extends StatelessWidget {
  final SessionBloc sessionBloc;
  final EventController eventController;
  const CalendarDayView({
    super.key,
    required this.sessionBloc,
    required this.eventController,
  });

  @override
  Widget build(BuildContext context) => DayView(
      onEventTap: (events, date) async {
        final isTrainer =
            (await getIt<ISessionManager>().getCurrentUser())?.role ==
                'TRAINER';
        if (isTrainer) {
          showModalBottomSheet(
            context: context,
            elevation: 10,
            enableDrag: true,
            builder: (context) => Padding(
              padding: allPadding16,
              child: Row(
                children: [
                  AppButton(
                    buttonWidth: ButtonWidth.small,
                    buttonText: 'Delete',
                    suffixWidget: const SizedBox(),
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) => DeleteDialogWidget(
                          isBooked: (events.first.event as SessionResponseModel)
                              .booked!,
                          onPressed: () {
                            eventController.remove(events.first);
                            sessionBloc.add(
                              SessionEvent.deleteSession(
                                (events.first.event as SessionResponseModel)
                                    .id!,
                              ),
                            );
                          },
                        ),
                      );
                      // sessionBloc.add(SessionEvent.deleteSession(
                      //     (events.first.event as SessionResponseModel)
                      //         .id!));
                    },
                    textColor: blackText,
                    backgroundColor: colorBackground,
                  ),
                  AppButton(
                    suffixWidget: const SizedBox(),
                    buttonWidth: ButtonWidth.small,
                    buttonText: 'View Details',
                    onPressed: () {
                      getIt<ISessionManager>().getCurrentUser().then((value) {
                        if (value?.role == "TRAINER") {
                          context.router.push(
                            TrainerSessionDetailRoute(
                              model: events.first.event as SessionResponseModel,
                              sessionBloc: sessionBloc,
                            ),
                          );
                        } else {
                          context.router.push(
                            UserSessionDetailRoute(
                              model: events.first.event as SessionResponseModel,
                            ),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          context.router.push(
            UserSessionDetailRoute(
              model: events.first.event as SessionResponseModel,
            ),
          );
        }
      },
      heightPerMinute: 1.5,
      eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
        return Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // color: const Color(0xFFFF8718),
            color: events.first.color,
            borderRadius: BorderRadius.circular(8),
            border: events.first.color == Color(0xfff4f4f4)
                ? Border.all(color: colorPrimary)
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                events.first.title,
                style: AppTextStyle.bodyMDSemiBold.copyWith(
                  color: events.first.color == colorPrimary
                      ? Colors.white
                      : blackText,
                ),
              ),
              Text(
                '${events.first.startTime!.getFormattedDateWithTime()}-${events.first.endTime!.getFormattedDateWithTime()}',
                style: AppTextStyle.bodySMSemiBold.copyWith(
                    color: events.first.color == colorPrimary
                        ? Colors.white
                        : blackText),
              ),
            ],
          ),
        );
      },
      // showHalfHours: true,
      onDateLongPress: (date) {
        EasyLoading.showInfo(date.toString());
      },
      eventArranger: const SideEventArranger(),
      headerStyle: HeaderStyle(
        headerTextStyle:
            AppTextStyle.headlineSMSemiBold.copyWith(color: Colors.white),
        decoration: const BoxDecoration(
          color: Color(0xfffba163),
        ),
        leftIcon: const Icon(
          Icons.arrow_back_ios,
          size: 22,
          color: Colors.white,
        ),
        rightIcon: const Icon(
          Icons.arrow_forward_ios,
          size: 22,
          color: Colors.white,
        ),
      ),
      showLiveTimeLineInAllDays: true,
      controller: eventController);
}
