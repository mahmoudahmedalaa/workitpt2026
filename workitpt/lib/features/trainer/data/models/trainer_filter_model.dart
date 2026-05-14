import 'package:json_annotation/json_annotation.dart';

part 'trainer_filter_model.g.dart';

@JsonSerializable()
class TrainerFilterModel {
  List<String>? workoutLocation;
  List<String>? specialization;
  String? search;
  double? priceMax;
  double? priceMin;
  int? rating;
  int? page;
  int? limit;

  TrainerFilterModel({
    this.workoutLocation,
    this.specialization,
    this.search,
    this.rating,
    this.page,
    this.limit,
    this.priceMax,
    this.priceMin,
  });
  factory TrainerFilterModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerFilterModelToJson(this);
  // bool? get hasFilter =>
  //     selectType!.isNotEmpty ||
  //     sessionType!.isNotEmpty ||
  //     difficult!.isNotEmpty ||
  //     session!.isNotEmpty ||
  //     (minPrice.isNull) ||
  //     maxPrice.isDefinedAndNotNull ||
  //     booked!.isDefinedAndNotNull;
}
