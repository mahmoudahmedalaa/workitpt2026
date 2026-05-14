// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadModel _$FileUploadModelFromJson(Map<String, dynamic> json) =>
    FileUploadModel(
      files: (json['files'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FileUploadModelToJson(FileUploadModel instance) =>
    <String, dynamic>{
      'files': instance.files,
    };

FileUploadResponseModel _$FileUploadResponseModelFromJson(
        Map<String, dynamic> json) =>
    FileUploadResponseModel(
      path: (json['path'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FileUploadResponseModelToJson(
        FileUploadResponseModel instance) =>
    <String, dynamic>{
      'path': instance.path,
    };
