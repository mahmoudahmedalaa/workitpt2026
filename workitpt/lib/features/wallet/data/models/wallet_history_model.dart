import 'package:json_annotation/json_annotation.dart';

import '../../../booking/data/model/booking_model.dart';

part 'wallet_history_model.g.dart';

@JsonSerializable()
class WalletHistoryModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "trainer")
  String? trainer;
  @JsonKey(name: "amount")
  double? amount;
  @JsonKey(name: "transaction_charge")
  double? transactionCharge;
  @JsonKey(name: "booking")
  BookingModel? booking;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  WalletHistoryModel({
    this.id,
    this.trainer,
    this.amount,
    this.transactionCharge,
    this.booking,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WalletHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletHistoryModelToJson(this);
}

// @JsonSerializable()
// class WalletBooking {
//   @JsonKey(name: "_id")
//   String? id;
//   @JsonKey(name: "session")
//   WalletSession? session;

//   WalletBooking({
//     this.id,
//     this.session,
//   });

//   factory WalletBooking.fromJson(Map<String, dynamic> json) =>
//       _$WalletBookingFromJson(json);

//   Map<String, dynamic> toJson() => _$WalletBookingToJson(this);
// }

// @JsonSerializable()
// class WalletSession {
//   @JsonKey(name: "_id")
//   String? id;
//   @JsonKey(name: "session_title")
//   String? sessionTitle;
//   @JsonKey(name: "price")
//   int? price;
//   @JsonKey(name: "select_type")
//   String? selectType;

//   WalletSession({
//     this.id,
//     this.sessionTitle,
//     this.price,
//     this.selectType,
//   });

//   factory WalletSession.fromJson(Map<String, dynamic> json) =>
//       _$WalletSessionFromJson(json);

//   Map<String, dynamic> toJson() => _$WalletSessionToJson(this);
// }
