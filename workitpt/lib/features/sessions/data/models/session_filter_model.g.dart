// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionFilterModel _$SessionFilterModelFromJson(Map<String, dynamic> json) =>
    SessionFilterModel(
      selectType: json['selectType'] as String?,
      search: json['search'] as String?,
      sessionType: json['sessionType'] as String?,
      workoutLocation: (json['workoutLocation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      session:
          (json['session'] as List<dynamic>?)?.map((e) => e as String).toList(),
      difficult: json['difficult'] as String?,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      booked: json['booked'] as String?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$SessionFilterModelToJson(SessionFilterModel instance) =>
    <String, dynamic>{
      'selectType': instance.selectType,
      'search': instance.search,
      'workoutLocation': instance.workoutLocation,
      'sessionType': instance.sessionType,
      'session': instance.session,
      'difficult': instance.difficult,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'booked': instance.booked,
      'page': instance.page,
      'limit': instance.limit,
    };
