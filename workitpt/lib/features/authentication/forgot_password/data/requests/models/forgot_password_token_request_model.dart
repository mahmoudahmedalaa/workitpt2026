import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_token_request_model.g.dart';

@JsonSerializable()
class ForgotPasswordTokenRequestModel extends IRequestModel {
  final String code;
  final String key;

  ForgotPasswordTokenRequestModel({required this.code, required this.key});

  factory ForgotPasswordTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordTokenRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ForgotPasswordTokenRequestModelToJson(this);
}
