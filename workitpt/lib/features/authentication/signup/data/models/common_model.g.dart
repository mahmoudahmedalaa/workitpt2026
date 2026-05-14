// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonModel<T> _$CommonModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CommonModel<T>(
      ok: json['ok'] as bool,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      currentPage: json['currentPage'] as int?,
      totalPage: json['totalPage'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$CommonModelToJson<T>(
  CommonModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'ok': instance.ok,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'message': instance.message,
      'accessToken': instance.accessToken,
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'limit': instance.limit,
      'total': instance.total,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
