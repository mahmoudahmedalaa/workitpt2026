// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionResponseModel _$SessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    SessionResponseModel(
      pricing: json['pricing'] == null
          ? null
          : Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      flexibleLocation: json['flexible_location'] as bool?,
      id: json['id'] as String?,
      sessionTitle: json['session_title'] as String?,
      reviewStatus: json['reviewStatus'] as bool?,
      prefrenceDataTime: (json['prefrenceDataTime'] as List<dynamic>?)
          ?.map((e) => PrefrenceDataTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      ratingID: json['_id'] as String?,
      coordicates: json['coordicates'] == null
          ? null
          : Coordicates.fromJson(json['coordicates'] as Map<String, dynamic>),
      benefits: json['benefits'] as String?,
      locationRange: json['location_range'] as int?,
      isPaid: json['isPaid'] as String?,
      whatToBring: json['what_to_bring'] as String?,
      whatToExpect: json['what_to_expect'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      day: json['day'] as String?,
      session: json['session'] as String?,
      difficultyLevel: json['difficulty_level'] as String?,
      price: json['price'] as int?,
      sessionType: json['session_type'] as String?,
      selectType: json['select_type'] as String?,
      occurrence: json['occurrence'] as String?,
      dateFrom: json['date_from'] == null
          ? null
          : DateTime.parse(json['date_from'] as String),
      dateTo: json['date_to'] == null
          ? null
          : DateTime.parse(json['date_to'] as String),
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      location: json['location'] as String?,
      dayOfWeek: json['day_of_week'] as String?,
      mapLocation: json['location_on_map'] as String?,
      trainer: json['trainer'] == null
          ? null
          : TrainerInfoModel.fromJson(json['trainer'] as Map<String, dynamic>),
      referenceId: json['referenceId'] as String?,
      booked: json['booked'] as bool?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      onlineUrl: json['online_url'] as String?,
      numOfAttendees: json['no_of_attendees'] as int?,
      pendingBookingId: json['pendingBookingId'] as String?,
    );

Map<String, dynamic> _$SessionResponseModelToJson(
        SessionResponseModel instance) =>
    <String, dynamic>{
      'flexible_location': instance.flexibleLocation,
      'location_range': instance.locationRange,
      'id': instance.id,
      'session_title': instance.sessionTitle,
      '_id': instance.ratingID,
      'session': instance.session,
      'day': instance.day,
      'isPaid': instance.isPaid,
      'date': instance.date?.toIso8601String(),
      'difficulty_level': instance.difficultyLevel,
      'price': instance.price,
      'session_type': instance.sessionType,
      'select_type': instance.selectType,
      'occurrence': instance.occurrence,
      'date_from': instance.dateFrom?.toIso8601String(),
      'date_to': instance.dateTo?.toIso8601String(),
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
      'location': instance.location,
      'day_of_week': instance.dayOfWeek,
      'description': instance.description,
      'booked': instance.booked,
      'trainer': instance.trainer,
      'referenceId': instance.referenceId,
      'images': instance.images,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'benefits': instance.benefits,
      'what_to_bring': instance.whatToBring,
      'what_to_expect': instance.whatToExpect,
      'online_url': instance.onlineUrl,
      'location_on_map': instance.mapLocation,
      'reviewStatus': instance.reviewStatus,
      'no_of_attendees': instance.numOfAttendees,
      'coordicates': instance.coordicates,
      'prefrenceDataTime': instance.prefrenceDataTime,
      'pendingBookingId': instance.pendingBookingId,
      'pricing': instance.pricing,
    };

PrefrenceDataTime _$PrefrenceDataTimeFromJson(Map<String, dynamic> json) =>
    PrefrenceDataTime(
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      sessionID: json['session_id'] as String?,
      day: json['day'] as String?,
      isBooking: json['isBooking'] as bool?,
    );

Map<String, dynamic> _$PrefrenceDataTimeToJson(PrefrenceDataTime instance) =>
    <String, dynamic>{
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
      'session_id': instance.sessionID,
      'date': instance.date?.toIso8601String(),
      'day': instance.day,
      'isBooking': instance.isBooking,
    };

TrainerInfoModel _$TrainerInfoModelFromJson(Map<String, dynamic> json) =>
    TrainerInfoModel(
      firstName: json['firstName'] as String?,
      avatar: json['avatar'] as String?,
      lastName: json['lastName'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$TrainerInfoModelToJson(TrainerInfoModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      total: (json['total'] as num?)?.toDouble(),
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'total': instance.total,
      'details': instance.details,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      serviceCharge: (json['serviceCharge'] as num?)?.toDouble(),
      currentCost: (json['currentCost'] as num?)?.toDouble(),
      transactionCharge: (json['transactionCharge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'serviceCharge': instance.serviceCharge,
      'currentCost': instance.currentCost,
      'transactionCharge': instance.transactionCharge,
    };
