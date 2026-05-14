// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDetailsModel _$SessionDetailsModelFromJson(Map<String, dynamic> json) =>
    SessionDetailsModel(
      id: json['_id'] as String?,
      sessionTitle: json['session_title'] as String?,
      session: json['session'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
      price: json['price'] as int?,
      sessionType: json['session_type'] as String?,
      selectType: json['select_type'] as String?,
      occurrence: json['occurrence'] as String?,
      dateFrom: json['date_from'] == null
          ? null
          : DateTime.parse(json['date_from'] as String),
      dateTo: json['date_to'] == null
          ? null
          : DateTime.parse(json['date_to'] as String),
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      location: json['location'] as String?,
      locationOnMap: json['location_on_map'] as String?,
      coordicates: json['coordicates'] == null
          ? null
          : Coordicates.fromJson(json['coordicates'] as Map<String, dynamic>),
      dayOfWeek: json['day_of_week'] as String?,
      description: json['description'] as String?,
      whatToExpect: json['what_to_expect'] as String?,
      whatToBring: json['what_to_bring'] as String?,
      benefits: json['benefits'] as String?,
      booked: json['booked'] as bool?,
      trainer: json['trainer'] as String?,
      referenceId: json['referenceId'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      locationRange: json['location_range'] as int?,
      flexibleLocation: json['flexible_location'] as bool?,
      ratings: json['ratings'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$SessionDetailsModelToJson(
        SessionDetailsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'session_title': instance.sessionTitle,
      'session': instance.session,
      'difficulty_level': instance.difficultyLevel,
      'price': instance.price,
      'session_type': instance.sessionType,
      'select_type': instance.selectType,
      'occurrence': instance.occurrence,
      'date_from': instance.dateFrom?.toIso8601String(),
      'date_to': instance.dateTo?.toIso8601String(),
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
      'location': instance.location,
      'location_on_map': instance.locationOnMap,
      'coordicates': instance.coordicates,
      'day_of_week': instance.dayOfWeek,
      'description': instance.description,
      'what_to_expect': instance.whatToExpect,
      'what_to_bring': instance.whatToBring,
      'benefits': instance.benefits,
      'booked': instance.booked,
      'trainer': instance.trainer,
      'referenceId': instance.referenceId,
      'images': instance.images,
      'location_range': instance.locationRange,
      'flexible_location': instance.flexibleLocation,
      'ratings': instance.ratings,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

Coordicates _$CoordicatesFromJson(Map<String, dynamic> json) => Coordicates(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$CoordicatesToJson(Coordicates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      '_id': instance.id,
    };
