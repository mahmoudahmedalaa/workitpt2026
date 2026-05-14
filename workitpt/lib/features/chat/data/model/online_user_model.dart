import 'package:json_annotation/json_annotation.dart';

part 'online_user_model.g.dart';

@JsonSerializable()
class OnlineUserModel {
  final String userId;
  final String socketId;

  OnlineUserModel(this.userId, this.socketId);

  factory OnlineUserModel.fromJson(Map<String, dynamic> json) =>
      _$OnlineUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineUserModelToJson(this);
}
