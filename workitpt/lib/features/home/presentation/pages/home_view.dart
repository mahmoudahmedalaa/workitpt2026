import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:workitpt/core/utils/app_utils.dart';
import 'package:workitpt/features/customer/data/model/customer_filter_model.dart';
import 'package:workitpt/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:workitpt/features/home/data/model/analytics_model.dart';
import 'package:workitpt/features/sessions/presentation/widgets/session_card_widget.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../notifications/presentation/bloc/notification_bloc.dart';
import '../../../profile/data/models/profile_model.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../sessions/data/models/session_filter_model.dart';
import '../../../sessions/data/models/session_response_model.dart';
import '../../../sessions/presentation/bloc/session_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/analytics_item.dart';
import '../widgets/customer_item.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<SessionResponseModel> totalSessions = [];
  SessionBloc sessionBloc;
  ProfileBloc profileBloc;
  CustomerBloc customerBloc;
  NotificationBloc notificationBloc;
  HomeBloc homeBloc;
  ProfileModel? profileModel;
  AnalyticsModel analyticsModel = AnalyticsModel();
  ValueNotifier<bool> hasNotification = ValueNotifier(false);

  _HomeViewState()
      : sessionBloc = getIt<SessionBloc>(),
        customerBloc = getIt<CustomerBloc>(),
        homeBloc = getIt<HomeBloc>(),
        notificationBloc = getIt<NotificationBloc>(),
        profileBloc = getIt<ProfileBloc>();

  getTrainerHomeData() {
    profileBloc.add(const ProfileEvent.getProfile());
    homeBloc.add(HomeEvent.getAnalytics());
    customerBloc.add(
        CustomerEvent.getCustomerList(filter: CustomerFilterModel(limit: 6)));
    sessionBloc.add(
        SessionEvent.getUpcomingSession(filter: SessionFilterModel(limit: 3)));
    notificationBloc.add(NotificationEvent.getNotifications());
  }

  Future<void> _pullRefresh() async {
    getTrainerHomeData();
  }

  @override
  void initState() {
    getTrainerHomeData();
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
          BlocProvider.value(value: customerBloc),
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
                    }
                  },
                );
              },
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                state.whenOrNull(
                  // onLoading: () {
                  //   EasyLoading.show(dismissOnTap: true);
                  // },
                  onGetProfileSuccess: (model) {
                    // EasyLoading.dismiss();
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
                  onGetAnalyticsSuccess: (model) {
                    setState(() {
                      analyticsModel = model;
                    });
                  },
                );
              },
            ),
            BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                state.whenOrNull(
                  onLoading: EasyLoading.show,
                  onGetUpcomingSessionSuccess: (sessions) {
                    EasyLoading.dismiss();
                    setState(() {
                      totalSessions = sessions.data!;
                    });
                  },
                  onGetSessionSuccess: (sessions) {
                    EasyLoading.dismiss();
                    setState(() {
                      totalSessions = sessions.data!;
                    });
                  },
                  onUpdateSessionSuccess: (session) {
                    EasyLoading.showSuccess(
                      'Session updated successfully.',
                      duration: const Duration(milliseconds: 1600),
                    );
                    context.router.pop();
                    Future.delayed(
                        const Duration(milliseconds: 800), getTrainerHomeData);
                  },
                  onDeleteSessionSuccess: (session) {
                    EasyLoading.showSuccess('Session deleted successfully.');
                    context.router.pop();
                    Future.delayed(
                        const Duration(milliseconds: 800), getTrainerHomeData);
                  },
                  onFailure: (error) {
                    EasyLoading.showError(error ?? '');
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
                          context.router.push(const WalletRoute());
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: allPadding8,
                          decoration: const BoxDecoration(
                              color: lightPrimary, shape: BoxShape.circle),
                          child: Image.asset(
                            Assets.images.wallet.path,
                          ),
                        ),
                      ),
                      horizontalMargin4,
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
                    viewAllWidget(
                        'Analytics',
                        true,
                        () => context.router
                            .push(AnalyticsRoute(model: analyticsModel))),
                    AnalyticsItemWidget(
                      model: analyticsModel,
                    ),
                    verticalMargin24,
                    viewAllWidget('Upcoming Sessions', totalSessions.isNotEmpty,
                        () => AutoTabsRouter.of(context).setActiveIndex(1)),
                    if (totalSessions.isEmpty)
                      Column(
                        children: <Widget>[
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
                                'No Data for upcoming sessions, \nTo add data click on the button.',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodySMRegular
                                    .copyWith(color: darkText),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: colorPrimary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Add New Session +',
                              style: AppTextStyle.bodySMRegular
                                  .copyWith(color: colorPrimary),
                            ),
                          ).gestures(
                            onTap: () {
                              AutoTabsRouter.of(context).setActiveIndex(1);
                              context.router.push(const AddSesssionRoute());
                            },
                          ),
                          verticalMargin16
                        ],
                      )
                    else
                      ListView.builder(
                        itemCount: totalSessions.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => SessionCardWidget(
                          model: totalSessions[index],
                          isPressed: () {
                            context.router.push(
                              TrainerSessionDetailRoute(
                                model: totalSessions[index],
                                sessionBloc: sessionBloc,
                              ),
                            );
                          },
                          isPaid: totalSessions[index].booked! ? 'Paid' : null,
                        ),
                      ),
                    verticalMargin12,
                    BlocBuilder<CustomerBloc, CustomerState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => SizedBox(),
                          onGetCustomerListSuccess: (model) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                viewAllWidget(
                                  'Customer',
                                  true,
                                  () => AutoTabsRouter.of(context)
                                      .setActiveIndex(3),
                                ),
                                if (model.isEmpty)
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
                                        'No Data for Customer.',
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
                                      itemCount: model.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          CustomerItemWidget(
                                        model: model[index],
                                      ),
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
          children: <Widget>[
            Text(
              title,
              style: AppTextStyle.subHeadLgSemiBold,
            ),
            if (showButton)
              Row(
                children: <Widget>[
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
      ).padding(bottom: 12);
}
