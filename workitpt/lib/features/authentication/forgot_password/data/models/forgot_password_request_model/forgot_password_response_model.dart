import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ForgotPasswordResponseModel {
  @JsonKey(name: 'key')
  String? keyData;

  ForgotPasswordResponseModel({
    required this.keyData,
  });

  @override
  String toString() => 'ForgotPasswordRequestModel(keyData:$keyData)';

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseModelToJson(this);

  ForgotPasswordResponseModel copyWith({
    String? keyData,
  }) =>
      ForgotPasswordResponseModel(
        keyData: this.keyData,
      );

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ForgotPasswordResponseModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => keyData.hashCode;
}
