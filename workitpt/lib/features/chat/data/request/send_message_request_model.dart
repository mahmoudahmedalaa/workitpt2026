import 'package:json_annotation/json_annotation.dart';

part 'send_message_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SendMessageRequestModel {
  final String sessionId;
  final String message;


  SendMessageRequestModel(this.sessionId, this.message);

  factory SendMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestModelToJson(this);
}
