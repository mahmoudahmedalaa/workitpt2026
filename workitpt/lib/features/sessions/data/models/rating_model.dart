import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable(explicitToJson: false)
class RatingModel extends IRequestModel {
  final double rating;

  RatingModel({required this.rating});


  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}