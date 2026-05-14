// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_admins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUserAdmins _$ChatUserAdminsFromJson(Map<String, dynamic> json) =>
    ChatUserAdmins(
      (json['adminList'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['superAdminList'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
