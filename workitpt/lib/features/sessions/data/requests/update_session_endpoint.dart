import 'package:flutter_rest_client/flutter_rest_client.dart';

class UpdateSessionEndpoint implements IRequestEndPoint {
  final String referenceID;
  @override
  RequestMethod method = RequestMethod.PUT;

  UpdateSessionEndpoint(this.referenceID);

  @override
  String get url => '/session/$referenceID';
}
