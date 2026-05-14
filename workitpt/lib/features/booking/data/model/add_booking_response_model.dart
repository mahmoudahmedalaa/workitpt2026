

import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';
part 'add_booking_response_model.g.dart';
@JsonSerializable()
class AddBookingResponseModel extends IRequestModel{
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "session")
  final SessionResponseModel? session;
  @JsonKey(name: "user")
  final TrainerInfoModel? user;
  @JsonKey(name: "date_from")
  final DateTime? dateFrom;
  @JsonKey(name: "date_to")
  final DateTime? dateTo;
  @JsonKey(name: "time_from")
  final String? timeFrom;
  @JsonKey(name: "time_to")
  final String? timeTo;
  @JsonKey(name: "isPaid")
  final String? isPaid;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  AddBookingResponseModel({
    this.id,
    this.session,
    this.user,
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
  });

  factory AddBookingResponseModel.fromJson(Map<String, dynamic> json) => _$AddBookingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddBookingResponseModelToJson(this);
}
