import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_payment_link_model.g.dart';

@JsonSerializable()
class GetPaymentLinkModel extends IRequestModel {
  final String booking;
  final int quantity;

  GetPaymentLinkModel({
    required this.booking,
    required this.quantity,
  });

  factory GetPaymentLinkModel.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentLinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentLinkModelToJson(this);
}
