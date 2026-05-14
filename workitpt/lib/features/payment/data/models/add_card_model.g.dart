// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCardModel _$AddCardModelFromJson(Map<String, dynamic> json) => AddCardModel(
      card: json['card'] == null
          ? null
          : CardDetails.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCardModelToJson(AddCardModel instance) =>
    <String, dynamic>{
      'card': instance.card?.toJson(),
    };

CardDetails _$CardDetailsFromJson(Map<String, dynamic> json) => CardDetails(
      number: json['number'] as String?,
      expMonth: json['exp_month'] as int?,
      expYear: json['exp_year'] as int?,
      cvc: json['cvc'] as String?,
      cardHolderName: json['card_holder_name'] as String?,
    );

Map<String, dynamic> _$CardDetailsToJson(CardDetails instance) =>
    <String, dynamic>{
      'number': instance.number,
      'exp_month': instance.expMonth,
      'exp_year': instance.expYear,
      'cvc': instance.cvc,
      'card_holder_name': instance.cardHolderName,
    };
