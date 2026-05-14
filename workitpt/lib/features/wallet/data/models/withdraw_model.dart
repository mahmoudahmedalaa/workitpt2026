import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'withdraw_model.g.dart';
@JsonSerializable()
class BankDetails extends IRequestModel{
  @JsonKey(name: "amount")
  final String? amount;
  @JsonKey(name: "acNo")
  final String? acNo;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "bankName")
  final String? bankName;

  BankDetails({
    this.acNo,
    this.amount,
    this.name,
    this.bankName,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => _$BankDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);
}