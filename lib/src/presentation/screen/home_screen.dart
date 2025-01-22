import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/src/presentation/bloc/weather_event.dart';
import 'package:weather_app/src/presentation/bloc/weather_state.dart';
import 'package:weather_app/src/data/entity/weather.dart';
import 'package:weather_app/src/presentation/screen/widget/error_text_widget.dart';
import 'package:weather_app/src/presentation/screen/widget/forecast_day_tile.dart';
import 'package:weather_app/src/presentation/screen/widget/loading_progress_indicator.dart';
import 'package:weather_app/src/presentation/screen/widget/weather_condition_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherBloc>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          bloc.add(WeatherInitializedEvent());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                spacing: 20,
                children: [
                  SearchBar(
                    hintText: 'Enter the city',
                    onChanged: (city) =>
                        bloc.add(WeatherSearchEvent(city: city)),
                  ),
                  Expanded(
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherSuccessState) {
                          return _WeatherDetailSection(weather: state.weather);
                        }
                        if (state is WeatherFailureState) {
                          return ErrorTextWidget(
                            errorMessage: state.errorMessage,
                          );
                        }
                        return const LoadingProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherDetailSection extends StatelessWidget {
  final Weather weather;
  const _WeatherDetailSection({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          weather.location.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            Image.network(
              weather.current.condition.icon,
              height: 160,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${weather.current.temperature.toInt()}°C',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    weather.current.condition.weatherText,
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
              text: '${weather.current.windSpeed} km/h',
            ),
            WeatherConditionWidget(
              iconData: Icons.cloud,
              text: '${weather.current.cloud} %',
            ),
            WeatherConditionWidget(
              iconData: Icons.water_drop,
              text: '${weather.current.humidity} %',
            ),
          ],
        ),
        Text(
          '3 Days Forecast',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: ListView.separated(
            itemBuilder: (_, index) {
              return ForecastDayTile(
                forecastDay: weather.forecast.forecastDays[index],
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
              height: 5,
            ),
            itemCount: weather.forecast.forecastDays.length,
          ),
        )
      ],
    );
  }
}
