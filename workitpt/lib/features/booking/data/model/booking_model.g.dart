// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['_id'] as String?,
      sessionStatus: json['sessionStatus'] as String?,
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
      visited: json['visited'] as bool?,
      isPaid: json['isPaid'] as String?,
      paymentId: json['payment_id'] as String?,
      date: json['date'] as String?,
      pricing: json['pricingDetails'] == null
          ? null
          : Pricing.fromJson(json['pricingDetails'] as Map<String, dynamic>),
      bookingDates: (json['bookingDates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sessionStatus': instance.sessionStatus,
      'session': instance.session,
      'user': instance.user,
      'date_from': instance.dateFrom?.toIso8601String(),
      'date_to': instance.dateTo?.toIso8601String(),
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
      'visited': instance.visited,
      'isPaid': instance.isPaid,
      'payment_id': instance.paymentId,
      'date': instance.date,
      'pricingDetails': instance.pricing,
      'bookingDates': instance.bookingDates,
    };
