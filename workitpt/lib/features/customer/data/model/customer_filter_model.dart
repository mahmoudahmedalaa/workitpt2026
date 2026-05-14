import 'package:json_annotation/json_annotation.dart';

part 'customer_filter_model.g.dart';

@JsonSerializable()
class CustomerFilterModel {
  int? price;
  int? sort;
  String? search;
  int? page;
  int? limit;

  CustomerFilterModel({
    this.page,
    this.limit,
    this.search,
    this.price,
    this.sort,
  });
  factory CustomerFilterModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerFilterModelToJson(this);
}
