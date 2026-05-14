import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_card_model.g.dart';

@JsonSerializable()
class CheckoutCardModel extends IRequestModel {
  @JsonKey(name: "cardId")
  String? cardId;
  @JsonKey(name: "booking")
  List<String>? booking;

  CheckoutCardModel({
    this.cardId,
    this.booking,
  });

  factory CheckoutCardModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutCardModelToJson(this);
}
