import 'package:flutter_rest_client/flutter_rest_client.dart';

class UploadImageEndpoint implements IRequestEndPoint {
  @override
  RequestMethod method = RequestMethod.POST;

  @override
  String get url => 'https://workitpt-api.goswivt.com/api/upload?target=files';
}
