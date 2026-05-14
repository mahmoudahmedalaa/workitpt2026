// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsModelImpl _$$UserDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailsModelImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      amount: json['amount'] as int?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$UserDetailsModelImplToJson(
        _$UserDetailsModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'amount': instance.amount,
      'password': instance.password,
      'phone': instance.phone,
      'status': instance.status,
    };
