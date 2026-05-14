import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:workitpt/features/profile/data/models/profile_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  final String role;
  const DashboardView({super.key, required this.role});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // String? role;

  PageRouteInfo<dynamic> getSessionPage() {
    if (widget.role == 'TRAINER') {
      return const TrainerSessionRoute();
    } else {
      return const UserSessionRoute();
    }
  }

  PageRouteInfo<dynamic> getHomePage() {
    if (widget.role == 'TRAINER') {
      return HomeRoute();
    } else {
      return UserHomeRoute();
    }
  }

  PageRouteInfo<dynamic> getTrainerCustomerPage() {
    if (widget.role == 'TRAINER') {
      return const CustomerRoute();
    } else {
      return const TrainerRoute();
    }
  }

  ProfileBloc profileBloc;
  ProfileModel? profileModel;

  _DashboardViewState() : profileBloc = getIt<ProfileBloc>();

  ValueNotifier<bool> isTrainerApproved = ValueNotifier(true);

  getTrainerApprove() {
    if (profileModel!.role == 'TRAINER') {
      if (!profileModel!.profileCompleted!) {
        setState(() {
          isTrainerApproved.value = false;
        });
        return;
      }
      if (profileModel!.trainerInfo!.verificationStatus == 'ACTIVE') {
        setState(() {
          isTrainerApproved.value = true;
        });
      } else {
        setState(() {
          isTrainerApproved.value = false;
        });
      }
    } else {
      setState(() {
        isTrainerApproved.value = true;
      });
    }
  }

  @override
  void initState() {
    // getUserRole();
    profileBloc.add(ProfileEvent.getProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              onGetProfileSuccess: (model) {
                setState(() {
                  profileModel = model;
                });
                getTrainerApprove();
              },
              onFailure: (message) {
                EasyLoading.showError(message!);
              },
            );
          },
          child: ValueListenableBuilder(
              valueListenable: isTrainerApproved,
              builder: (context, value, child) {
                return AutoTabsRouter(
                  // list of your tab routes
                  // routes used here must be declared as children
                  // routes of /dashboard
                  routes: value
                      ? [
                          getHomePage(),
                          getSessionPage(),
                          const CalendarRoute(),
                          getTrainerCustomerPage(),
                          ProfileRoute(isTrainerApproved: isTrainerApproved),
                        ]
                      : [
                          ProfileRoute(isTrainerApproved: isTrainerApproved),
                          ProfileRoute(isTrainerApproved: isTrainerApproved),
                          ProfileRoute(isTrainerApproved: isTrainerApproved),
                          ProfileRoute(isTrainerApproved: isTrainerApproved),
                          ProfileRoute(isTrainerApproved: isTrainerApproved),
                        ],
                  transitionBuilder: (context, child, animation) =>
                      FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  builder: (context, child) {
                    final tabsRouter = AutoTabsRouter.of(context);
                    return Scaffold(
                      body: child,
                      backgroundColor: Colors.white,
                      bottomNavigationBar: SalomonBottomBar(
                        backgroundColor: Colors.white,
                        // selectedItemColor: colorPrimary,
                        itemPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        unselectedItemColor: Colors.grey,
                        selectedColorOpacity: 1,
                        currentIndex: isTrainerApproved.value
                            ? tabsRouter.activeIndex
                            : 4,
                        onTap: isTrainerApproved.value
                            ? tabsRouter.setActiveIndex
                            : (p0) {},
                        items: [
                          SalomonBottomBarItem(
                            title: const Text(
                              'Home',
                              style: TextStyle(color: colorPrimary),
                            ),
                            selectedColor: const Color(0xffe2f0ff),
                            icon: ImageIcon(
                              AssetImage(Assets.icons.home.path),
                            ),
                            activeIcon: ImageIcon(
                              AssetImage(Assets.icons.home.path),
                              color: colorPrimary,
                            ),
                          ),
                          SalomonBottomBarItem(
                            title: const Text(
                              'Sessions',
                              style: TextStyle(color: colorPrimary),
                            ),
                            selectedColor: const Color(0xffe2f0ff),
                            icon: ImageIcon(
                              AssetImage(Assets.icons.clock.path),
                            ),
                            activeIcon: ImageIcon(
                              AssetImage(Assets.icons.clock.path),
                              color: colorPrimary,
                            ),
                          ),
                          SalomonBottomBarItem(
                            title: const Text(
                              'Schedules',
                              style: TextStyle(color: colorPrimary),
                            ),
                            selectedColor: const Color(0xffe2f0ff),
                            icon: ImageIcon(
                              AssetImage(Assets.icons.calendar.path),
                            ),
                            activeIcon: ImageIcon(
                              AssetImage(Assets.icons.calendar.path),
                              color: colorPrimary,
                            ),
                          ),
                          SalomonBottomBarItem(
                            title: Text(
                              widget.role == 'TRAINER' ? 'Customer' : 'Trainer',
                              style: const TextStyle(color: colorPrimary),
                            ),
                            selectedColor: const Color(0xffe2f0ff),
                            icon: ImageIcon(
                              AssetImage(Assets.icons.graph.path),
                            ),
                            activeIcon: ImageIcon(
                              AssetImage(Assets.icons.graph.path),
                              color: colorPrimary,
                            ),
                          ),
                          SalomonBottomBarItem(
                            title: const Text(
                              'Profile',
                              style: TextStyle(color: colorPrimary),
                            ),
                            selectedColor: const Color(0xffe2f0ff),
                            icon: ImageIcon(
                              AssetImage(Assets.icons.user.path),
                            ),
                            activeIcon: ImageIcon(
                              AssetImage(Assets.icons.user.path),
                              color: colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ),
      );
}
