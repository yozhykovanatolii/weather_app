import 'package:weather_app/common/constant.dart';
import 'package:weather_app/data/entity/condition.dart';
import 'package:weather_app/data/entity/forecast/forecastday.dart';
import 'package:weather_app/data/entity/weather.dart';

abstract class WeatherMapper {
  static Weather changeWeather(Weather weather) {
    final condition = changeCurrentCondition(weather);
    final forecastDays = changeForecastDays(weather);
    final forecastNew = weather.forecast?.copyWith(forecastDays: forecastDays);
    final currentNew = weather.current?.copyWith(condition: condition);
    final weatherNew =
        weather.copyWith(current: currentNew, forecast: forecastNew);
    return weatherNew;
  }

  static Condition? changeCurrentCondition(Weather weather) {
    return weather.current?.condition.copyWith(
        icon: '${Constant.address}${weather.current?.condition.icon}');
  }

  static List<ForecastDay>? changeForecastDays(Weather weather) {
    return weather.forecast?.forecastDays
        .map(
          (ForecastDay forecastDay) => forecastDay.copyWith(
            day: forecastDay.day.copyWith(
                condition: forecastDay.day.condition.copyWith(
                    icon:
                        '${Constant.address}${forecastDay.day.condition.icon}')),
          ),
        )
        .toList();
  }
}
