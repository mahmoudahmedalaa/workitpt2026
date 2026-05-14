import 'package:flutter_rest_client/flutter_rest_client.dart';

class UserStreakEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/users/streak';
}
