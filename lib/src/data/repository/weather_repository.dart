import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:weather_app/src/common/constant.dart';
import 'package:weather_app/src/data/entity/weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final _client = GetIt.instance<http.Client>();

  Future<Weather> fetchWeatherByCity(String city) async {
    final response = await _client.get(Uri.parse(
      '${Constant.urlCurrentWeather}?key=${Constant.apiKey}&q=$city&days=${Constant.amountOfDays}',
    ));
    if (response.statusCode == Constant.statusOk) {
      return Weather.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception(Constant.defaultErrorMessage);
    }
  }
}
