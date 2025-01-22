import 'package:equatable/equatable.dart';

sealed class WeatherEvent extends Equatable {}

class WeatherInitializedEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class WeatherSearchEvent extends WeatherEvent {
  final String city;

  WeatherSearchEvent({required this.city});

  @override
  List<Object?> get props => [city];
}
