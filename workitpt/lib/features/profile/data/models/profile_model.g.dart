// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] as String?,
      customerInfo: json['customerInfo'] == null
          ? null
          : CustomerInfo.fromJson(json['customerInfo'] as Map<String, dynamic>),
      trainerInfo: json['trainerInfo'] == null
          ? null
          : TrainerInfo.fromJson(json['trainerInfo'] as Map<String, dynamic>),
      email: json['email'] as String?,
      profileCompleted: json['profileCompleted'] as bool?,
      role: json['role'] as String?,
      authProvider: json['authProvider'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      stripeCustomerId: json['stripe_customer_id'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('customerInfo', instance.customerInfo?.toJson());
  writeNotNull('trainerInfo', instance.trainerInfo?.toJson());
  writeNotNull('email', instance.email);
  writeNotNull('profileCompleted', instance.profileCompleted);
  writeNotNull('role', instance.role);
  writeNotNull('authProvider', instance.authProvider);
  writeNotNull('status', instance.status);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('__v', instance.v);
  writeNotNull('stripe_customer_id', instance.stripeCustomerId);
  return val;
}

TrainerInfo _$TrainerInfoFromJson(Map<String, dynamic> json) => TrainerInfo(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      attemptCount: json['attemptCount'],
      certification: (json['certification'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      introduction: json['introduction'] as String?,
      medicalCondition: json['medicalCondition'] as String?,
      gender: json['gender'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      emergencyContact: (json['emergencyContact'] as List<dynamic>?)
          ?.map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactNumber: json['contactNumber'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
      state: json['state'] as String?,
      specialization: (json['specialization'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availability: json['availability'],
      experience: json['experience'] as String?,
      blockerDetails: json['blockerDetails'] as String?,
      verificationStatus: json['verificationStatus'] as String?,
      showAgain: json['showAgain'],
      id: json['_id'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TrainerInfoToJson(TrainerInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('attemptCount', instance.attemptCount);
  writeNotNull('certification', instance.certification);
  writeNotNull('introduction', instance.introduction);
  writeNotNull('medicalCondition', instance.medicalCondition);
  writeNotNull('gender', instance.gender);
  writeNotNull('images', instance.images);
  writeNotNull('emergencyContact',
      instance.emergencyContact?.map((e) => e.toJson()).toList());
  writeNotNull('contactNumber', instance.contactNumber);
  writeNotNull('dob', instance.dob?.toIso8601String());
  writeNotNull('country', instance.country);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('state', instance.state);
  writeNotNull('specialization', instance.specialization);
  writeNotNull('availability', instance.availability);
  writeNotNull('experience', instance.experience);
  writeNotNull('blockerDetails', instance.blockerDetails);
  writeNotNull('verificationStatus', instance.verificationStatus);
  writeNotNull('showAgain', instance.showAgain);
  writeNotNull('_id', instance.id);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) => CustomerInfo(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      fitnessInterest: (json['fitnessInterest'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      social: json['social'] == null
          ? null
          : Social.fromJson(json['social'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      emergencyContact: (json['emergencyContact'] as List<dynamic>?)
          ?.map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactNumber: json['contactNumber'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
      state: json['state'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      occupation: json['occupation'] as String?,
      workoutLocation: json['workoutLocation'] as String?,
      fitnessGoal: json['fitnessGoal'] as String?,
      introduction: json['introduction'] as String?,
      medicalCondition: json['medicalCondition'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CustomerInfoToJson(CustomerInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location?.toJson());
  writeNotNull('coordinates', instance.coordinates?.toJson());
  writeNotNull('social', instance.social?.toJson());
  writeNotNull('gender', instance.gender);
  writeNotNull('dob', instance.dob?.toIso8601String());
  writeNotNull('emergencyContact',
      instance.emergencyContact?.map((e) => e.toJson()).toList());
  writeNotNull('contactNumber', instance.contactNumber);
  writeNotNull('country', instance.country);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('state', instance.state);
  writeNotNull('height', instance.height);
  writeNotNull('weight', instance.weight);
  writeNotNull('occupation', instance.occupation);
  writeNotNull('workoutLocation', instance.workoutLocation);
  writeNotNull('fitnessGoal', instance.fitnessGoal);
  writeNotNull('fitnessInterest', instance.fitnessInterest);
  writeNotNull('introduction', instance.introduction);
  writeNotNull('medicalCondition', instance.medicalCondition);
  writeNotNull('_id', instance.id);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

EmergencyContact _$EmergencyContactFromJson(Map<String, dynamic> json) =>
    EmergencyContact(
      countryName: json['countryName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      countryCode: json['countryCode'] as String?,
      relation: json['relation'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$EmergencyContactToJson(EmergencyContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'countryCode': instance.countryCode,
      'relation': instance.relation,
      '_id': instance.id,
      'countryName': instance.countryName,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      home: json['home'] == null
          ? null
          : Gym.fromJson(json['home'] as Map<String, dynamic>),
      gym: json['gym'] == null
          ? null
          : Gym.fromJson(json['gym'] as Map<String, dynamic>),
      outdoor: json['outdoor'] == null
          ? null
          : Gym.fromJson(json['outdoor'] as Map<String, dynamic>),
      online: json['online'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'home': instance.home,
      'gym': instance.gym,
      'outdoor': instance.outdoor,
      'online': instance.online,
    };

Gym _$GymFromJson(Map<String, dynamic> json) => Gym(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GymToJson(Gym instance) => <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };

Social _$SocialFromJson(Map<String, dynamic> json) => Social(
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'facebook': instance.facebook,
      'instagram': instance.instagram,
    };
