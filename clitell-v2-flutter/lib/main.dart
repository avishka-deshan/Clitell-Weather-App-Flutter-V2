
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_page.dart';

StreamController<int> streamController = StreamController<int>();

main(){
 runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final String cityName = '';
  final int temperature = 0;
  final String updatedDate = '';
  final String sunriseTime = '';
  final String sunsetTime = '';
  final String dayTime = '';
  final int feelsLike = 0;
  final int tempMin = 0;
  final int tempMax = 0;
  final int pressure = 0;
  final int humidity = 0;
  final String description = '';
  final String desIcon = '';
  final String windSpeed = '';
  final String windDirection = '';
  final String country = '';
  final double visibility = 0;

  final bool updating = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  WeatherPage(
          streamController.stream),
    );
  }
}
