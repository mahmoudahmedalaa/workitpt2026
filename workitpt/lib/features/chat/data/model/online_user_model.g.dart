// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineUserModel _$OnlineUserModelFromJson(Map<String, dynamic> json) =>
    OnlineUserModel(
      json['userId'] as String,
      json['socketId'] as String,
    );

Map<String, dynamic> _$OnlineUserModelToJson(OnlineUserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'socketId': instance.socketId,
    };
