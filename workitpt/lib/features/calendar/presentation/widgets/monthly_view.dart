import 'package:calendar_view/calendar_view.dart';
import 'package:workitpt/core/injection/injection.dart';

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

class CalendarMonthView extends StatelessWidget {
  final SessionBloc sessionBloc;
  final EventController eventController;
  const CalendarMonthView({
    super.key,
    required this.sessionBloc,
    required this.eventController,
  });

  @override
  Widget build(BuildContext context) {
    return MonthView(
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
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) => DeleteDialogWidget(
                                    isBooked:
                                        (events.event as SessionResponseModel)
                                            .booked!,
                                    onPressed: () {
                                      eventController.remove(events);
                                      sessionBloc.add(
                                          SessionEvent.deleteSession(
                                              (events.event
                                                      as SessionResponseModel)
                                                  .id!));
                                    },
                                  ),
                                );
                              },
                              suffixWidget: const SizedBox(),
                              textColor: blackText,
                              backgroundColor: colorBackground),
                        ),
                        Expanded(
                          child: AppButton(
                              suffixWidget: const SizedBox(),
                              buttonText: 'View Details',
                              onPressed: () {
                                getIt<ISessionManager>()
                                    .getCurrentUser()
                                    .then((value) {
                                  if (value?.role == "TRAINER") {
                                    context.router.push(
                                      TrainerSessionDetailRoute(
                                        model: events.event
                                            as SessionResponseModel,
                                        sessionBloc: sessionBloc,
                                      ),
                                    );
                                  } else {
                                    context.router.push(
                                      UserSessionDetailRoute(
                                        model: events.event
                                            as SessionResponseModel,
                                      ),
                                    );
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ));
        } else {
          context.router.push(
            UserSessionDetailRoute(
              model: events.event as SessionResponseModel,
            ),
          );
        }
      },
      onDateLongPress: (date) {
        EasyLoading.showInfo(date.toString());
      },
      useAvailableVerticalSpace: true,
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
      controller: eventController,
    );
  }
}
