import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_signup_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserSignUpModel extends BaseRequestModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? role;
  final String? fcmToken;
  final String? accessToken;
  final String? userSecret;

  UserSignUpModel(
      {this.firstName,
      this.lastName,
      this.role,
      this.email,
      this.password,
      this.fcmToken,
      this.accessToken,
      this.userSecret});

  factory UserSignUpModel.fromJson(Map<String, dynamic> data) =>
      _$UserSignUpModelFromJson(data);

  @override
  Map<String, dynamic> toJson() => _$UserSignUpModelToJson(this);
}
