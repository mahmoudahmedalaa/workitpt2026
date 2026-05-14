// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_change_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordChangeRequestModel _$ForgotPasswordChangeRequestModelFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordChangeRequestModel(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ForgotPasswordChangeRequestModelToJson(
        ForgotPasswordChangeRequestModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
