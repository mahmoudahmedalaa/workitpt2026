import 'package:flutter_rest_client/flutter_rest_client.dart';

class DeleteSessionEndpoint implements IRequestEndPoint {
  final String sessionID;
  @override
  RequestMethod method = RequestMethod.DELETE;

  DeleteSessionEndpoint(this.sessionID);

  @override
  String get url => '/session/$sessionID';
}
