// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingPaymentModel _$PendingPaymentModelFromJson(Map<String, dynamic> json) =>
    PendingPaymentModel(
      id: json['_id'] as String?,
      session: json['session'] == null
          ? null
          : Session.fromJson(json['session'] as Map<String, dynamic>),
      dateFrom: json['date_from'] == null
          ? null
          : DateTime.parse(json['date_from'] as String),
      timeFrom: json['time_from'] as String?,
      timeTo: json['time_to'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$PendingPaymentModelToJson(PendingPaymentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('session', instance.session?.toJson());
  writeNotNull('date_from', instance.dateFrom?.toIso8601String());
  writeNotNull('time_from', instance.timeFrom);
  writeNotNull('time_to', instance.timeTo);
  writeNotNull('date', instance.date);
  return val;
}

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['_id'] as String?,
      sessionTitle: json['session_title'] as String?,
      session: json['session'] as String?,
      price: json['price'] as int?,
      sessionType: json['session_type'] as String?,
      selectType: json['select_type'] as String?,
      locationOnMap: json['location_on_map'] as String?,
      trainer: json['trainer'] == null
          ? null
          : TrainerInfoModel.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      '_id': instance.id,
      'session_title': instance.sessionTitle,
      'session': instance.session,
      'price': instance.price,
      'session_type': instance.sessionType,
      'select_type': instance.selectType,
      'location_on_map': instance.locationOnMap,
      'trainer': instance.trainer,
    };
