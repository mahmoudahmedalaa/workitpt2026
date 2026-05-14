import 'package:flutter_rest_client/flutter_rest_client.dart';

class WithdrawEndPoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => '/withdraw/balance';
}
