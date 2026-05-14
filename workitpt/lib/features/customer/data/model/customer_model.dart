import 'package:json_annotation/json_annotation.dart';

import '../../../profile/data/models/profile_model.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "customerName")
  String? customerName;
  @JsonKey(name: "isPaid")
  String? isPaid;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "intro")
  String? intro;
  @JsonKey(name: "occupation")
  String? occupation;
  @JsonKey(name: "amountReceived")
  int? amountReceived;
  @JsonKey(name: "totalSessions")
  int? totalSessions;
  @JsonKey(name: "fitnessGoal")
  final String? fitnessGoal;
  @JsonKey(name: "fitnessInterest")
  final List<String>? fitnessInterest;
  @JsonKey(name: "height")
  final String? height;
  @JsonKey(name: "weight")
  final String? weight;
  @JsonKey(name: "medicalCondition")
  final String? medicalCondition;
  @JsonKey(name: "location")
  final Location? location;

  CustomerModel({
    this.id,
    this.customerName,
    this.isPaid,
    this.intro,
    this.amountReceived,
    this.totalSessions,
    this.avatar,
    this.occupation,
    this.fitnessGoal,
    this.fitnessInterest,
    this.height,
    this.weight,
    this.medicalCondition,
    this.location,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
