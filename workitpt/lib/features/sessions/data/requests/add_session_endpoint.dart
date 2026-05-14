import 'package:flutter_rest_client/flutter_rest_client.dart';

class AddSessionEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/session/add';
}
