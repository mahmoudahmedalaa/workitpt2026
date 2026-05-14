import 'package:flutter_rest_client/flutter_rest_client.dart';

class ChangePasswordEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.PATCH;

  ChangePasswordEndpoint();

  @override
  String get url => '/auth/profile/update-cred';
}
