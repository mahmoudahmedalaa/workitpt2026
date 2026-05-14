import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_us_model.g.dart';

@JsonSerializable()
class ContactUsModel extends IRequestModel {
  final String name;
  final String email;
  final String message;

  ContactUsModel(
      {required this.name, required this.email, required this.message});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);
}
