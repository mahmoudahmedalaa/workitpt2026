// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      details: json['details'] == null
          ? null
          : BankDetails.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      transactionId: json['transactionId'] as String?,
      trainer: json['trainer'] == null
          ? null
          : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toDouble(),
      approved: json['approved'] as String?,
      remarks: json['remarks'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      '_id': instance.id,
      'trainer': instance.trainer,
      'amount': instance.amount,
      'approved': instance.approved,
      'remarks': instance.remarks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'transactionId': instance.transactionId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': instance.role,
    };
