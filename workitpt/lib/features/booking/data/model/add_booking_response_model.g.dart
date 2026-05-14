// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookingResponseModel _$AddBookingResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddBookingResponseModel(
      id: json['_id'] as String?,
      session: json['session'] == null
          ? null
          : SessionResponseModel.fromJson(
              json['session'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : TrainerInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      dateFrom: json['date_from'] == null
          ? null
          : DateTime.parse(json['date_from'] as String),
      dateTo: json['date_to'] == null
          ? null
          : DateTime.parse(json['date_to'] as String),
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      isPaid: json['isPaid'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AddBookingResponseModelToJson(
        AddBookingResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'session': instance.session,
      'user': instance.user,
      'date_from': instance.dateFrom?.toIso8601String(),
      'date_to': instance.dateTo?.toIso8601String(),
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
      'isPaid': instance.isPaid,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
