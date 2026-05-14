// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      acNo: json['acNo'] as String?,
      amount: json['amount'] as String?,
      name: json['name'] as String?,
      bankName: json['bankName'] as String?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'acNo': instance.acNo,
      'name': instance.name,
      'bankName': instance.bankName,
    };
