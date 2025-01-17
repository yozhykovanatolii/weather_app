import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  @JsonKey(name: 'localtime')
  final String time;

  const Location({
    required this.name,
    required this.time,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Location copyWith({
    String? name,
    String? time,
  }) {
    return Location(
      name: name ?? this.name,
      time: time ?? this.time,
    );
  }
}
