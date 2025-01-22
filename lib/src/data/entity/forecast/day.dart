import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/entity/condition.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  @JsonKey(name: 'avgtemp_c')
  final double averageTemperature;
  final Condition condition;

  const Day({
    required this.averageTemperature,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Day copyWith({
    double? averageTemperature,
    Condition? condition,
  }) {
    return Day(
      averageTemperature: averageTemperature ?? this.averageTemperature,
      condition: condition ?? this.condition,
    );
  }
}
