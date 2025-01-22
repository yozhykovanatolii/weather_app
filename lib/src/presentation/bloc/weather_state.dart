import 'package:equatable/equatable.dart';
import 'package:weather_app/src/data/entity/weather.dart';

sealed class WeatherState extends Equatable {}

class WeatherInitialState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherSuccessState extends WeatherState {
  final Weather weather;

  WeatherSuccessState({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
