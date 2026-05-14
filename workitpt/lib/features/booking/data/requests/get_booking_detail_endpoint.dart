import 'package:flutter_rest_client/flutter_rest_client.dart';

class GetBookingDetailEndpoint implements IRequestEndPoint {
  final String id;
  @override
  RequestMethod method = RequestMethod.GET;

  GetBookingDetailEndpoint(this.id);

  @override
  String get url => '/booking/detail/$id';
}

class GetMultipleBookingDetailEndpoint implements IRequestEndPoint {
  final List<String> id;

  @override
  RequestMethod method = RequestMethod.GET;

  GetMultipleBookingDetailEndpoint(this.id);

  @override
  String get url => '/booking/detail/multiple?bookingIds=${id.join(',')}';
}
