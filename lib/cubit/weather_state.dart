import 'package:weather_app/data/entity/weather.dart';

class WeatherState {
  final Weather? weather;
  final bool isLoading;
  final bool isLoaded;
  final String errorText;

  const WeatherState({
    this.weather,
    this.isLoading = false,
    this.isLoaded = false,
    this.errorText = '',
  });

  WeatherState copyWith({
    Weather? weather,
    bool? isLoading,
    bool? isLoaded,
    String? errorText,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      errorText: errorText ?? this.errorText,
    );
  }
}
