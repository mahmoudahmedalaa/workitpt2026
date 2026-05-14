// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPModel _$OTPModelFromJson(Map<String, dynamic> json) => OTPModel(
      key: json['key'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$OTPModelToJson(OTPModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('code', instance.code);
  return val;
}
