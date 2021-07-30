import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'data_management.dart';

class ForecastingResponse {
  final int d2temperature;
  final d2updatedDate;
  final d2sunriseTime;
  final d2sunsetTime;
  final d2feelsLike;
  final d2tempMin;
  final d2tempMax;
  final d2description;

  final int d3temperature;
  final d3updatedDate;
  final d3sunriseTime;
  final d3sunsetTime;
  final d3feelsLike;
  final d3tempMin;
  final d3tempMax;
  final d3description;

  final int d4temperature;
  final d4updatedDate;
  final d4sunriseTime;
  final d4sunsetTime;
  final d4feelsLike;
  final d4tempMin;
  final d4tempMax;
  final d4description;

  final int d5temperature;
  final d5updatedDate;
  final d5sunriseTime;
  final d5sunsetTime;
  final d5feelsLike;
  final d5tempMin;
  final d5tempMax;
  final d5description;

  final int h1temperature;
  final h1description;
  final h1time;

  final int h2temperature;
  final h2description;
  final h2time;

  final int h3temperature;
  final h3description;
  final h3time;

  final h1DayTime;
  final h2DayTime;
  final h3DayTime;

  ForecastingResponse(
      this.d2temperature,
      this.d2updatedDate,
      this.d2sunriseTime,
      this.d2sunsetTime,
      this.d2feelsLike,
      this.d2tempMin,
      this.d2tempMax,
      this.d2description,
      this.d3temperature,
      this.d3updatedDate,
      this.d3sunriseTime,
      this.d3sunsetTime,
      this.d3feelsLike,
      this.d3tempMin,
      this.d3tempMax,
      this.d3description,
      this.d4temperature,
      this.d4updatedDate,
      this.d4sunriseTime,
      this.d4sunsetTime,
      this.d4feelsLike,
      this.d4tempMin,
      this.d4tempMax,
      this.d4description,
      this.d5temperature,
      this.d5updatedDate,
      this.d5sunriseTime,
      this.d5sunsetTime,
      this.d5feelsLike,
      this.d5tempMin,
      this.d5tempMax,
      this.d5description,
      this.h1temperature,
      this.h1description,
      this.h1time,
      this.h2temperature,
      this.h2description,
      this.h2time,
      this.h3temperature,
      this.h3description,
      this.h3time,
      this.h1DayTime,
      this.h2DayTime,
      this.h3DayTime);

  factory ForecastingResponse.fromJson(Map<String, dynamic> json) {
    final d2Json = json['daily'][1];

    final d2temperature =
        ForecastData.fromJson(d2Json, json).forecastTemperature;
    final d2tempMin = ForecastData.fromJson(d2Json, json).forecastTempMin;
    final d2tempMax = ForecastData.fromJson(d2Json, json).forecastTempMax;
    final d2feelsLike = ForecastData.fromJson(d2Json, json).forecastFeelsLike;
    final d2updatedDate =
        ForecastData.fromJson(d2Json, json).forecastUpdatedDate;
    final d2sunriseTime =
        ForecastData.fromJson(d2Json, json).forecastSunriseTime;
    final d2sunsetTime = ForecastData.fromJson(d2Json, json).forecastSunsetTime;
    final d2description =
        ForecastData.fromJson(d2Json, json).forecastDescription;

    final d3Json = json['daily'][2];

    final d3temperature =
        ForecastData.fromJson(d3Json, json).forecastTemperature;
    final d3tempMin = ForecastData.fromJson(d3Json, json).forecastTempMin;
    final d3tempMax = ForecastData.fromJson(d3Json, json).forecastTempMax;
    final d3feelsLike = ForecastData.fromJson(d3Json, json).forecastFeelsLike;
    final d3updatedDate =
        ForecastData.fromJson(d3Json, json).forecastUpdatedDate;
    final d3sunriseTime =
        ForecastData.fromJson(d3Json, json).forecastSunriseTime;
    final d3sunsetTime = ForecastData.fromJson(d3Json, json).forecastSunsetTime;
    final d3description =
        ForecastData.fromJson(d3Json, json).forecastDescription;

    final d4Json = json['daily'][3];

    final d4temperature =
        ForecastData.fromJson(d4Json, json).forecastTemperature;
    final d4tempMin = ForecastData.fromJson(d4Json, json).forecastTempMin;
    final d4tempMax = ForecastData.fromJson(d4Json, json).forecastTempMax;
    final d4feelsLike = ForecastData.fromJson(d4Json, json).forecastFeelsLike;
    final d4updatedDate =
        ForecastData.fromJson(d4Json, json).forecastUpdatedDate;
    final d4sunriseTime =
        ForecastData.fromJson(d4Json, json).forecastSunriseTime;
    final d4sunsetTime = ForecastData.fromJson(d4Json, json).forecastSunsetTime;
    final d4description =
        ForecastData.fromJson(d4Json, json).forecastDescription;

    final d5Json = json['daily'][4];

    final d5temperature =
        ForecastData.fromJson(d5Json, json).forecastTemperature;
    final d5tempMin = ForecastData.fromJson(d5Json, json).forecastTempMin;
    final d5tempMax = ForecastData.fromJson(d5Json, json).forecastTempMax;
    final d5feelsLike = ForecastData.fromJson(d5Json, json).forecastFeelsLike;
    final d5updatedDate =
        ForecastData.fromJson(d5Json, json).forecastUpdatedDate;
    final d5sunriseTime =
        ForecastData.fromJson(d5Json, json).forecastSunriseTime;
    final d5sunsetTime = ForecastData.fromJson(d5Json, json).forecastSunsetTime;
    final d5description =
        ForecastData.fromJson(d5Json, json).forecastDescription;

    final h1Json = json['hourly'][1];
    print(h1Json);

    final d1Json = json['daily'][0];

    final d1sunriseTime =
        ForecastData.fromJson(d1Json, json).forecastSunriseTime;
    final d1sunsetTime = ForecastData.fromJson(d1Json, json).forecastSunsetTime;

    final h1temperature =
        HourData.fromJson(h1Json, json, d1sunriseTime, d1sunsetTime)
            .temperature;
    final h1updatedDate =
        HourData.fromJson(h1Json, json, d1sunriseTime, d1sunsetTime).hour;
    final h1description =
        HourData.fromJson(h1Json, json, d1sunriseTime, d1sunsetTime)
            .forecastDescription;
    final h1DayTime =
        HourData.fromJson(h1Json, json, d1sunriseTime, d1sunsetTime).daytime;

    final h2Json = json['hourly'][2];

    final h2temperature =
        HourData.fromJson(h2Json, json, d1sunriseTime, d1sunsetTime)
            .temperature;
    final h2updatedDate =
        HourData.fromJson(h2Json, json, d1sunriseTime, d1sunsetTime).hour;
    final h2description =
        HourData.fromJson(h2Json, json, d1sunriseTime, d1sunsetTime)
            .forecastDescription;
    final h2DayTime =
        HourData.fromJson(h2Json, json, d1sunriseTime, d1sunsetTime).daytime;

    final h3Json = json['hourly'][3];

    final h3temperature =
        HourData.fromJson(h3Json, json, d1sunriseTime, d1sunsetTime)
            .temperature;
    final h3updatedDate =
        HourData.fromJson(h3Json, json, d1sunriseTime, d1sunsetTime).hour;
    final h3description =
        HourData.fromJson(h3Json, json, d1sunriseTime, d1sunsetTime)
            .forecastDescription;
    final h3DayTime =
        HourData.fromJson(h3Json, json, d1sunriseTime, d1sunsetTime).daytime;

    print("h3" + h3temperature.toString());
    print("h3" + h3updatedDate);
    print("h3" + h3description);

    return ForecastingResponse(
        d2temperature,
        d2updatedDate,
        d2sunriseTime,
        d2sunsetTime,
        d2feelsLike,
        d2tempMin,
        d2tempMax,
        d2description,
        d3temperature,
        d3updatedDate,
        d3sunriseTime,
        d3sunsetTime,
        d3feelsLike,
        d3tempMin,
        d3tempMax,
        d3description,
        d4temperature,
        d4updatedDate,
        d4sunriseTime,
        d4sunsetTime,
        d4feelsLike,
        d4tempMin,
        d4tempMax,
        d4description,
        d5temperature,
        d5updatedDate,
        d5sunriseTime,
        d5sunsetTime,
        d5feelsLike,
        d5tempMin,
        d5tempMax,
        d5description,
        h1temperature,
        h1description,
        h1updatedDate,
        h2temperature,
        h2description,
        h2updatedDate,
        h3temperature,
        h3description,
        h3updatedDate,
        h1DayTime,
        h2DayTime,
        h3DayTime);
  }
}

class HourData {
  final int temperature;
  final forecastDescription;
  final hour;
  final daytime;

  factory HourData.fromJson(Map<String, dynamic> hourJson,
      Map<String, dynamic> json, String rise, String set) {
    final timezoneLong = json['timezone_offset'] * 1000;

    final kTemperature = hourJson['temp'];
    final int temperature = kTemperature.toInt() - 273;

    final weatherInfoJson = hourJson['weather'][0];
    final forecastDescription = weatherInfoJson['description'];

    final dateLong = hourJson['dt'] * 1000;
    final dateFormatTime = new DateFormat('HH:mm a');

    final hour = dateFormatTime.format(
        new DateTime.fromMillisecondsSinceEpoch(dateLong + timezoneLong)
            .toUtc());

    DateTime forecastTime = new DateFormat("HH:mm a").parse(hour);
    DateTime riseTime = new DateFormat("HH:mm a").parse(rise);
    DateTime setTime = new DateFormat("HH:mm a").parse(set);
    DateTime noonTime = new DateFormat("HH:mm a").parse("12:01 PM");
    DateTime eveningTime = new DateFormat("HH:mm a").parse("17:00 PM");

    print(forecastTime);
    print(riseTime);
    print(setTime);
    print(noonTime);
    print(eveningTime);

    final dayTime;
    if (forecastTime.isAfter(riseTime) && forecastTime.isBefore(noonTime) ) {
      dayTime = "Morning";
      print(dayTime);
    } else if (forecastTime.isAfter(noonTime) &&
        forecastTime.isBefore(eveningTime)) {
      dayTime = "Afternoon";
    } else if (forecastTime.isAfter(eveningTime) &&
        forecastTime.isBefore(setTime)) {
      dayTime = "Evening";
    } else {
      dayTime = "Night";
    }

    print(dayTime);

    return HourData(temperature, forecastDescription, hour, dayTime);
  }

  HourData(this.temperature, this.forecastDescription, this.hour, this.daytime);
}

class ForecastData {
  final forecastTemperature;
  final forecastTempMax;
  final forecastTempMin;
  final forecastUpdatedDate;
  final forecastFeelsLike;
  final forecastSunriseTime;
  final forecastSunsetTime;
  final forecastDescription;

  ForecastData(
      this.forecastTemperature,
      this.forecastTempMax,
      this.forecastTempMin,
      this.forecastUpdatedDate,
      this.forecastFeelsLike,
      this.forecastSunriseTime,
      this.forecastSunsetTime,
      this.forecastDescription);

  factory ForecastData.fromJson(
      Map<String, dynamic> dailyJson, Map<String, dynamic> json) {
    final int timezoneLong = json['timezone_offset'] * 1000;

    final d2TempJson = dailyJson['temp'];
    final forecastTemperature = TempResponse.fromJson(d2TempJson).temperature;
    final forecastTempMax = TempResponse.fromJson(d2TempJson).tempMax;
    final forecastTempMin = TempResponse.fromJson(d2TempJson).tempMin;

    final dateLong = dailyJson['dt'] * 1000;
    final dateFormat = new DateFormat('EEE dd MMM yyyy');

    final feelsLikeJson = dailyJson['feels_like'];
    final forecastFeelsLike = FeelsLike.fromJson(feelsLikeJson).feelsLike;

    final dateFormatTime = new DateFormat('HH:mm a');
    final sunriseLong = SunRiseSetResponse.fromJson(dailyJson).sunrise;
    final sunsetLong = SunRiseSetResponse.fromJson(dailyJson).sunset;
    final forecastDate =
        dateFormat.format(new DateTime.fromMillisecondsSinceEpoch(dateLong));
    final forecastSunriseTime = dateFormatTime.format(
        new DateTime.fromMillisecondsSinceEpoch(sunriseLong + timezoneLong)
            .toUtc());
    final forecastSunsetTime = dateFormatTime.format(
        new DateTime.fromMillisecondsSinceEpoch(sunsetLong + timezoneLong)
            .toUtc());

    final weatherInfoJson = dailyJson['weather'][0];
    final forecastDescription = weatherInfoJson['description'];

    return ForecastData(
        forecastTemperature,
        forecastTempMax,
        forecastTempMin,
        forecastDate,
        forecastFeelsLike,
        forecastSunriseTime,
        forecastSunsetTime,
        forecastDescription);
  }
}

class TempResponse {
  final int temperature;
  final int tempMin;
  final int tempMax;

  TempResponse(this.temperature, this.tempMin, this.tempMax);

  factory TempResponse.fromJson(Map<String, dynamic> json) {
    final kTemperature = json['day'];
    final int temperature = kTemperature.toInt() - 273;

    final kTempMin = json['min'];
    final int tempMin = kTempMin.toInt() - 273;

    final kTempMax = json['max'];
    final int tempMax = kTempMax.toInt() - 273;

    return TempResponse(temperature, tempMin, tempMax);
  }
}

class FeelsLike {
  final feelsLike;

  FeelsLike(this.feelsLike);

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    final kTemperature = json['day'];
    final int feelsLike = kTemperature.toInt() - 273;

    return FeelsLike(feelsLike);
  }
}

class SunRiseSetResponse {
  final int sunrise;
  final int sunset;

  SunRiseSetResponse(this.sunrise, this.sunset);

  factory SunRiseSetResponse.fromJson(Map<String, dynamic> json) {
    final sunriseLong = json['sunrise'] * 1000;
    final sunsetLong = json['sunset'] * 1000;
    return SunRiseSetResponse(sunriseLong, sunsetLong);
  }
}
