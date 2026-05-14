import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_booking_model.g.dart';

@JsonSerializable()
class AddBookingModel extends IRequestModel {
  final List<Date>? dates;

  AddBookingModel({
    this.dates,
  });

  factory AddBookingModel.fromJson(Map<String, dynamic> json) =>
      _$AddBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddBookingModelToJson(this);
}

@JsonSerializable()
class Date {
  final DateTime? date;
  final String? session;

  Date({this.date, this.session});

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}
