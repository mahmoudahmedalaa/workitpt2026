import 'package:flutter_rest_client/flutter_rest_client.dart';

class DeleteAccountEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.DELETE;

  @override
  String get url => '/auth/delete-account';
}
