import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  @JsonKey(name: '_id')
  final String id;
  final String? from;
  final String? to;
  final String? message;
  final String? createdAt;
  final String? updatedAt;
  final String? image;

  MessageModel(this.id, this.from, this.to, this.message, this.createdAt,
      this.updatedAt, this.image);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
