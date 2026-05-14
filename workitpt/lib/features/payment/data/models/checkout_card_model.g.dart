// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutCardModel _$CheckoutCardModelFromJson(Map<String, dynamic> json) =>
    CheckoutCardModel(
      cardId: json['cardId'] as String?,
      booking:
          (json['booking'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CheckoutCardModelToJson(CheckoutCardModel instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'booking': instance.booking,
    };
