import 'package:flutter_rest_client/flutter_rest_client.dart';

class SocialLoginRequestEndPoint implements IRequestEndPoint {
  final String authProvider;
  @override
  RequestMethod method = RequestMethod.POST;

  SocialLoginRequestEndPoint(this.authProvider);

  @override
  String get url => '/auth/login?authProvider=$authProvider';
}
