import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'streak_model.g.dart';
@JsonSerializable()
class StreakModel extends IRequestModel{
  @JsonKey(name: "streakDatesForThisWeek")
  final List<StreakDatesForThisWeek>? streakDatesForThisWeek;
  @JsonKey(name: "streak")
  final int? streak;

  StreakModel({
    this.streakDatesForThisWeek,
    this.streak,
  });

  factory StreakModel.fromJson(Map<String, dynamic> json) => _$StreakModelFromJson(json);

  Map<String, dynamic> toJson() => _$StreakModelToJson(this);
}

@JsonSerializable()
class StreakDatesForThisWeek {
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "day")
  final String? day;

  StreakDatesForThisWeek({
    this.date,
    this.day,
  });

  factory StreakDatesForThisWeek.fromJson(Map<String, dynamic> json) => _$StreakDatesForThisWeekFromJson(json);

  Map<String, dynamic> toJson() => _$StreakDatesForThisWeekToJson(this);
}
