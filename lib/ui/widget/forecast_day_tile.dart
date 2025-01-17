import 'package:flutter/material.dart';
import 'package:weather_app/data/entity/forecast/forecastday.dart';

class ForecastDayTile extends StatelessWidget {
  final ForecastDay? forecastDay;

  const ForecastDayTile({
    super.key,
    required this.forecastDay,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        '${forecastDay?.day.condition.icon}',
      ),
      title: Text(
        '${forecastDay?.date.split('-').reversed.join('-')}',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      subtitle: Text(
        '${forecastDay?.day.condition.weatherText}',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      trailing: Text(
        '${forecastDay?.day.averageTemperature.toInt()}°C',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
