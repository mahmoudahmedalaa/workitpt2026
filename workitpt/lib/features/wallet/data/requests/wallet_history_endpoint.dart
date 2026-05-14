import 'package:flutter_rest_client/flutter_rest_client.dart';

class WalletHistoryEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/wallet/history';
}
