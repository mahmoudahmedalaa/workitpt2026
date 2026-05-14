import 'package:json_annotation/json_annotation.dart';
import 'package:workitpt/features/booking/data/model/booking_model.dart';
import 'package:workitpt/features/trainer/data/models/trainer_model.dart';

part 'trainer_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TrainerDetailModel {
  @JsonKey(name: "info")
  TrainerModel? info;
  @JsonKey(name: "upcoming")
  List<BookingModel>? upcoming;
  @JsonKey(name: "booked")
  List<BookingModel>? booked;

  TrainerDetailModel({
    this.info,
    this.upcoming,
    this.booked,
  });

  factory TrainerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerDetailModelToJson(this);
}
