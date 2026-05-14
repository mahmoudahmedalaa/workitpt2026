import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_token_model.g.dart';

@JsonSerializable()
class ForgotPasswordTokenModel {
  final String? token;

  const ForgotPasswordTokenModel({required this.token});

  @override
  String toString() => 'Data(token: $token)';

  factory ForgotPasswordTokenModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordTokenModelToJson(this);

  ForgotPasswordTokenModel copyWith({
    String? token,
  }) =>
      ForgotPasswordTokenModel(
        token: token ?? this.token,
      );

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ForgotPasswordTokenModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => token.hashCode;
}
