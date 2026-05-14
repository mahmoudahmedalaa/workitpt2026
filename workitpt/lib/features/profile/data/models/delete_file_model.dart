import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_file_model.g.dart';

@JsonSerializable(includeIfNull: false)
class DeleteFileModel extends IRequestModel {
  @JsonKey(name: 'certificate')
  String? certificate;
  @JsonKey(name: 'images')
  String? images;

  DeleteFileModel({this.certificate, this.images});

  factory DeleteFileModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteFileModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeleteFileModelToJson(this);
}
