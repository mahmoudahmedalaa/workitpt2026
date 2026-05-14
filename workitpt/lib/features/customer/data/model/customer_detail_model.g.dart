// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailModel _$CustomerDetailModelFromJson(Map<String, dynamic> json) =>
    CustomerDetailModel(
      info: json['info'] == null
          ? null
          : CustomerModel.fromJson(json['info'] as Map<String, dynamic>),
      booking: (json['booking'] as List<dynamic>?)
          ?.map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerDetailModelToJson(
        CustomerDetailModel instance) =>
    <String, dynamic>{
      'info': instance.info?.toJson(),
      'booking': instance.booking?.map((e) => e.toJson()).toList(),
    };
