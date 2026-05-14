import 'package:flutter_rest_client/flutter_rest_client.dart';

class VerifyNumberRequestEndpoiunt implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;
  VerifyNumberRequestEndpoiunt();

  @override
  String get url => '/auth/verify';
}
