import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/theme.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/di/get_it_setup.dart';
import 'package:weather_app/ui/screen/home_screen.dart';

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
        create: (_) => WeatherCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
