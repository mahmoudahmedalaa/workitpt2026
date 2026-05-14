import 'package:flutter_rest_client/flutter_rest_client.dart';

class DeleteFileEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.DELETE;

  @override
  String get url => '/auth/profile/images';
}
