import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/forecasting_response.dart';
import 'package:weather_app/weather_response.dart';

class DataManagement {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '8f33a655c7e0a04c484d6e589c4c6637'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    print(uri);

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

  /*https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}*/

  Future<ForecastingResponse> getForecasting (double lat, double long) async{
    final queryParameters = {
      'lat': lat.toString(),
      'lon': long.toString(),
      'exclude': 'alerts,minutely,current',
      'appid': '8f33a655c7e0a04c484d6e589c4c6637'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/onecall', queryParameters);
    print(uri);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    return ForecastingResponse.fromJson(json);
  }
}
