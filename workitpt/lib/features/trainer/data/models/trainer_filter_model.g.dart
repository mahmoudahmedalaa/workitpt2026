// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerFilterModel _$TrainerFilterModelFromJson(Map<String, dynamic> json) =>
    TrainerFilterModel(
      workoutLocation: (json['workoutLocation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      specialization: (json['specialization'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      search: json['search'] as String?,
      rating: json['rating'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      priceMax: (json['priceMax'] as num?)?.toDouble(),
      priceMin: (json['priceMin'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TrainerFilterModelToJson(TrainerFilterModel instance) =>
    <String, dynamic>{
      'workoutLocation': instance.workoutLocation,
      'specialization': instance.specialization,
      'search': instance.search,
      'priceMax': instance.priceMax,
      'priceMin': instance.priceMin,
      'rating': instance.rating,
      'page': instance.page,
      'limit': instance.limit,
    };
