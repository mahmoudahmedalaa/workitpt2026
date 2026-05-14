import 'package:flutter_rest_client/flutter_rest_client.dart';

class SignUpUserEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/auth/register';
}
