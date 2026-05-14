// import 'package:master_ui_collection/core/spacing.dart';
// import 'package:master_ui_collection/core/widgets/tab_bar/master_tabbar.dart';

// import '../core/export.dart';
// import '../core/widgets/localization/widget/localization_drop_down.dart';
// import '../core/widgets/theme/widget/theme_switch.dart';

// @RoutePage()
// class SettingView extends StatefulWidget {
//   const SettingView({super.key});

//   @override
//   State<SettingView> createState() => _SettingViewState();
// }

// class _SettingViewState extends State<SettingView> {
//   List<String> pages = [
//     'Home',
//     'Settings',
//     'Profile',
//     'Notifications',
//   ];

//   @override
//   Widget build(BuildContext context) => MasterTabBar2(
//         itemCount: pages.length,
//         indicatorHeight: 60,
//         scroolable: false,
//         unselectedLabelColor: Colors.green,
//         tabBuilder: (_, index) => Tab(
//           text: pages[index],
//           icon: const Icon(Icons.ac_unit_sharp, size: 20),
//         ),
//         pageBuilder: (_, index) => Container(
//           height: MediaQuery.sizeOf(context).height,
//           width: MediaQuery.sizeOf(context).width,
//           child: const Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [LocalizationDropDown(), SwitchThemeWidget()],
//           )),
//         ),
//         onPositionChange: (value) {},
//       ).paddingDirectional(top: spacing56);
// }
