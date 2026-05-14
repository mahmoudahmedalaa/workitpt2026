import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'activity_model.g.dart';
@JsonSerializable()
class ActivityModel extends IRequestModel{
  @JsonKey(name: "day")
  final String? day;
  @JsonKey(name: "total")
  final int? total;

  ActivityModel({
    this.day,
    this.total,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}
