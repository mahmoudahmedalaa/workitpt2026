import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workitpt/features/wallet/data/models/withdraw_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends IRequestModel {
  @JsonKey(name: "details")
  final BankDetails? details;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "trainer")
  final Trainer? trainer;
  @JsonKey(name: "amount")
  final double? amount;
  @JsonKey(name: "approved")
  final String? approved;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "transactionId")
  final String? transactionId;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  TransactionModel({
    this.details,
    this.id,
    this.transactionId,
    this.trainer,
    this.amount,
    this.approved,
    this.remarks,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

@JsonSerializable()
class Trainer {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;

  Trainer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerToJson(this);
}
