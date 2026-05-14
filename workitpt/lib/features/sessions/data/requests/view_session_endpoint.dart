import 'package:flutter_rest_client/flutter_rest_client.dart';

class ViewSessionEndpoint implements IRequestEndPoint {
  final String sessionID;
  @override
  RequestMethod method = RequestMethod.GET;

  ViewSessionEndpoint(this.sessionID);

  @override
  String get url => '/session/view/$sessionID';
}
