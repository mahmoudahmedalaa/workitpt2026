import 'package:json_annotation/json_annotation.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';

import 'customer_model.dart';

part 'customer_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerDetailModel {
  @JsonKey(name: "info")
  CustomerModel? info;
  @JsonKey(name: "booking")
  List<BookingModel>? booking;

  CustomerDetailModel({
    this.info,
    this.booking,
  });

  factory CustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailModelToJson(this);
}
