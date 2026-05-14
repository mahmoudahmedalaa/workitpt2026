import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ProfileModel extends IRequestModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "customerInfo")
  final CustomerInfo? customerInfo;
  @JsonKey(name: "trainerInfo")
  final TrainerInfo? trainerInfo;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "profileCompleted")
  final bool? profileCompleted;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "authProvider")
  final String? authProvider;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "stripe_customer_id")
  final String? stripeCustomerId;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.customerInfo,
    this.trainerInfo,
    this.email,
    this.profileCompleted,
    this.role,
    this.authProvider,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.stripeCustomerId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class TrainerInfo {
  @JsonKey(name: "location")
  final Location? location;
  @JsonKey(name: "attemptCount")
  final dynamic attemptCount;
  @JsonKey(name: "certification")
  final List<String>? certification;
  @JsonKey(name: "introduction")
  final String? introduction;
  @JsonKey(name: "medicalCondition")
  final String? medicalCondition;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "emergencyContact")
  final List<EmergencyContact>? emergencyContact;
  @JsonKey(name: "contactNumber")
  final String? contactNumber;
  @JsonKey(name: "dob")
  final DateTime? dob;
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "specialization")
  final List<String>? specialization;
  @JsonKey(name: "availability")
  final dynamic availability;
  @JsonKey(name: "experience")
  final String? experience;
  @JsonKey(name: "blockerDetails")
  final String? blockerDetails;
  @JsonKey(name: "verificationStatus")
  final String? verificationStatus;
  @JsonKey(name: "showAgain")
  final dynamic showAgain;
  @JsonKey(name: "_id")
  final dynamic id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  TrainerInfo({
    this.location,
    this.attemptCount,
    this.certification,
    this.introduction,
    this.medicalCondition,
    this.gender,
    this.images,
    this.emergencyContact,
    this.contactNumber,
    this.dob,
    this.country,
    this.countryCode,
    this.state,
    this.specialization,
    this.availability,
    this.experience,
    this.blockerDetails,
    this.verificationStatus,
    this.showAgain,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory TrainerInfo.fromJson(Map<String, dynamic> json) =>
      _$TrainerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerInfoToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CustomerInfo {
  @JsonKey(name: "location")
  final Location? location;
  @JsonKey(name: "coordinates")
  final Coordinates? coordinates;
  @JsonKey(name: "social")
  final Social? social;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "dob")
  final DateTime? dob;
  @JsonKey(name: "emergencyContact")
  final List<EmergencyContact>? emergencyContact;
  @JsonKey(name: "contactNumber")
  final String? contactNumber;
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "height")
  final String? height;
  @JsonKey(name: "weight")
  final String? weight;
  @JsonKey(name: "occupation")
  final String? occupation;
  @JsonKey(name: "workoutLocation")
  final String? workoutLocation;
  @JsonKey(name: "fitnessGoal")
  final String? fitnessGoal;
  @JsonKey(name: "fitnessInterest")
  final List<String>? fitnessInterest;
  @JsonKey(name: "introduction")
  final String? introduction;
  @JsonKey(name: "medicalCondition")
  final String? medicalCondition;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  CustomerInfo({
    this.location,
    this.fitnessInterest,
    this.coordinates,
    this.social,
    this.gender,
    this.dob,
    this.emergencyContact,
    this.contactNumber,
    this.country,
    this.countryCode,
    this.state,
    this.height,
    this.weight,
    this.occupation,
    this.workoutLocation,
    this.fitnessGoal,
    this.introduction,
    this.medicalCondition,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoToJson(this);
}

@JsonSerializable()
class Coordinates {
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lng")
  final double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class EmergencyContact {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @JsonKey(name: "relation")
  final String? relation;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "countryName")
  final String? countryName;

  EmergencyContact({
    this.countryName,
    this.name,
    this.phone,
    this.countryCode,
    this.relation,
    this.id,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "home")
  final Gym? home;
  @JsonKey(name: "gym")
  final Gym? gym;
  @JsonKey(name: "outdoor")
  final Gym? outdoor;
  @JsonKey(name: "online")
  final String? online;

  Location({
    this.home,
    this.gym,
    this.outdoor,
    this.online,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Gym {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "lng")
  final double? lng;

  Gym({
    this.name,
    this.lat,
    this.lng,
  });

  factory Gym.fromJson(Map<String, dynamic> json) => _$GymFromJson(json);

  Map<String, dynamic> toJson() => _$GymToJson(this);
}

@JsonSerializable()
class Social {
  @JsonKey(name: "facebook")
  final String? facebook;
  @JsonKey(name: "instagram")
  final String? instagram;

  Social({
    this.facebook,
    this.instagram,
  });

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
