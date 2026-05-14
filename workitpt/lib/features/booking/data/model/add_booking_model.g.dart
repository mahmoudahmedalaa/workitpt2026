// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookingModel _$AddBookingModelFromJson(Map<String, dynamic> json) =>
    AddBookingModel(
      dates: (json['dates'] as List<dynamic>?)
          ?.map((e) => Date.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddBookingModelToJson(AddBookingModel instance) =>
    <String, dynamic>{
      'dates': instance.dates,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      session: json['session'] as String?,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'session': instance.session,
    };
