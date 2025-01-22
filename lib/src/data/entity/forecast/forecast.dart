import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/entity/forecast/forecastday.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  @JsonKey(name: 'forecastday')
  final List<ForecastDay> forecastDays;

  const Forecast({
    required this.forecastDays,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Forecast copyWith({
    List<ForecastDay>? forecastDays,
  }) {
    return Forecast(
      forecastDays: forecastDays ?? this.forecastDays,
    );
  }
}
