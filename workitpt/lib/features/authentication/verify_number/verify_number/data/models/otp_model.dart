import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_model.g.dart';

@JsonSerializable(includeIfNull: false)
class OTPModel extends BaseRequestModel {
  final String? key;
  final String? code;

  OTPModel({
    this.key,
    this.code,
  });

  factory OTPModel.fromJson(Map<String, dynamic> data) =>
      _$OTPModelFromJson(data);

  @override
  Map<String, dynamic> toJson() => _$OTPModelToJson(this);
}
