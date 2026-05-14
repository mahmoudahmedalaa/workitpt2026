import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'analytics_model.g.dart';
@JsonSerializable()
@JsonSerializable()
class AnalyticsModel extends IRequestModel{
  @JsonKey(name: "totalSession")
  final int? totalSession;
  @JsonKey(name: "totalIncome")
  final int? totalIncome;
  @JsonKey(name: "totalAmountSpent")
  final int? totalAmountSpent;
  @JsonKey(name: "totalTrainers")
  final int? totalTrainers;
  @JsonKey(name: "totalCustomer")
  final int? totalCustomer;

  AnalyticsModel({
    this.totalSession,
    this.totalIncome,
    this.totalCustomer,
    this.totalAmountSpent,
    this.totalTrainers
  });

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) => _$AnalyticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticsModelToJson(this);
}

