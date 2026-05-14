//     final commonModel = commonModelFromJson(jsonString);

import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'common_model.freezed.dart';
part 'common_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CommonModel<T> extends Equatable {
  final bool ok;
  final T? data;
  final String? message;
  final String? accessToken;
  final int? currentPage;
  final int? totalPage;
  final int? limit;
  final int? total;
  const CommonModel({
    required this.ok,
    this.data,
    this.message,
    this.accessToken,
    this.currentPage,
    this.totalPage,
    this.limit,
    this.total,
  });

  factory CommonModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CommonModelFromJson<T>(json, fromJsonT);

  @override
  List<Object?> get props => [ok, data];
}
