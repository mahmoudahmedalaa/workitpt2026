// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: json['_id'] as String?,
      customerName: json['customerName'] as String?,
      isPaid: json['isPaid'] as String?,
      intro: json['intro'] as String?,
      amountReceived: json['amountReceived'] as int?,
      totalSessions: json['totalSessions'] as int?,
      avatar: json['avatar'] as String?,
      occupation: json['occupation'] as String?,
      fitnessGoal: json['fitnessGoal'] as String?,
      fitnessInterest: (json['fitnessInterest'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      medicalCondition: json['medicalCondition'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'customerName': instance.customerName,
      'isPaid': instance.isPaid,
      'avatar': instance.avatar,
      'intro': instance.intro,
      'occupation': instance.occupation,
      'amountReceived': instance.amountReceived,
      'totalSessions': instance.totalSessions,
      'fitnessGoal': instance.fitnessGoal,
      'fitnessInterest': instance.fitnessInterest,
      'height': instance.height,
      'weight': instance.weight,
      'medicalCondition': instance.medicalCondition,
      'location': instance.location,
    };
