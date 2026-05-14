import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'auth_model.g.dart';

//
@JsonSerializable(explicitToJson: true)
class AuthModel {
  final bool ok;
  final String? message;
  final String? key;
  @JsonKey(name: 'data')
  final UserModel? user;

  AuthModel({required this.ok, this.message, this.key, this.user});
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
