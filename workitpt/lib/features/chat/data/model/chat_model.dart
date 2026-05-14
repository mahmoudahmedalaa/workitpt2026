import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel extends IRequestModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "sender")
  final Sender? sender;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "session")
  final SessionResponseModel? session;
  @JsonKey(name: "seen")
  final bool? seen;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  ChatModel({
    this.id,
    this.sender,
    this.message,
    this.session,
    this.seen,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}

@JsonSerializable()
class Sender {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "avatar")
  final String? avatar;

  Sender({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.avatar,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}
