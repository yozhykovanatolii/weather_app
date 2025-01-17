import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/common/constant.dart';
import 'package:weather_app/cubit/weather_mapper.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final _weatherRepository = GetIt.instance<WeatherRepository>();

  WeatherCubit() : super(const WeatherState()) {
    fetchWeatherByCity(Constant.defaultCity);
  }

  Future<void> fetchWeatherByCity(String city) async {
    emit(state.copyWith(errorText: ''));
    try {
      if (!state.isLoaded) {
        emit(state.copyWith(isLoading: true));
      }
      final weather = await _weatherRepository.fetchWeatherByCity(city);
      emit(state.copyWith(
        weather: WeatherMapper.changeWeather(weather),
        isLoaded: true,
      ));
    } catch (exception) {
      emit(state.copyWith(
        errorText: exception.toString().substring(11),
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
