// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerDetailModel _$TrainerDetailModelFromJson(Map<String, dynamic> json) =>
    TrainerDetailModel(
      info: json['info'] == null
          ? null
          : TrainerModel.fromJson(json['info'] as Map<String, dynamic>),
      upcoming: (json['upcoming'] as List<dynamic>?)
          ?.map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      booked: (json['booked'] as List<dynamic>?)
          ?.map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainerDetailModelToJson(TrainerDetailModel instance) =>
    <String, dynamic>{
      'info': instance.info?.toJson(),
      'upcoming': instance.upcoming?.map((e) => e.toJson()).toList(),
      'booked': instance.booked?.map((e) => e.toJson()).toList(),
    };
