import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetSessionEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/session/list';
}

class GetPreviousSessionEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/session/previous-session';
}

class GetUpcomingSessionEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/session/upcomming-session';
}
