//     final commonModel = commonModelFromJson(jsonString);

import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'common_model.freezed.dart';
part 'no_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NoDataModel extends Equatable {
  final String? value;

  const NoDataModel({this.value});

  factory NoDataModel.fromJson(Map<String, dynamic> json) =>
      _$NoDataModelFromJson(json);

  @override
  List<Object?> get props => [value];
}
