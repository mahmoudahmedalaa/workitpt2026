// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentLinkModel _$GetPaymentLinkModelFromJson(Map<String, dynamic> json) =>
    GetPaymentLinkModel(
      booking: json['booking'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$GetPaymentLinkModelToJson(
        GetPaymentLinkModel instance) =>
    <String, dynamic>{
      'booking': instance.booking,
      'quantity': instance.quantity,
    };
