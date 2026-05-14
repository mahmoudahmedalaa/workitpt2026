import 'package:json_annotation/json_annotation.dart';

part 'from_to.g.dart';

@JsonSerializable()
class FromTo {
  @JsonKey(name: '_id')
  final String id;
  final String email;

  FromTo(this.id, this.email);

  factory FromTo.fromJson(Map<String, dynamic> json) => _$FromToFromJson(json);

  Map<String, dynamic> toJson() => _$FromToToJson(this);
}
