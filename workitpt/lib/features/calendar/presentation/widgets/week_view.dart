import 'package:calendar_view/calendar_view.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../../../sessions/data/models/session_response_model.dart';
import '../../../sessions/presentation/bloc/session_bloc.dart';
import '../../../sessions/presentation/widgets/delete_dialog_widget.dart';

class CalendarWeekView extends StatelessWidget {
  final SessionBloc sessionBloc;
  final EventController eventController;
  const CalendarWeekView({
    super.key,
    required this.sessionBloc,
    required this.eventController,
  });

  @override
  Widget build(BuildContext context) => WeekView(
      startDay: WeekDays.sunday,
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
                  Expanded(
                    child: AppButton(
                        buttonText: 'Delete',
                        suffixWidget: const SizedBox(),
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) => DeleteDialogWidget(
                              isBooked:
                                  (events.first.event as SessionResponseModel)
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
                        },
                        textColor: blackText,
                        backgroundColor: colorBackground),
                  ),
                  Expanded(
                    child: AppButton(
                        suffixWidget: const SizedBox(),
                        buttonText: 'View Details',
                        onPressed: () => {
                              getIt<ISessionManager>()
                                  .getCurrentUser()
                                  .then((value) {
                                if (value?.role == "TRAINER") {
                                  context.router.push(
                                    TrainerSessionDetailRoute(
                                      model: events.first.event
                                          as SessionResponseModel,
                                      sessionBloc: sessionBloc,
                                    ),
                                  );
                                } else {
                                  context.router.push(
                                    UserSessionDetailRoute(
                                      model: events.first.event
                                          as SessionResponseModel,
                                    ),
                                  );
                                }
                              })
                            }),
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
      onDateLongPress: (date) {
        EasyLoading.showInfo(date.toString());
      },
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
      heightPerMinute: 1.5,
      eventArranger: const SideEventArranger(),
      showLiveTimeLineInAllDays: true,
      eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: events.first.color,
            borderRadius: BorderRadius.circular(8),
            border: events.first.color == Color(0xfff4f4f4)
                ? Border.all(color: colorPrimary)
                : null,
          ),
          child: Text(
            events[0].title,
            style: AppTextStyle.bodySMRegular.copyWith(
              color:
                  events.first.color == colorPrimary ? Colors.white : blackText,
            ),
          ),
        );
      },
      controller: eventController);
}
