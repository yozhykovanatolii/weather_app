import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/data/entity/current/current.dart';
import 'package:weather_app/src/data/entity/forecast/forecast.dart';
import 'package:weather_app/src/data/entity/location/location.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final Location location;
  final Current current;
  final Forecast forecast;

  const Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Weather copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) {
    return Weather(
      location: location ?? this.location,
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
    );
  }
}
