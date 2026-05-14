// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationvalidate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationValidateModel _$LocationValidateModelFromJson(
        Map<String, dynamic> json) =>
    LocationValidateModel(
      sessionId: json['sessionId'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationValidateModelToJson(
        LocationValidateModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
