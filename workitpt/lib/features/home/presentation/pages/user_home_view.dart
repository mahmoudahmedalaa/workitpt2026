import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';
import 'package:workitpt/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:workitpt/features/home/presentation/bloc/home_bloc.dart';
import 'package:workitpt/features/home/presentation/widgets/pending_payment_card.dart';
import 'package:workitpt/features/home/presentation/widgets/trainer_item_widget.dart';
import 'package:workitpt/features/trainer/data/models/trainer_filter_model.dart';
import 'package:workitpt/features/trainer/presentation/bloc/trainer_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../notifications/presentation/bloc/notification_bloc.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../sessions/presentation/bloc/session_bloc.dart';
import '../../../sessions/presentation/widgets/session_card_widget.dart';
import '../../../sessions/presentation/widgets/user_streak_widget.dart';
import '../widgets/line_graph.dart';

@RoutePage()
class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  List<BookingModel> upcomingBookings = [];
  List<BookingModel> pendingBookings = [];
  SessionBloc sessionBloc;
  ProfileBloc profileBloc;
  BookingBloc bookingBloc;
  NotificationBloc notificationBloc;
  HomeBloc homeBloc;
  TrainerBloc trainerBloc;
  ProfileModel? profileModel;
  ValueNotifier<bool> hasNotification = ValueNotifier(false);

  _UserHomeViewState()
      : sessionBloc = getIt<SessionBloc>(),
        bookingBloc = getIt<BookingBloc>(),
        homeBloc = getIt<HomeBloc>(),
        trainerBloc = getIt<TrainerBloc>(),
        notificationBloc = getIt<NotificationBloc>(),
        profileBloc = getIt<ProfileBloc>();

  getHomeData() {
    profileBloc.add(const ProfileEvent.getProfile());
    bookingBloc.add(const BookingEvent.getPendingPayments());
    bookingBloc.add(BookingEvent.getUpcomingBookings());
    trainerBloc
        .add(TrainerEvent.getTrainerList(filter: TrainerFilterModel(limit: 6)));
    notificationBloc.add(NotificationEvent.getNotifications());
  }

  Future<void> _pullRefresh() async {
    getHomeData();
    setState(() {});
  }

  @override
  void initState() {
    getHomeData();
    homeBloc.add(HomeEvent.getCompletedSessions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sessionBloc,
          ),
          BlocProvider(
            create: (context) => profileBloc,
          ),
          BlocProvider(
            create: (context) => homeBloc,
          ),
          BlocProvider(
            create: (context) => bookingBloc,
          ),
          BlocProvider.value(value: trainerBloc),
          BlocProvider.value(value: notificationBloc),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<NotificationBloc, NotificationState>(
              listener: (context, state) {
                state.whenOrNull(
                  onGetNotificationSuccess: (notificationList) {
                    final unreadNoti = notificationList
                        .where((element) => !element.seen!)
                        .toList();
                    if (unreadNoti.isNotEmpty) {
                      setState(() {
                        hasNotification.value = true;
                      });
                    } else {
                      setState(() {
                        hasNotification.value = false;
                      });
                    }
                  },
                );
              },
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                state.whenOrNull(
                  onGetProfileSuccess: (model) {
                    setState(() {
                      profileModel = model;
                    });
                  },
                  onFailure: (message) {
                    EasyLoading.showError(message!);
                  },
                );
              },
            ),
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                state.whenOrNull(
                  onGetCompletedSessionSuccess: (model) {
                    final ratingSessions =
                        model.where((e) => e.reviewStatus == false).toList();
                    if (ratingSessions.isNotEmpty &&
                        ratingSessions.first.ratingID != null) {
                      context.router.push(
                        CompletedSessionRoute(
                          completedSessions: ratingSessions,
                        ),
                      );
                    }
                  },
                );
              },
            ),
            BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                state.whenOrNull(
                  onLoading: EasyLoading.show,
                  onFailure: (error) {
                    EasyLoading.showError(error ?? '');
                  },
                );
              },
            ),
            BlocListener<BookingBloc, BookingState>(
              listener: (context, state) {
                state.whenOrNull(
                  onGetPendingPaymentSuccess: (model) {
                    // EasyLoading.dismiss();
                    pendingBookings = [];
                    setState(() {
                      pendingBookings = model
                          .where((element) =>
                              element.dateFrom!.isAfter(DateTime.now()))
                          .toList();
                    });
                  },
                  onGetUpcomingBookingsSuccess: (sessions) {
                    EasyLoading.dismiss();
                    upcomingBookings = [];
                    setState(() {
                      if (sessions.length > 3) {
                        upcomingBookings.addAll(sessions.getRange(0, 3));
                      } else {
                        upcomingBookings = sessions;
                      }
                    });
                  },
                  onFailure: (message) {
                    EasyLoading.showError(message!);
                  },
                );
              },
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileModel != null
                            ? 'Hi! ${profileModel!.firstName}'
                            : 'Hi! Bro',
                        style: AppTextStyle.titleMDSemiBold,
                      ),
                      Text(
                        getGreeting(),
                        style: AppTextStyle.subHeadLgRegular
                            .copyWith(color: darkText),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.router.push(const ChatRoute());
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: allPadding8,
                          decoration: const BoxDecoration(
                              color: lightPrimary, shape: BoxShape.circle),
                          child: Image.asset(
                            Assets.images.message.path,
                          ),
                        ),
                      ),
                      horizontalMargin4,
                      ValueListenableBuilder<bool>(
                        valueListenable: hasNotification,
                        builder: (contex, value, index) {
                          return InkWell(
                            onTap: () {
                              context.router.push(NotificationRoute(
                                  hasNotification: hasNotification));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: allPadding8,
                              decoration: const BoxDecoration(
                                  color: lightPrimary, shape: BoxShape.circle),
                              child: value
                                  ? Image.asset(
                                      Assets.images.notification.path,
                                    )
                                  : Icon(
                                      Icons.notifications_outlined,
                                      color: colorPrimary,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: RefreshIndicator.adaptive(
              onRefresh: _pullRefresh,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalMargin8,
                    UserStreakWidget(),
                    verticalMargin12,
                    Container(
                      padding: allPadding12,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: LineGraphWidget(),
                    ),
                    verticalMargin16,
                    viewAllWidget(
                      'My Upcoming Sessions',
                      upcomingBookings.isNotEmpty,
                      () => context.router.push(UpcomingSessionRoute()),
                    ),
                    if (upcomingBookings.isEmpty)
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: allPadding24,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              decoration: BoxDecoration(
                                  color: buttonBG,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                'No any upcoming bookings found.., \nTo add booking click on the button.',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodySMRegular
                                    .copyWith(color: darkText),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                AutoTabsRouter.of(context).setActiveIndex(1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorPrimary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Book New Session +',
                                style: AppTextStyle.bodySMRegular
                                    .copyWith(color: colorPrimary),
                              ),
                            ),
                          ),
                          verticalMargin16
                        ],
                      )
                    else
                      ListView.builder(
                        itemCount: upcomingBookings.length,
                        shrinkWrap: true,
                        padding: verticalPadding8,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final m = upcomingBookings[index];
                          return SessionCardWidget(
                            model: m.session!,
                            isPaid: m.isPaid ?? '',
                            isPressed: () {
                              context.router.push(UserSessionDetailRoute(
                                  model: m.session!, isPaid: m.isPaid ?? ''));
                            },
                          );
                        },
                      ),
                    verticalMargin12,
                    viewAllWidget(
                        'Pending Payments',
                        true,
                        () => context.router.push(PendingPaymentRoute(
                            totalSessions: pendingBookings))),
                    if (pendingBookings.isNotEmpty)
                      ListView.builder(
                        itemCount: pendingBookings.length > 3
                            ? 3
                            : pendingBookings.length,
                        shrinkWrap: true,
                        padding: verticalPadding8,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => PendingPaymentCard(
                          model: pendingBookings[index],
                        ),
                      )
                    else
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: allPadding24,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          decoration: BoxDecoration(
                              color: buttonBG,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'No Booked Sessions found',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodySMRegular
                                .copyWith(color: darkText),
                          ),
                        ),
                      ),
                    verticalMargin12,
                    BlocBuilder<TrainerBloc, TrainerState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => SizedBox(),
                          onGetTrainerListSuccess: (model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                viewAllWidget(
                                    'Recommended Trainer',
                                    true,
                                    () => AutoTabsRouter.of(context)
                                        .setActiveIndex(3)),
                                verticalMargin8,
                                if (model.recommendedTrainer != null &&
                                    model.recommendedTrainer!.isEmpty)
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: allPadding24,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 24),
                                      decoration: BoxDecoration(
                                          color: buttonBG,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        'No Trainers found.',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.bodySMRegular
                                            .copyWith(color: darkText),
                                      ),
                                    ),
                                  )
                                else
                                  SizedBox(
                                    height: ((200 / 888) * 100).h,
                                    child: ListView.builder(
                                      itemCount:
                                          model.recommendedTrainer?.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          TrainerItemWidget(
                                              model: model
                                                  .recommendedTrainer![index]),
                                    ),
                                  ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ).padding(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ),
      );

  Widget viewAllWidget(String title, bool showButton, VoidCallback onPressed) =>
      InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: showButton
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.subHeadLgSemiBold,
            ),
            if (showButton)
              Row(
                children: [
                  Text(
                    'View All',
                    style: AppTextStyle.subHeadSMRegular
                        .copyWith(color: colorPrimary),
                  ),
                  horizontalMargin4,
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: colorPrimary,
                    size: 16,
                  )
                ],
              )
          ],
        ),
      );
}
