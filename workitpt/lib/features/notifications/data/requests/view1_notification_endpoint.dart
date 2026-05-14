import 'package:flutter_rest_client/flutter_rest_client.dart';

class ViewOneNotificationEndPoint implements IRequestEndPoint {
  final String id;
  ViewOneNotificationEndPoint({required this.id});

  @override
  RequestMethod method = RequestMethod.PATCH;

  @override
  String get url => '/notification/$id/view';
}