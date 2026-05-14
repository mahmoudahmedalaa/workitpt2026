import 'package:flutter_rest_client/flutter_rest_client.dart';

class ChatListEndpoint implements IRequestEndPoint {
  final String sessionId;
  @override
  RequestMethod method = RequestMethod.GET;

  ChatListEndpoint(this.sessionId);

  @override
  String get url => '/message/$sessionId?limit=50';
}
