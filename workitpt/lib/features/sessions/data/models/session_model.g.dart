// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      sessionTitle: json['session_title'] as String?,
      session: json['session'] as String?,
      sessionType: json['session_type'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
      price: json['price'] as int?,
      location: json['location'] as String?,
      flexibleLocation: json['flexible_location'] as bool?,
      description: json['description'] as String?,
      bring: json['what_to_bring'] as String?,
      benefits: json['benefits'] as String?,
      expect: json['what_to_expect'] as String?,
      selectType: json['select_type'] as String?,
      occurrence: json['occurrence'] as String?,
      dayOfWeek: (json['dayOfWeek'] as List<dynamic>?)
          ?.map((e) => DayOfWeek.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      coordicates: json['coordicates'] == null
          ? null
          : Coordinates.fromJson(json['coordicates'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      onlineUrl: json['online_url'] as String?,
      numOfAttendees: json['no_of_attendees'] as int?,
      locationRange: json['location_range'] as int?,
      location_on_map: json['location_on_map'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('flexible_location', instance.flexibleLocation);
  writeNotNull('session_title', instance.sessionTitle);
  writeNotNull('session', instance.session);
  writeNotNull('session_type', instance.sessionType);
  writeNotNull('difficulty_level', instance.difficultyLevel);
  writeNotNull('price', instance.price);
  writeNotNull('location', instance.location);
  writeNotNull('description', instance.description);
  writeNotNull('what_to_expect', instance.expect);
  writeNotNull('what_to_bring', instance.bring);
  writeNotNull('benefits', instance.benefits);
  writeNotNull('select_type', instance.selectType);
  writeNotNull('occurrence', instance.occurrence);
  writeNotNull(
      'dayOfWeek', instance.dayOfWeek?.map((e) => e.toJson()).toList());
  writeNotNull('time_from', instance.timeFrom);
  writeNotNull('time_to', instance.timeTo);
  writeNotNull('coordicates', instance.coordicates?.toJson());
  writeNotNull('images', instance.images);
  writeNotNull('online_url', instance.onlineUrl);
  writeNotNull('no_of_attendees', instance.numOfAttendees);
  writeNotNull('location_range', instance.locationRange);
  writeNotNull('location_on_map', instance.location_on_map);
  return val;
}

DayOfWeek _$DayOfWeekFromJson(Map<String, dynamic> json) => DayOfWeek(
      day: json['day'] as String?,
      dateFrom: json['date_from'] as String?,
      dateTo: json['date_to'] as String?,
    );

Map<String, dynamic> _$DayOfWeekToJson(DayOfWeek instance) => <String, dynamic>{
      'day': instance.day,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
    };
