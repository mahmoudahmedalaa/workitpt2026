// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpModel _$UserSignUpModelFromJson(Map<String, dynamic> json) =>
    UserSignUpModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      fcmToken: json['fcmToken'] as String?,
      accessToken: json['accessToken'] as String?,
      userSecret: json['userSecret'] as String?,
    );

Map<String, dynamic> _$UserSignUpModelToJson(UserSignUpModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('role', instance.role);
  writeNotNull('fcmToken', instance.fcmToken);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('userSecret', instance.userSecret);
  return val;
}
