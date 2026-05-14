import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.g.dart';
@JsonSerializable(explicitToJson: false)
class NotificationModel extends IRequestModel {
  @JsonKey(name:'_id')
  final String? id;
  // final String? user;
  final String? title;
  final String? body;
  final bool? isAdmin;
  final String? data;
  final bool? seen;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationModel({
    this.id,
    // this.user,
    this.title,
    this.body,
    this.isAdmin,
    this.data,
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
//
// @JsonSerializable()
// class User {
//   final String? id;
//   final String? firstName;
//   final String? lastName;
//   final String? avatar;
//   final String? role;
//
//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.avatar,
//     this.role,
//   });
//   factory User.fromJson(Map<String, dynamic> json) =>
//       _$UserFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
