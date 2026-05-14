import 'package:json_annotation/json_annotation.dart';
import '../../../authentication/login/data/models/user_model.dart';

part 'chat_user_admins.g.dart';

@JsonSerializable(createToJson: false)
class ChatUserAdmins {
  final List<UserModel>? adminList;
  final List<UserModel>? superAdminList;
  ChatUserAdmins(this.adminList, this.superAdminList);
  factory ChatUserAdmins.fromJson(Map<String, dynamic> json) =>
      _$ChatUserAdminsFromJson(json);
}
