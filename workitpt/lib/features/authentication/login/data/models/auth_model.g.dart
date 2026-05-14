// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      ok: json['ok'] as bool,
      message: json['message'] as String?,
      key: json['key'] as String?,
      user: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'ok': instance.ok,
      'message': instance.message,
      'key': instance.key,
      'data': instance.user?.toJson(),
    };
