// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordTokenRequestModel _$ForgotPasswordTokenRequestModelFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordTokenRequestModel(
      code: json['code'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$ForgotPasswordTokenRequestModelToJson(
        ForgotPasswordTokenRequestModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'key': instance.key,
    };
