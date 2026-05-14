import 'package:json_annotation/json_annotation.dart';

part 'trainer_model.g.dart';

@JsonSerializable()
class TrainerListModel {
  @JsonKey(name: "list")
  List<TrainerModel>? list;
  @JsonKey(name: "recommendedTrainers")
  List<TrainerModel>? recommendedTrainer;

  TrainerListModel({
    this.list,
    this.recommendedTrainer,
  });

  factory TrainerListModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TrainerModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "trainerName")
  String? trainerName;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "intro")
  String? intro;
  // @JsonKey(name: "location")
  // Location? location;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "specialization")
  List<String>? specialization;
  @JsonKey(name: "totalSessions")
  int? totalSessions;
  @JsonKey(name: "averageRating")
  double? averageRating;
  @JsonKey(name: "certification")
  List<String>? certification;
  @JsonKey(name: "medicalCondition")
  String? medicalCondition;
  @JsonKey(name: "experience")
  String? experience;

  TrainerModel({
    this.id,
    this.trainerName,
    this.avatar,
    this.price,
    this.intro,
    // this.location,
    this.images,
    this.specialization,
    this.totalSessions,
    this.averageRating,
    this.certification,
    this.medicalCondition,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) =>
      _$TrainerModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerModelToJson(this);
}
