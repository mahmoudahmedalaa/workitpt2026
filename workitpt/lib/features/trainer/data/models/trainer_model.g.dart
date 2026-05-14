// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerListModel _$TrainerListModelFromJson(Map<String, dynamic> json) =>
    TrainerListModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => TrainerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendedTrainer: (json['recommendedTrainers'] as List<dynamic>?)
          ?.map((e) => TrainerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainerListModelToJson(TrainerListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'recommendedTrainers': instance.recommendedTrainer,
    };

TrainerModel _$TrainerModelFromJson(Map<String, dynamic> json) => TrainerModel(
      id: json['id'] as String?,
      trainerName: json['trainerName'] as String?,
      avatar: json['avatar'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      intro: json['intro'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      specialization: (json['specialization'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalSessions: json['totalSessions'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      certification: (json['certification'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      medicalCondition: json['medicalCondition'] as String?,
    )..experience = json['experience'] as String?;

Map<String, dynamic> _$TrainerModelToJson(TrainerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainerName': instance.trainerName,
      'avatar': instance.avatar,
      'price': instance.price,
      'intro': instance.intro,
      'images': instance.images,
      'specialization': instance.specialization,
      'totalSessions': instance.totalSessions,
      'averageRating': instance.averageRating,
      'certification': instance.certification,
      'medicalCondition': instance.medicalCondition,
      'experience': instance.experience,
    };
