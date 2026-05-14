import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/features/authentication/session/i_session_manager.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';
import 'package:workitpt/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:workitpt/features/sessions/data/models/session_filter_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../sessions/data/models/session_response_model.dart';
import '../../../sessions/presentation/bloc/session_bloc.dart';
import '../widgets/day_view.dart';
import '../widgets/monthly_view.dart';
import '../widgets/week_view.dart';

@RoutePage()
class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>
    with WidgetsBindingObserver {
  SessionBloc sessionBloc;
  BookingBloc bookingBloc;
  List<SessionResponseModel> totalSessions = [];
  List<SessionResponseModel> userSessions = [];
  List<BookingModel> userBookings = [];
  List<CalendarEventData> calendarEvent = [];
  EventController eventController = EventController();
  String? role;
  _CalendarViewState()
      : bookingBloc = getIt<BookingBloc>(),
        sessionBloc = getIt<SessionBloc>();
  String selectedOptions = 'Day';

  void getSession() {
    if (role == 'TRAINER') {
      sessionBloc.add(
        SessionEvent.getUpcomingSession(
          filter: SessionFilterModel(limit: 20),
        ),
      );
    } else if (role == 'USER') {
      bookingBloc.add(BookingEvent.getPendingPayments());
    }
  }

  DateTime? convertTimeStringToDateTime(String timeString, DateTime date) {
    DateTime time;
    try {
      String deviceLocale = 'en_US';
      if (timeString.contains(RegExp(r'[ap]m$', caseSensitive: false))) {
        // Time string contains AM/PM indicator
        DateFormat format = DateFormat("hh:mm a", deviceLocale);
        time = format.parse(timeString);
      } else {
        // Time string does not contain AM/PM indicator
        DateFormat format = DateFormat("HH:mm", deviceLocale);
        time = format.parse(timeString);
      }
      // Combine time and date
      return DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      ).toLocal();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> getUserRole() async {
    final userModel = await getIt<ISessionManager>().getCurrentUser();
    setState(() {
      role = userModel!.role;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    getSession();
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    getUserRole().whenComplete(() => getSession());
    super.initState();
  }

  setUserBookings() {
    setState(() {
      calendarEvent.clear();
      eventController = EventController();
      calendarEvent = userBookings
          .map(
            (e) => CalendarEventData(
              title: e.session!.sessionTitle!,
              date: e.session!.dateFrom ?? e.session!.date!,
              endDate: e.session!.dateTo ?? e.session!.date!,
              startTime: convertTimeStringToDateTime(
                  e.session!.timeFrom!, e.session!.date!),
              endTime: convertTimeStringToDateTime(
                  e.session!.timeTo!, e.session!.date!),
              event: e.session,
              description: e.session!.description ?? '',
              color: e.isPaid == 'Paid' ? colorPrimary : Color(0xfff4f4f4),
              titleStyle: AppTextStyle.tinySMBold.copyWith(
                color: e.isPaid == 'Paid' ? Colors.white : blackText,
              ),
            ),
          )
          .toList();

      eventController.addAll(calendarEvent);
    });
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sessionBloc,
          ),
          BlocProvider(
            create: (context) => bookingBloc,
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                state.whenOrNull(
                  onLoading: EasyLoading.show,
                  onUpdateSessionSuccess: (session) {
                    EasyLoading.showSuccess(
                      'Session updated successfully.',
                      duration: const Duration(milliseconds: 1600),
                    );
                    context.router.pop();
                    Future.delayed(
                        const Duration(milliseconds: 800), getSession);
                  },
                  onGetUpcomingSessionSuccess: (sessions) {
                    EasyLoading.dismiss();
                    setState(() {
                      calendarEvent.clear();
                      eventController = EventController();
                      // totalSessions.clear();
                      // _eventController.addAll(calendarEvent);
                      calendarEvent = sessions.data!
                          .map(
                            (e) => CalendarEventData(
                                title: e.sessionTitle!,
                                date: e.dateFrom ?? e.date!,
                                endDate: e.dateFrom ?? e.date!,
                                startTime: convertTimeStringToDateTime(
                                    e.timeFrom!, e.date!),
                                endTime: convertTimeStringToDateTime(
                                    e.timeTo!, e.date!),
                                event: e,
                                description: e.day!,
                                color: e.booked!
                                    ? colorPrimary
                                    : Color(0xfff4f4f4),
                                titleStyle: AppTextStyle.tinySMBold.copyWith(
                                    color:
                                        e.booked! ? Colors.white : blackText)),
                          )
                          .toList();
                      totalSessions = sessions.data!;
                      eventController.addAll(calendarEvent);
                    });
                  },
                  onFailure: (error) {
                    EasyLoading.showError(error ?? '');
                  },
                  onDeleteSessionSuccess: (session) {
                    EasyLoading.showSuccess('Session deleted successfully.');
                    context.router.pop();
                    Future.delayed(
                        const Duration(milliseconds: 800), getSession);
                  },
                );
              },
            ),
            BlocListener<BookingBloc, BookingState>(
              listener: (context, state) {
                state.whenOrNull(
                  onGetPendingPaymentSuccess: (model) {
                    setState(() {
                      userBookings.addAll(model);
                    });
                    bookingBloc.add(BookingEvent.getUpcomingBookings());
                  },
                  onGetUpcomingBookingsSuccess: (model) {
                    setState(() {
                      userBookings.addAll(model);
                    });
                    setUserBookings();
                  },
                  onFailure: (message) {
                    EasyLoading.showError(message!);
                  },
                );
              },
            ),
          ],
          child: BlocBuilder<SessionBloc, SessionState>(
            builder: (context, state) => BaseView(
              color: Colors.white,
              titleText: 'Schedules',
              appBarColor: Colors.white,
              padding: EdgeInsets.zero,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300]),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton<String>(
                      value: selectedOptions,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: Colors.black), // Adjust text color as needed
                      underline: Container(
                        height: 2,
                        color: Colors.transparent, // Remove the underline
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          selectedOptions = newValue ?? 'Day';
                        });
                      },
                      items: <String>['Day', 'Week', 'Month']
                          .map((value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
              automaticallyImplyiLeading: false,
              elevation: 0,
              body: (selectedOptions == 'Day')
                  ? CalendarDayView(
                      sessionBloc: sessionBloc,
                      eventController: eventController,
                    )
                  : (selectedOptions == 'Week')
                      ? CalendarWeekView(
                          sessionBloc: sessionBloc,
                          eventController: eventController,
                        )
                      : CalendarMonthView(
                          eventController: eventController,
                          sessionBloc: sessionBloc,
                        ),
            ),
          ),
        ),
      );
}
