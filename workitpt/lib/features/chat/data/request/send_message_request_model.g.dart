// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequestModel _$SendMessageRequestModelFromJson(
        Map<String, dynamic> json) =>
    SendMessageRequestModel(
      json['sessionId'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$SendMessageRequestModelToJson(
        SendMessageRequestModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'message': instance.message,
    };
