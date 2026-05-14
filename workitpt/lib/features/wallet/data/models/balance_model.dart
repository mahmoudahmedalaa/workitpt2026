import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable()
class BalanceModel extends IRequestModel {
  @JsonKey(name: "currentAmount")
  final double? currentAmount;
  @JsonKey(name: "pendingAmount")
  final double? pendingAmount;
  @JsonKey(name: "receivedAmount")
  final double? receivedAmount;

  BalanceModel({
    this.currentAmount,
    this.pendingAmount,
    this.receivedAmount,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);
}
