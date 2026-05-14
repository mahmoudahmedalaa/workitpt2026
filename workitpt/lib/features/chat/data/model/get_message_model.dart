import 'package:json_annotation/json_annotation.dart';
import '../../../authentication/login/data/models/user_model.dart';

part 'get_message_model.g.dart';

@JsonSerializable()
class GetMessageModel {
  final UserModel? currentlyLoggedUser;
  final String? msg;

  GetMessageModel(this.currentlyLoggedUser, this.msg);

  factory GetMessageModel.fromJson(Map<String, dynamic> json) =>
      _$GetMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessageModelToJson(this);
}
