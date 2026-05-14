import 'package:flutter_rest_client/flutter_rest_client.dart';

class TrainerDetailEndpoint implements IRequestEndPoint {
  final String id;
  @override
  RequestMethod method = RequestMethod.GET;

  TrainerDetailEndpoint(this.id);

  @override
  String get url => '/users/trainer/$id/list';
}
