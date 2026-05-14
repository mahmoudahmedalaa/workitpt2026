import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_card_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddCardModel extends IRequestModel {
  @JsonKey(name: "card")
  CardDetails? card;

  AddCardModel({
    this.card,
  });

  factory AddCardModel.fromJson(Map<String, dynamic> json) =>
      _$AddCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCardModelToJson(this);
}

@JsonSerializable()
class CardDetails {
  @JsonKey(name: "number")
  String? number;
  @JsonKey(name: "exp_month")
  int? expMonth;
  @JsonKey(name: "exp_year")
  int? expYear;
  @JsonKey(name: "cvc")
  String? cvc;
  @JsonKey(name: "card_holder_name")
  String? cardHolderName;

  CardDetails({
    this.number,
    this.expMonth,
    this.expYear,
    this.cvc,
    this.cardHolderName,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) =>
      _$CardDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailsToJson(this);
}
