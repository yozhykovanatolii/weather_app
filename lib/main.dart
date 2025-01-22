import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather_event.dart';
import 'package:weather_app/src/common/theme.dart';
import 'package:weather_app/src/di/get_it_setup.dart';
import 'package:weather_app/src/presentation/screen/home_screen.dart';

void main() {
  GetItSetup.setupDependencies();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: BlocProvider(
        create: (_) => WeatherBloc()..add(WeatherInitializedEvent()),
        child: const HomeScreen(),
      ),
    );
  }
}
