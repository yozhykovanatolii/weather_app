import 'package:flutter/material.dart';

class WeatherConditionWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  const WeatherConditionWidget({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              iconData,
              size: 30,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
