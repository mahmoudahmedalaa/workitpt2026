// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      role: json['role'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      userSecret: json['userSecret'] as String?,
      accessToken: json['accessToken'] as String?,
      authProvider: json['authProvider'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', instance.role);
  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('status', instance.status);
  writeNotNull('userSecret', instance.userSecret);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('authProvider', instance.authProvider);
  return val;
}
