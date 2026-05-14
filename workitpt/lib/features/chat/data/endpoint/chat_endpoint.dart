import 'package:flutter_rest_client/flutter_rest_client.dart';

class ChatEndpoint implements IRequestEndPoint {
  final String receiverId;
  ChatEndpoint(this.receiverId,);

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url =>
      '?sessionId:$receiverId';
}
