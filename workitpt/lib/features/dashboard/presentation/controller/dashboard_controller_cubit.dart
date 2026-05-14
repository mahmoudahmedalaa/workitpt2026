import 'package:bloc/bloc.dart';

import '../state/dashboard_state.dart';

class DashboardControllerCubit extends Cubit<DashboardState> {
  DashboardControllerCubit() : super(const DashboardState());

  void setPageIndex(int value) {
    emit(state.copyWith(pageIndex: value));
  }

  String getPageName(int index) {
    String title;
    switch (index) {
      case 0:
        title = 'home';
        break;
      case 1:
        title = 'Chat';

        break;
      case 2:
        title = 'Profile';

        break;

      default:
        throw Exception('No item found');
    }
    return title;
  }
}
