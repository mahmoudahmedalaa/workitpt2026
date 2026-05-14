import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetReceiptEndpoint implements IRequestEndPoint {
  final List<String> id;
  @override
  RequestMethod method = RequestMethod.GET;

  GetReceiptEndpoint(this.id);

  @override
  String get url => '/booking/receipt?bookingIds=${id.join(',')}';
}
