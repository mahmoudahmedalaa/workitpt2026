// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessageModel _$GetMessageModelFromJson(Map<String, dynamic> json) =>
    GetMessageModel(
      json['currentlyLoggedUser'] == null
          ? null
          : UserModel.fromJson(
              json['currentlyLoggedUser'] as Map<String, dynamic>),
      json['msg'] as String?,
    );

Map<String, dynamic> _$GetMessageModelToJson(GetMessageModel instance) =>
    <String, dynamic>{
      'currentlyLoggedUser': instance.currentlyLoggedUser,
      'msg': instance.msg,
    };
