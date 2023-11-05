import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherModel(this.city, this.temperature, this.condition, this.humidity,
      this.windSpeed);

  factory WeatherModel.fromJson(Map<String, dynamic> weatherData) {
    return WeatherModel(
        weatherData['city'],
        weatherData['temperature'],
        weatherData['condition'],
        weatherData['humidity'],
        weatherData['windSpeed']);
  }
}
