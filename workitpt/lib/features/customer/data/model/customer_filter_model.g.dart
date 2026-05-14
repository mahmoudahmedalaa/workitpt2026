// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFilterModel _$CustomerFilterModelFromJson(Map<String, dynamic> json) =>
    CustomerFilterModel(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      search: json['search'] as String?,
      price: json['price'] as int?,
      sort: json['sort'] as int?,
    );

Map<String, dynamic> _$CustomerFilterModelToJson(
        CustomerFilterModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'sort': instance.sort,
      'search': instance.search,
      'page': instance.page,
      'limit': instance.limit,
    };
