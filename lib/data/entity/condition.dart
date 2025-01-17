import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  @JsonKey(name: 'text')
  final String weatherText;
  final String icon;

  const Condition({
    required this.weatherText,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Condition copyWith({
    String? weatherText,
    String? icon,
  }) {
    return Condition(
      weatherText: weatherText ?? this.weatherText,
      icon: icon ?? this.icon,
    );
  }
}
