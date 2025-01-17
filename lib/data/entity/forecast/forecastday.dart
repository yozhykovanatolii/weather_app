import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/entity/forecast/day.dart';

part 'forecastday.g.dart';

@JsonSerializable()
class ForecastDay {
  final String date;
  final Day day;

  const ForecastDay({
    required this.date,
    required this.day,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  ForecastDay copyWith({
    String? date,
    Day? day,
  }) {
    return ForecastDay(
      date: date ?? this.date,
      day: day ?? this.day,
    );
  }
}
