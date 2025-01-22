// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      temperature: (json['temp_c'] as num).toDouble(),
      windSpeed: (json['wind_kph'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      cloud: (json['cloud'] as num).toInt(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'temp_c': instance.temperature,
      'wind_kph': instance.windSpeed,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'condition': instance.condition,
    };
