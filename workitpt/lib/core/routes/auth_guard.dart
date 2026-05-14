import 'package:injectable/injectable.dart';

import '../../features/authentication/session/i_session_manager.dart';
import '../export.dart';
import 'app_router.dart';

@injectable
class AuthGuard extends AutoRouteGuard {
  final ISessionManager _sessionManager;

  AuthGuard(this._sessionManager);

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final userModel = await _sessionManager.getCurrentUser();
    final isAuthenticated = await _sessionManager.isAuthenticated;
    if (await _sessionManager.getToken() != null && isAuthenticated) {
      if (userModel != null) {
        if (userModel.status == 'INACTIVE') {
          await router.push(
              VerifyNumberRoute(role: userModel.role!, mail: userModel.email!));
        } else {
          await router.push(DashboardRoute(role: userModel.role!));
        }
      } else {
        debugPrint('hereee--->${await _sessionManager.getToken()}');
        _sessionManager.clearSession();
        resolver.next(true);
      }
    } else {
      _sessionManager.clearSession();
      resolver.next(true);
    }
  }
}
