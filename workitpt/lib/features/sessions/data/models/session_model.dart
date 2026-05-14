import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../profile/data/models/profile_model.dart';

part 'session_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SessionModel extends IRequestModel {
  @JsonKey(name: 'flexible_location')
  final bool? flexibleLocation;
  @JsonKey(name: 'session_title')
  String? sessionTitle;
  @JsonKey(name: 'session')
  String? session;
  @JsonKey(name: 'session_type')
  String? sessionType;
  @JsonKey(name: 'difficulty_level')
  String? difficultyLevel;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'what_to_expect')
  String? expect;
  @JsonKey(name: 'what_to_bring')
  String? bring;
  @JsonKey(name: 'benefits')
  String? benefits;
  @JsonKey(name: 'select_type')
  String? selectType;
  @JsonKey(name: 'occurrence')
  String? occurrence;
  @JsonKey(name: 'dayOfWeek')
  List<DayOfWeek>? dayOfWeek;
  @JsonKey(name: 'time_from')
  String? timeFrom;
  @JsonKey(name: 'time_to')
  String? timeTo;
  @JsonKey(name: 'coordicates')
  Coordinates? coordicates;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'online_url')
  String? onlineUrl;
  @JsonKey(name: 'no_of_attendees')
  int? numOfAttendees;
  @JsonKey(name: "location_range")
  final int? locationRange;
  @JsonKey(name: "location_on_map")
  final String? location_on_map;

  SessionModel({
    this.sessionTitle,
    this.session,
    this.sessionType,
    this.difficultyLevel,
    this.price,
    this.location,
    this.flexibleLocation,
    this.description,
    this.bring,
    this.benefits,
    this.expect,
    this.selectType,
    this.occurrence,
    this.dayOfWeek,
    this.timeFrom,
    this.timeTo,
    this.coordicates,
    this.images,
    this.onlineUrl,
    this.numOfAttendees,
    this.locationRange,
    this.location_on_map,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

@JsonSerializable()
class DayOfWeek {
  @JsonKey(name: 'day')
  String? day;
  @JsonKey(name: 'date_from')
  String? dateFrom;
  @JsonKey(name: 'date_to')
  String? dateTo;

  DayOfWeek({
    this.day,
    this.dateFrom,
    this.dateTo,
  });

  factory DayOfWeek.fromJson(Map<String, dynamic> json) =>
      _$DayOfWeekFromJson(json);

  Map<String, dynamic> toJson() => _$DayOfWeekToJson(this);
}
