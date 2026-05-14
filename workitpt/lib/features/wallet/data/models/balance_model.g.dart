// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) => BalanceModel(
      currentAmount: (json['currentAmount'] as num?)?.toDouble(),
      pendingAmount: (json['pendingAmount'] as num?)?.toDouble(),
      receivedAmount: (json['receivedAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'currentAmount': instance.currentAmount,
      'pendingAmount': instance.pendingAmount,
      'receivedAmount': instance.receivedAmount,
    };
