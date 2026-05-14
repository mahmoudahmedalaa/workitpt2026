import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel extends BaseRequestModel {
  final String? role;
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? email;
  final String? status;
  final String? userSecret;
  final String? accessToken;
  final String? authProvider;

  UserModel({
    this.role,
    this.id,
    this.name,
    this.email,
    this.status,
    this.userSecret,
    this.accessToken,
    this.authProvider,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
