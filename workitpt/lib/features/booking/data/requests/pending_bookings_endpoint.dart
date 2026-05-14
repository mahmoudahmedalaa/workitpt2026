import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetPendingBookingsEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.GET;

  @override
  String get url => '/booking/pending-payments';
}