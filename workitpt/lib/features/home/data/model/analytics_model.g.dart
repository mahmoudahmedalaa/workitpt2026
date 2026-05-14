// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsModel _$AnalyticsModelFromJson(Map<String, dynamic> json) =>
    AnalyticsModel(
      totalSession: json['totalSession'] as int?,
      totalIncome: json['totalIncome'] as int?,
      totalCustomer: json['totalCustomer'] as int?,
      totalAmountSpent: json['totalAmountSpent'] as int?,
      totalTrainers: json['totalTrainers'] as int?,
    );

Map<String, dynamic> _$AnalyticsModelToJson(AnalyticsModel instance) =>
    <String, dynamic>{
      'totalSession': instance.totalSession,
      'totalIncome': instance.totalIncome,
      'totalAmountSpent': instance.totalAmountSpent,
      'totalTrainers': instance.totalTrainers,
      'totalCustomer': instance.totalCustomer,
    };
