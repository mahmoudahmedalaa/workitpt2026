import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workitpt/features/sessions/data/models/session_detail_model.dart';

part 'session_response_model.g.dart';

@JsonSerializable()
class SessionResponseModel extends IRequestModel {
  @JsonKey(name: 'flexible_location')
  final bool? flexibleLocation;
  @JsonKey(name: 'location_range')
  final int? locationRange;
  final String? id;
  @JsonKey(name: 'session_title')
  final String? sessionTitle;
  @JsonKey(name: '_id')
  final String? ratingID;
  @JsonKey(name: 'session')
  final String? session;
  @JsonKey(name: 'day')
  final String? day;
  @JsonKey(name: 'isPaid')
  final String? isPaid;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'difficulty_level')
  final String? difficultyLevel;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'session_type')
  final String? sessionType;
  @JsonKey(name: 'select_type')
  final String? selectType;
  @JsonKey(name: 'occurrence')
  final String? occurrence;
  @JsonKey(name: 'date_from')
  final DateTime? dateFrom;
  @JsonKey(name: 'date_to')
  final DateTime? dateTo;
  @JsonKey(name: 'time_from')
  final String? timeFrom;
  @JsonKey(name: 'time_to')
  final String? timeTo;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'day_of_week')
  final String? dayOfWeek;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'booked')
  final bool? booked;
  @JsonKey(name: 'trainer')
  final TrainerInfoModel? trainer;
  @JsonKey(name: 'referenceId')
  final String? referenceId;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  @JsonKey(name: 'benefits')
  String? benefits;
  @JsonKey(name: 'what_to_bring')
  String? whatToBring;
  @JsonKey(name: 'what_to_expect')
  String? whatToExpect;
  @JsonKey(name: 'online_url')
  String? onlineUrl;
  @JsonKey(name: 'location_on_map')
  String? mapLocation;
  bool? reviewStatus;
  @JsonKey(name: 'no_of_attendees')
  int? numOfAttendees;
  @JsonKey(name: 'coordicates')
  Coordicates? coordicates;
  final List<PrefrenceDataTime>? prefrenceDataTime;
  @JsonKey(name: 'pendingBookingId')
  String? pendingBookingId;
  @JsonKey(name: 'pricing')
  final Pricing? pricing;

  SessionResponseModel({
    this.pricing,
    this.flexibleLocation,
    this.id,
    this.sessionTitle,
    this.reviewStatus,
    this.prefrenceDataTime,
    this.description,
    this.ratingID,
    this.coordicates,
    this.benefits,
    this.locationRange,
    this.isPaid,
    this.whatToBring,
    this.whatToExpect,
    this.date,
    this.day,
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
    this.dayOfWeek,
    this.mapLocation,
    this.trainer,
    this.referenceId,
    this.booked,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.onlineUrl,
    this.numOfAttendees,
    this.pendingBookingId,
  });

  factory SessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseModelToJson(this);
}

@JsonSerializable()
class PrefrenceDataTime {
  @JsonKey(name: 'time_from')
  final String? timeFrom;
  @JsonKey(name: 'time_to')
  final String? timeTo;
  @JsonKey(name: 'session_id')
  final String? sessionID;
  final DateTime? date;
  final String? day;
  final bool? isBooking;

  PrefrenceDataTime({
    this.timeFrom,
    this.timeTo,
    this.date,
    this.sessionID,
    this.day,
    this.isBooking,
  });

  factory PrefrenceDataTime.fromJson(Map<String, dynamic> json) =>
      _$PrefrenceDataTimeFromJson(json);

  Map<String, dynamic> toJson() => _$PrefrenceDataTimeToJson(this);
}

@JsonSerializable()
class TrainerInfoModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'avatar')
  String? avatar;

  TrainerInfoModel({this.firstName, this.avatar, this.lastName});

  factory TrainerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerInfoModelToJson(this);
}

@JsonSerializable()
class Pricing {
  @JsonKey(name: "total")
  double? total;
  @JsonKey(name: "details")
  Details? details;

  Pricing({
    this.total,
    this.details,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);

  Map<String, dynamic> toJson() => _$PricingToJson(this);
}

@JsonSerializable()
class Details {
  @JsonKey(name: "serviceCharge")
  double? serviceCharge;
  @JsonKey(name: "currentCost")
  double? currentCost;
  @JsonKey(name: "transactionCharge")
  double? transactionCharge;

  Details({
    this.serviceCharge,
    this.currentCost,
    this.transactionCharge,
  });
  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
