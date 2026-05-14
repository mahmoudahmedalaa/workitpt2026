import 'package:json_annotation/json_annotation.dart';

part 'session_filter_model.g.dart';

@JsonSerializable()
class SessionFilterModel {
  String? selectType;
  String? search;
  List<String>? workoutLocation;
  String? sessionType;
  List<String>? session;
  String? difficult;
  double? minPrice;
  double? maxPrice;
  String? booked;
  int? page;
  int? limit;

  SessionFilterModel({
    this.selectType,
    this.search,
    this.sessionType,
    this.workoutLocation,
    this.session,
    this.difficult,
    this.minPrice,
    this.maxPrice,
    this.booked,
    this.page,
    this.limit,
  });
  factory SessionFilterModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionFilterModelToJson(this);
  // bool? get hasFilter =>
  //     selectType!.isNotEmpty ||
  //     sessionType!.isNotEmpty ||
  //     difficult!.isNotEmpty ||
  //     session!.isNotEmpty ||
  //     (minPrice.isNull) ||
  //     maxPrice.isDefinedAndNotNull ||
  //     booked!.isDefinedAndNotNull;
}
