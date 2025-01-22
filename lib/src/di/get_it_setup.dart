import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/data/repository/weather_repository.dart';

abstract class GetItSetup {
  static void setupDependencies() {
    GetIt.instance.registerFactory<http.Client>(() => http.Client());
    GetIt.instance.registerFactory<WeatherRepository>(
      () => WeatherRepository(),
    );
  }
}
