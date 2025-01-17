// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
      date: json['date'] as String,
      day: Day.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
    };
