import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetChatUserListEndPoint implements IRequestEndPoint {
  GetChatUserListEndPoint();

  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/message/interacted-lists';
}
