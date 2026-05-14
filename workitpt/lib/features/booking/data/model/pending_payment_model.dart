import 'package:json_annotation/json_annotation.dart';
import 'package:workitpt/features/sessions/data/models/session_response_model.dart';

part 'pending_payment_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PendingPaymentModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "session")
  final Session? session;
  @JsonKey(name: "date_from")
  final DateTime? dateFrom;
  @JsonKey(name: "time_from")
  final String? timeFrom;
  @JsonKey(name: "time_to")
  final String? timeTo;
  @JsonKey(name: "date")
  final String? date;

  PendingPaymentModel({
    this.id,
    this.session,
    this.dateFrom,
    this.timeFrom,
    this.timeTo,
    this.date,
  });

  factory PendingPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PendingPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PendingPaymentModelToJson(this);
}

@JsonSerializable()
class Session {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "session_title")
  final String? sessionTitle;
  @JsonKey(name: "session")
  final String? session;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "session_type")
  final String? sessionType;
  @JsonKey(name: "select_type")
  final String? selectType;
  @JsonKey(name: "location_on_map")
  final String? locationOnMap;
  @JsonKey(name: "trainer")
  final TrainerInfoModel? trainer;

  Session({
    this.id,
    this.sessionTitle,
    this.session,
    this.price,
    this.sessionType,
    this.selectType,
    this.locationOnMap,
    this.trainer,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
