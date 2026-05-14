import 'package:flutter_rest_client/flutter_rest_client.dart';

class CustomerDetailEndpoint implements IRequestEndPoint {
  final String id;
  @override
  RequestMethod method = RequestMethod.GET;

  CustomerDetailEndpoint(this.id);

  @override
  String get url => '/users/customer/$id/list';
}
