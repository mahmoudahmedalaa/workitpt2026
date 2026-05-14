import 'package:flutter_rest_client/flutter_rest_client.dart';

class RatingEndPoint implements IRequestEndPoint {
  final String sessionID;
  @override
  RequestMethod method = RequestMethod.POST;

  RatingEndPoint(this.sessionID);

  @override
  String get url => '/session/session-rating/$sessionID';
}
