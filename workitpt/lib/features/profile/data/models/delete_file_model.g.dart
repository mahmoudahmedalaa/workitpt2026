// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFileModel _$DeleteFileModelFromJson(Map<String, dynamic> json) =>
    DeleteFileModel(
      certificate: json['certificate'] as String?,
      images: json['images'] as String?,
    );

Map<String, dynamic> _$DeleteFileModelToJson(DeleteFileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificate', instance.certificate);
  writeNotNull('images', instance.images);
  return val;
}
