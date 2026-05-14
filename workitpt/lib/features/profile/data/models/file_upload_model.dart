import 'package:json_annotation/json_annotation.dart';

part 'file_upload_model.g.dart';

@JsonSerializable()
class FileUploadModel {
  final List<String> files;

  FileUploadModel({required this.files});

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileUploadModelToJson(this);
}

@JsonSerializable()
class FileUploadResponseModel {
  @JsonKey(name: 'path')
  final List<String>? path;

  FileUploadResponseModel({
    this.path,
  });

  factory FileUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileUploadResponseModelToJson(this);
}
