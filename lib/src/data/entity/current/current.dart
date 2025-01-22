import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/entity/condition.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  @JsonKey(name: 'temp_c')
  final double temperature;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  final int humidity;
  final int cloud;
  final Condition condition;

  const Current({
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.cloud,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Current copyWith({
    double? temperature,
    double? windSpeed,
    int? humidity,
    int? cloud,
    Condition? condition,
  }) {
    return Current(
      temperature: temperature ?? this.temperature,
      windSpeed: windSpeed ?? this.windSpeed,
      humidity: humidity ?? this.humidity,
      cloud: cloud ?? this.cloud,
      condition: condition ?? this.condition,
    );
  }
}
