import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/src/presentation/bloc/weather_event.dart';
import 'package:weather_app/src/presentation/bloc/weather_mapper.dart';
import 'package:weather_app/src/presentation/bloc/weather_state.dart';
import 'package:weather_app/src/common/constant.dart';
import 'package:weather_app/src/data/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = GetIt.instance<WeatherRepository>();
  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherEvent>(fetchWeatherByCity);
  }

  Future<void> fetchWeatherByCity(
    WeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    String city =
        event is WeatherSearchEvent ? event.city : Constant.defaultCity;
    try {
      if (state is WeatherInitialState || state is WeatherLoadingState) {
        emit(WeatherLoadingState());
      }
      final weather = await _weatherRepository.fetchWeatherByCity(city);
      emit(WeatherSuccessState(weather: WeatherMapper.changeWeather(weather)));
    } catch (exception) {
      emit(WeatherFailureState(errorMessage: Constant.defaultErrorMessage));
    }
  }
}
