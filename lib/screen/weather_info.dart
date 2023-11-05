import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/json_data.dart';
import '../model/weather_model.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  List<WeatherModel> weatherList = [];

  Future<void> getWeatherData() async {
    final jsonData = jsonDecode(jsonString);

    for (Map<String, dynamic> weather in jsonData) {
      weatherList.add(WeatherModel.fromJson(weather));
      setState(() {});
    }
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Info App")),
      body: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("City: ${weatherList[index].city}",
                        style: TextStyle(fontSize: 18)),
                    Text("Temperature: ${weatherList[index].temperature}°C"),
                    Text("Condition: ${weatherList[index].condition}"),
                    Text("Humidity: ${weatherList[index].humidity}%"),
                    Text("Wind Speed: ${weatherList[index].windSpeed} m/s"),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
