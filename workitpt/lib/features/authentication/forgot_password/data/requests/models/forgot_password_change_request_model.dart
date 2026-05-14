import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_change_request_model.g.dart';

@JsonSerializable()
class ForgotPasswordChangeRequestModel extends IRequestModel {
  final String token;
  final String newPassword;

  ForgotPasswordChangeRequestModel({
    required this.token,
    required this.newPassword,
  });

  factory ForgotPasswordChangeRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$ForgotPasswordChangeRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ForgotPasswordChangeRequestModelToJson(this);
}
