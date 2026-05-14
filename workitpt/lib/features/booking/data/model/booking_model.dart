import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends IRequestModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "sessionStatus")
  final String? sessionStatus;
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
  @JsonKey(name: "visited")
  final bool? visited;
  @JsonKey(name: "isPaid")
  final String? isPaid;
  @JsonKey(name: "payment_id")
  final String? paymentId;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: 'pricingDetails')
  final Pricing? pricing;
  @JsonKey(name: 'bookingDates')
  final List<String>? bookingDates;

  BookingModel({
    this.id,
    this.sessionStatus,
    this.session,
    this.user,
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
    this.visited,
    this.isPaid,
    this.paymentId,
    this.date,
    this.pricing,
    this.bookingDates,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
