// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletHistoryModel _$WalletHistoryModelFromJson(Map<String, dynamic> json) =>
    WalletHistoryModel(
      id: json['_id'] as String?,
      trainer: json['trainer'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      transactionCharge: (json['transaction_charge'] as num?)?.toDouble(),
      booking: json['booking'] == null
          ? null
          : BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$WalletHistoryModelToJson(WalletHistoryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'trainer': instance.trainer,
      'amount': instance.amount,
      'transaction_charge': instance.transactionCharge,
      'booking': instance.booking,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
