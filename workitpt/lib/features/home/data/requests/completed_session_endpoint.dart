import 'package:flutter_rest_client/flutter_rest_client.dart';

class CompletedSessionEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/session/completed-session';
}
