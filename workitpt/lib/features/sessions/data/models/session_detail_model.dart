import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_detail_model.g.dart';


@JsonSerializable()
class SessionDetailsModel extends IRequestModel{
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "session_title")
  final String? sessionTitle;
  @JsonKey(name: "session")
  final String? session;
  @JsonKey(name: "difficulty_level")
  final String? difficultyLevel;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "session_type")
  final String? sessionType;
  @JsonKey(name: "select_type")
  final String? selectType;
  @JsonKey(name: "occurrence")
  final String? occurrence;
  @JsonKey(name: "date_from")
  final DateTime? dateFrom;
  @JsonKey(name: "date_to")
  final DateTime? dateTo;
  @JsonKey(name: "time_from")
  final String? timeFrom;
  @JsonKey(name: "time_to")
  final String? timeTo;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "location_on_map")
  final String? locationOnMap;
  @JsonKey(name: "coordicates")
  final Coordicates? coordicates;
  @JsonKey(name: "day_of_week")
  final String? dayOfWeek;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "what_to_expect")
  final String? whatToExpect;
  @JsonKey(name: "what_to_bring")
  final String? whatToBring;
  @JsonKey(name: "benefits")
  final String? benefits;
  @JsonKey(name: "booked")
  final bool? booked;
  @JsonKey(name: "trainer")
  final String? trainer;
  @JsonKey(name: "referenceId")
  final String? referenceId;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "location_range")
  final int? locationRange;
  @JsonKey(name: "flexible_location")
  final bool? flexibleLocation;
  @JsonKey(name: "ratings")
  final List<dynamic>? ratings;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  SessionDetailsModel({
    this.id,
    this.sessionTitle,
    this.session,
    this.difficultyLevel,
    this.price,
    this.sessionType,
    this.selectType,
    this.occurrence,
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
    this.location,
    this.locationOnMap,
    this.coordicates,
    this.dayOfWeek,
    this.description,
    this.whatToExpect,
    this.whatToBring,
    this.benefits,
    this.booked,
    this.trainer,
    this.referenceId,
    this.images,
    this.locationRange,
    this.flexibleLocation,
    this.ratings,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SessionDetailsModel.fromJson(Map<String, dynamic> json) => _$SessionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDetailsModelToJson(this);
}

@JsonSerializable()
class Coordicates {
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lng")
  final double? lng;
  @JsonKey(name: "_id")
  final String? id;

  Coordicates({
    this.lat,
    this.lng,
    this.id,
  });

  factory Coordicates.fromJson(Map<String, dynamic> json) => _$CoordicatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordicatesToJson(this);
}

