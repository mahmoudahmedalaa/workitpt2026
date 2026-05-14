// final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_model.freezed.dart';
part 'user_details_model.g.dart';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

@freezed
class UserDetailsModel with _$UserDetailsModel {
  const factory UserDetailsModel({
    String? name,
    String? email,
    int? amount,
    String? password,
    String? phone,
    String? status,
  }) = _UserDetailsModel;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsModelFromJson(json);
}
