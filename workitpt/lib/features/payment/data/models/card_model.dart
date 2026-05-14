import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CardModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "object")
  String? object;
  @JsonKey(name: "billing_details")
  BillingDetails? billingDetails;
  @JsonKey(name: "card")
  Card? card;
  @JsonKey(name: "created")
  int? created;
  @JsonKey(name: "customer")
  String? customer;
  @JsonKey(name: "livemode")
  bool? livemode;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "type")
  String? type;

  CardModel({
    this.id,
    this.object,
    this.billingDetails,
    this.card,
    this.created,
    this.customer,
    this.livemode,
    this.metadata,
    this.type,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

@JsonSerializable()
class BillingDetails {
  @JsonKey(name: "address")
  Address? address;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone")
  dynamic phone;

  BillingDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
  });

  factory BillingDetails.fromJson(Map<String, dynamic> json) =>
      _$BillingDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BillingDetailsToJson(this);
}

@JsonSerializable()
class Address {
  @JsonKey(name: "city")
  dynamic city;
  @JsonKey(name: "country")
  dynamic country;
  @JsonKey(name: "line1")
  dynamic line1;
  @JsonKey(name: "line2")
  dynamic line2;
  @JsonKey(name: "postal_code")
  dynamic postalCode;
  @JsonKey(name: "state")
  dynamic state;

  Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Card {
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "checks")
  Checks? checks;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "exp_month")
  int? expMonth;
  @JsonKey(name: "exp_year")
  int? expYear;
  @JsonKey(name: "fingerprint")
  String? fingerprint;
  @JsonKey(name: "funding")
  String? funding;
  @JsonKey(name: "generated_from")
  dynamic generatedFrom;
  @JsonKey(name: "last4")
  String? last4;
  @JsonKey(name: "networks")
  Networks? networks;
  @JsonKey(name: "three_d_secure_usage")
  ThreeDSecureUsage? threeDSecureUsage;
  @JsonKey(name: "wallet")
  dynamic wallet;

  Card({
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.generatedFrom,
    this.last4,
    this.networks,
    this.threeDSecureUsage,
    this.wallet,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}

@JsonSerializable()
class Checks {
  @JsonKey(name: "address_line1_check")
  dynamic addressLine1Check;
  @JsonKey(name: "address_postal_code_check")
  dynamic addressPostalCodeCheck;
  @JsonKey(name: "cvc_check")
  String? cvcCheck;

  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  factory Checks.fromJson(Map<String, dynamic> json) => _$ChecksFromJson(json);

  Map<String, dynamic> toJson() => _$ChecksToJson(this);
}

@JsonSerializable()
class Networks {
  @JsonKey(name: "available")
  List<String>? available;
  @JsonKey(name: "preferred")
  dynamic preferred;

  Networks({
    this.available,
    this.preferred,
  });

  factory Networks.fromJson(Map<String, dynamic> json) =>
      _$NetworksFromJson(json);

  Map<String, dynamic> toJson() => _$NetworksToJson(this);
}

@JsonSerializable()
class ThreeDSecureUsage {
  @JsonKey(name: "supported")
  bool? supported;

  ThreeDSecureUsage({
    this.supported,
  });

  factory ThreeDSecureUsage.fromJson(Map<String, dynamic> json) =>
      _$ThreeDSecureUsageFromJson(json);

  Map<String, dynamic> toJson() => _$ThreeDSecureUsageToJson(this);
}

@JsonSerializable()
class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
