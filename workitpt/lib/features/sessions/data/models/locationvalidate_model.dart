import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';
part 'locationvalidate_model.g.dart';

@JsonSerializable(explicitToJson: false)
class LocationValidateModel extends IRequestModel {
  final String? sessionId;
  final Location? location;

  LocationValidateModel({
    this.sessionId,
    this.location,
  });
  factory LocationValidateModel.fromJson(Map<String, dynamic> json) =>
      _$LocationValidateModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationValidateModelToJson(this);
}

@JsonSerializable()
class Location {
  final double? lat;
  final double? lng;

  Location({
    this.lat,
    this.lng,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
