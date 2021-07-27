
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_page.dart';

StreamController<int> streamController = StreamController<int>();

main(){
 runApp(MyApp());
}

class MyApp extends StatelessWidget {

  String cityName = '';
  int temperature = 0;
  String updatedDate = '';
  String sunriseTime = '';
  String sunsetTime = '';
  String dayTime = '';
  int feelsLike = 0;
  int tempMin = 0;
  int tempMax = 0;
  int pressure = 0;
  int humidity = 0;
  String description = '';
  String desIcon = '';
  String windSpeed = '';
  String windDirection = '';
  String country = '';
  double visibility = 0;

  bool updating = false;

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
