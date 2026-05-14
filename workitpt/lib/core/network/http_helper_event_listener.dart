import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';

import '../../features/authentication/session/i_session_manager.dart';

@Injectable(as: IHttpHelperEventListening)
class HttpHelperEventListener implements IHttpHelperEventListening {
  final ISessionManager sessionManager;
  HttpHelperEventListener(this.sessionManager);
  @override
  Future<void> clearSession() async {
    await sessionManager.clearSession();

  }
}
