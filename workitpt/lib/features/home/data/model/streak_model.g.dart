// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreakModel _$StreakModelFromJson(Map<String, dynamic> json) => StreakModel(
      streakDatesForThisWeek: (json['streakDatesForThisWeek'] as List<dynamic>?)
          ?.map(
              (e) => StreakDatesForThisWeek.fromJson(e as Map<String, dynamic>))
          .toList(),
      streak: json['streak'] as int?,
    );

Map<String, dynamic> _$StreakModelToJson(StreakModel instance) =>
    <String, dynamic>{
      'streakDatesForThisWeek': instance.streakDatesForThisWeek,
      'streak': instance.streak,
    };

StreakDatesForThisWeek _$StreakDatesForThisWeekFromJson(
        Map<String, dynamic> json) =>
    StreakDatesForThisWeek(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      day: json['day'] as String?,
    );

Map<String, dynamic> _$StreakDatesForThisWeekToJson(
        StreakDatesForThisWeek instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'day': instance.day,
    };
