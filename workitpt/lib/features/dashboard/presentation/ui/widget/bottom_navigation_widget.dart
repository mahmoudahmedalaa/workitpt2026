import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/export.dart';
import '../../controller/dashboard_controller_cubit.dart';
import '../../state/dashboard_state.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => DashboardControllerCubit(),
        child: BlocBuilder<DashboardControllerCubit, DashboardState>(
          builder: (context, state) => NavigationBar(
            selectedIndex: state.pageIndex,
            onDestinationSelected: (value) => _onItemSelected(context, value),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
              NavigationDestination(
                  icon: Icon(Icons.access_alarm_outlined), label: 'Profile'),
            ],
          ),
        ),
      );

  void _onItemSelected(BuildContext context, int index) {
    context.read<DashboardControllerCubit>().setPageIndex(index);
    switch (index) {
      case 0:
        context.read<DashboardControllerCubit>().getPageName(index);

        break;
      case 1:
        context.read<DashboardControllerCubit>().getPageName(index);

        break;
      case 2:
        context.read<DashboardControllerCubit>().getPageName(index);

        break;

      default:
        throw Exception('No item found');
    }
  }
}
