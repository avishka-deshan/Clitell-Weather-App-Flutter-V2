import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/screens/weather_page.dart';
import 'package:weather_app/weather_response.dart';
import 'package:weather_app/widgets/weather_widget.dart';

import 'data_management.dart';
import 'main.dart';


class Search{

   String searchedText = 'Colombo';
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



  /*Widget addToWeatherWidget(BuildContext context) {
    return WeatherWidget(cityName,temperature,updatedDate,sunriseTime,sunsetTime,dayTime,feelsLike,tempMin,tempMax,pressure,
  humidity,description,desIcon,windSpeed,windDirection,country,visibility);
  }*/

  void addDescriptions() {
    List<String> thunderstorm = [
      "thunderstorm with light rain",
      "thunderstorm with rain",
      "thunderstorm with heavy rain",
      "light thunderstorm",
      "thunderstorm",
      'heavy thunderstorm',
      "ragged thunderstorm",
      "thunderstorm with light drizzle",
      "thunderstorm with drizzle",
      "thunderstorm with heavy drizzle"
    ];

    List<String> drizzle = [
      "light intensity drizzle",
      "drizzle",
      "heavy intensity drizzle",
      "light intensity drizzle rain",
      "drizzle rain",
      "heavy intensity drizzle rain",
      "shower rain and drizzle",
      "heavy shower rain and drizzle",
      "shower drizzle"
    ];

    List<String> rain = [
      "light rain",
      "moderate rain",
      "heavy intensity rain",
      "very heavy rain",
      "extreme rain",
      "light intensity shower rain",
      "shower rain",
      "heavy intensity shower rain",
      "ragged shower rain"
    ];

    List<String> snow = [
      "light snow",
      "Snow",
      "Heavy snow",
      "Sleet",
      "Light shower sleet",
      "Shower sleet",
      "Light rain and snow",
      "Rain and snow",
      "Light shower snow",
      "Shower snow",
      "Heavy shower snow",
      "freezing rain"
    ];

    List<String> atmosphere = [
      "mist",
      "Smoke",
      "Haze",
      "sand/ dust whirls",
      "fog",
      "sand",
      "dust",
      "volcanic ash",
      "squalls",
      "tornado"
    ];

    List<String> clear = ['Clear'];

    List<String> clouds = [
      "few clouds",
      "scattered clouds",
      "broken clouds",
      "overcast clouds"
    ];

    if (thunderstorm.contains(description)) {
      desIcon = 'assets/images/thunderstorm.png';
    } else if (drizzle.contains(description)) {
      desIcon = 'assets/images/shower-rain-day.png';
    } else if (clear.contains(description)) {
      desIcon = 'assets/images/clear-sky.jpg';
    } else if (clouds.contains(description)) {
      if (description == "few clouds") {
        desIcon = 'assets/images/few-clouds-day.png';
      } else if (description == "scattered clouds") {
        desIcon = 'assets/images/scattered-clouds.png';
      } else if (description == "broken clouds" && dayTime != "Night") {
        desIcon = 'assets/images/few-clouds-day.png';
      } else if (description == "broken clouds" && dayTime == "Night") {
        desIcon = 'assets/images/few-clouds-night.png';
      } else if (description == "overcast clouds" && dayTime != "Night") {
        desIcon = 'assets/images/few-clouds-day.png';
      } else if (description == "overcast clouds" && dayTime == "Night") {
        desIcon = 'assets/images/few-clouds-night.png';
      }
    } else if (atmosphere.contains(description)) {
      desIcon = 'assets/images/mist.png';
    } else if (snow.contains(description)) {
      desIcon = 'assets/images/snow.png';
    } else if (rain.contains(description)) {
      desIcon = 'assets/images/rain-night.png';
    }

    description = convertToTitleCase(description);
  }

  String convertToTitleCase(String text) {
    if (text.length <= 1) {
      return text.toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = text.split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }

  void search(String searchText) async {
    WeatherResponse weatherResponse;
    final response = await DataManagement().getWeather(searchText);
    weatherResponse = response;
    searchedText = searchText;
    cityName = weatherResponse.cityName;
    temperature = weatherResponse.temperature;
    updatedDate = weatherResponse.updatedDate;
    sunriseTime = weatherResponse.sunriseTime;
    sunsetTime = weatherResponse.sunsetTime;
    dayTime = weatherResponse.dayTime;
    feelsLike = weatherResponse.feelsLike;
    tempMin = weatherResponse.tempMin;
    tempMax = weatherResponse.tempMax;
    humidity = weatherResponse.humidity;
    pressure = weatherResponse.pressure;
    windSpeed = weatherResponse.windSpeed;
    windDirection = weatherResponse.windDirection;
    country = weatherResponse.country;
    visibility = weatherResponse.visibility;
    addDescriptions();
    description = weatherResponse.description;
    print(windDirection);
    print(cityName);


  }
}
