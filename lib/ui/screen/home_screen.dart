import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/constant.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/data/entity/weather.dart';
import 'package:weather_app/ui/widget/error_text_widget.dart';
import 'package:weather_app/ui/widget/forecast_day_tile.dart';
import 'package:weather_app/ui/widget/loading_progress_indicator.dart';
import 'package:weather_app/ui/widget/weather_condition_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () async {
            await cubit.fetchWeatherByCity(Constant.defaultCity);
          },
          child: ListView(
            children: [
              SearchBar(
                hintText: 'Enter the city',
                onChanged: cubit.fetchWeatherByCity,
              ),
              const SizedBox(height: 20),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state.isLoaded) {
                    return _WeatherDetailSection(weather: state.weather);
                  }
                  if (state.errorText.isNotEmpty) {
                    return ErrorTextWidget(
                      errorMessage: state.errorText,
                    );
                  }
                  return const LoadingProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeatherDetailSection extends StatelessWidget {
  final Weather? weather;
  const _WeatherDetailSection({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(
          '${weather?.location?.name}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            Image.network(
              '${weather?.current?.condition.icon}',
              height: 160,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${weather?.current?.temperature.toInt()}°C',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '${weather?.current?.condition.weatherText}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WeatherConditionWidget(
              iconData: Icons.air,
              text: '${weather?.current?.windSpeed} km/h',
            ),
            WeatherConditionWidget(
              iconData: Icons.cloud,
              text: '${weather?.current?.cloud} %',
            ),
            WeatherConditionWidget(
              iconData: Icons.water_drop,
              text: '${weather?.current?.humidity} %',
            ),
          ],
        ),
        Text(
          '3 Days Forecast',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            itemBuilder: (_, index) {
              return ForecastDayTile(
                  forecastDay: weather?.forecast?.forecastDays[index]);
            },
            separatorBuilder: (_, index) => const SizedBox(
              height: 5,
            ),
            itemCount: weather?.forecast?.forecastDays.length ?? 0,
          ),
        )
      ],
    );
  }
}
