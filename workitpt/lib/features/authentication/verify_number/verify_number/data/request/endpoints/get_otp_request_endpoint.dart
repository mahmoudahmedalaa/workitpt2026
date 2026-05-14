import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetOtpRequestEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;
  GetOtpRequestEndpoint();

  @override
  String get url => '/auth/verification';
}
