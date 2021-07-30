import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/data_management.dart';
import 'package:weather_app/forecasting_response.dart';
import 'package:weather_app/weather_response.dart';
import 'package:weather_app/widgets/weather_widget.dart';
import 'package:geolocator/geolocator.dart';

import '../main.dart';

class WeatherPage extends StatefulWidget {
  final Stream<int> stream;
  String bgImage = 'assets/images/nightBackground.jpg';
  bool typing = false;
  String searchText = 'Colombo';
  final weatherDetails = GlobalKey<_WeatherPageState>();

  @override
  _WeatherPageState createState() => _WeatherPageState();

  WeatherPage(this.stream);
}

class _WeatherPageState extends State<WeatherPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;

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
  num latitude = 0.0;
  num longitude = 0.0;

  int d2temperature = 0;
  String d2updatedDate = '';
  String d2sunriseTime = '';
  String d2sunsetTime = '';
  int d2feelsLike = 0;
  int d2tempMin = 0;
  int d2tempMax = 0;
  String d2description = '';
  String d2desIcon = '';

  int d3temperature = 0;
  String d3updatedDate = '';
  String d3sunriseTime = '';
  String d3sunsetTime = '';
  int d3feelsLike = 0;
  int d3tempMin = 0;
  int d3tempMax = 0;
  String d3description = '';
  String d3desIcon = '';

  int d4temperature = 0;
  String d4updatedDate = '';
  String d4sunriseTime = '';
  String d4sunsetTime = '';
  int d4feelsLike = 0;
  int d4tempMin = 0;
  int d4tempMax = 0;
  String d4description = '';
  String d4desIcon = '';

  int d5temperature = 0;
  String d5updatedDate = '';
  String d5sunriseTime = '';
  String d5sunsetTime = '';
  int d5feelsLike = 0;
  int d5tempMin = 0;
  int d5tempMax = 0;
  String d5description = '';
  String d5desIcon = '';

  int h1temperature = 0;
  String h1description = '';
  String h1time = '';

  int h2temperature = 0;
  String h2description = '';
  String h2time = '';

  int h3temperature = 0;
  String h3description = '';
  String h3time = '';

  String h1desIcon = '';
  String h2desIcon = '';
  String h3desIcon = '';

  String time = '';

  @override
  void initState() {
    // TODO: implement initState
    search(widget.searchText);
    _locationPermission();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    widget.stream.listen((index) {
      if (index == 0) {
        try {
          _locationPermission();
        } catch (e) {
          getLastKnownPosition();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff030317),
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF3F51B5),
          elevation: 0,
          title: Column(
            children: [
              TextField(
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "sans-serif",
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textInputAction: TextInputAction.go,
                cursorColor: Colors.white,
                decoration: new InputDecoration(
                    border: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                      color: Colors.white,
                    )),
                    hintText: "Enter City Name",
                    hintStyle: new TextStyle(color: Colors.white, fontSize: 10),
                    labelText: "City Name",
                    labelStyle: new TextStyle(
                      color: Colors.white,
                    )),
                onChanged: (value) {
                  setState(() {
                    widget.searchText = value;
                  });
                },
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.white,
                )),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              setState(() {
                search(widget.searchText);
              });
            },
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 255,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              /* Color(0xFF673AB7).withOpacity(1),
                            Color(0xFF7357C2).withOpacity(1),
                            Color(0xFF9575CD).withOpacity(1),
                            Color(0xFFB39DDB).withOpacity(1),*/
                              Color(0xFFE8EAF6),
                              Color(0xFFC5CAE9),
                              Color(0xFFC5CAE9),
                              Color(0xFFE8EAF6),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.25, 0.5, 0.75, 1]
                            /*stops: [0.1, 0.2, 0.4, 0.6, 0.85, 1],*/
                            )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 95, 0, 0),
                          child: Text(
                            cityName + " " + country,
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3F51B5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                time+ " IST",
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3F51B5),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 255),
                    decoration: BoxDecoration(
                      color: Color(0xFF9FA8DA),
                    ),
                  )
                ],
              ),
              WeatherWidget(
                cityName,
                temperature,
                updatedDate,
                sunriseTime,
                sunsetTime,
                dayTime,
                feelsLike,
                tempMin,
                tempMax,
                pressure,
                humidity,
                description,
                desIcon,
                windSpeed,
                windDirection,
                country,
                visibility,
                d2temperature,
                d2updatedDate,
                d2sunriseTime,
                d2sunsetTime,
                d2feelsLike,
                d2tempMin,
                d2tempMax,
                d2description,
                d2desIcon,
                d3temperature,
                d3updatedDate,
                d3sunriseTime,
                d3sunsetTime,
                d3feelsLike,
                d3tempMin,
                d3tempMax,
                d3description,
                d3desIcon,
                d4temperature,
                d4updatedDate,
                d4sunriseTime,
                d4sunsetTime,
                d4feelsLike,
                d4tempMin,
                d4tempMax,
                d4description,
                d4desIcon,
                d5temperature,
                d5updatedDate,
                d5sunriseTime,
                d5sunsetTime,
                d5feelsLike,
                d5tempMin,
                d5tempMax,
                d5description,
                d5desIcon,
                h1temperature,
                h1time,
                h1desIcon,
                h2temperature,
                h2time,
                h2desIcon,
                h3temperature,
                h3time,
                h3desIcon,
              ),
            ],
          ),
        ));
  }

  Future<Position> _locationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Permission.location.request();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Permission.location.request();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      await Permission.location.request();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      getUserLocation(widget.searchText);
    } catch (e) {
      getLastKnownPosition();
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  getUserLocation(String location) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String? location = placemarks[0].subAdministrativeArea;
      widget.searchText = location!;
      search(widget.searchText);
    } catch (err) {
      print("err");
    }
    return true;
  }

  void getLastKnownPosition() async {
    Position? position = await Geolocator.getLastKnownPosition();
    try {
      if (position != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        String? location = placemarks[0].subAdministrativeArea;
        widget.searchText = location!;
        search(widget.searchText);
        print(location);
      }
    } catch (err) {
      print("err");
    }
  }

  void search(String searchText) async {
    WeatherResponse weatherResponse;
    searchText = convertToTitleCase(searchText);
    final response = await DataManagement().getWeather(searchText);
    setState(() {

      final timeFormat = new DateFormat('hh:mm a');

      time = timeFormat.format(DateTime.now());

      weatherResponse = response;
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
      description = weatherResponse.description;
      latitude = weatherResponse.lat;
      longitude = weatherResponse.long;

      desIcon = addDescriptions(description,dayTime);

      description = convertToTitleCase(description);

      if (dayTime == "Night") {
        widget.bgImage = 'assets/images/nightBackground.jpg';
      } else if (dayTime == "Morning") {
        widget.bgImage = 'assets/images/morningBackground.jpg';
      } else if (dayTime == "Afternoon") {
        widget.bgImage = 'assets/images/noonBackground.jpg';
      } else {
        widget.bgImage = 'assets/images/eveningBackground.jpg';
      }
    });

    ForecastingResponse forecastingResponse;
    final forecastResponse =
        await DataManagement().getForecasting(latitude, longitude);
    setState(() {

      forecastingResponse = forecastResponse;

      h1temperature = forecastingResponse.h1temperature;
      String s6description = forecastingResponse.h1description;
      h1desIcon = addDescriptions(s6description,forecastResponse.h1DayTime);
      h1description = convertToTitleCase(s6description);
      h1time = forecastingResponse.h1time;

      h2temperature = forecastingResponse.h2temperature;
      String s7description = forecastingResponse.h2description;
      h2desIcon = addDescriptions(s7description,forecastResponse.h2DayTime);
      h2description = convertToTitleCase(s7description);
      h2time = forecastingResponse.h2time;

      h3temperature = forecastingResponse.h3temperature;
      String s8description = forecastingResponse.h3description;
      h3desIcon = addDescriptions(s8description,forecastResponse.h3DayTime);
      h3description = convertToTitleCase(s8description);
      h3time = forecastingResponse.h3time;
    });

    setState(() {
      forecastingResponse = forecastResponse;

      d2temperature = forecastingResponse.d2temperature;
      String s2description = forecastingResponse.d2description;
      d2desIcon = addDescriptions(s2description, "Morning");
      d2description = convertToTitleCase(s2description);
      d2sunriseTime = forecastingResponse.d2sunriseTime;
      d2sunsetTime = forecastingResponse.d2sunsetTime;
      d2updatedDate = forecastingResponse.d2updatedDate;
      d2feelsLike = forecastingResponse.d2feelsLike;
      d2tempMin = forecastingResponse.d2tempMin;
      d2tempMax = forecastingResponse.d2tempMax;

      d3temperature = forecastingResponse.d3temperature;
      String s3description = forecastingResponse.d3description;
      d3desIcon = addDescriptions(s3description, "Morning");
      d3description = convertToTitleCase(s3description);
      d3sunriseTime = forecastingResponse.d3sunriseTime;
      d3sunsetTime = forecastingResponse.d3sunsetTime;
      d3updatedDate = forecastingResponse.d3updatedDate;
      d3feelsLike = forecastingResponse.d3feelsLike;
      d3tempMin = forecastingResponse.d3tempMin;
      d3tempMax = forecastingResponse.d3tempMax;

      d4temperature = forecastingResponse.d4temperature;
      String s4description = forecastingResponse.d4description;
      d4desIcon = addDescriptions(s4description,"Morning");
      d4description = convertToTitleCase(s4description);
      d4sunriseTime = forecastingResponse.d4sunriseTime;
      d4sunsetTime = forecastingResponse.d4sunsetTime;
      d4updatedDate = forecastingResponse.d4updatedDate;
      d4feelsLike = forecastingResponse.d4feelsLike;
      d4tempMin = forecastingResponse.d4tempMin;
      d4tempMax = forecastingResponse.d4tempMax;

      d5temperature = forecastingResponse.d5temperature;
      String s5description = forecastingResponse.d5description;
      d5desIcon = addDescriptions(s5description, "Morning");
      d5description = convertToTitleCase(s5description);
      d5sunriseTime = forecastingResponse.d5sunriseTime;
      d5sunsetTime = forecastingResponse.d5sunsetTime;
      d5updatedDate = forecastingResponse.d5updatedDate;
      d5feelsLike = forecastingResponse.d5feelsLike;
      d5tempMin = forecastingResponse.d5tempMin;
      d5tempMax = forecastingResponse.d5tempMax;
    });
  }

  String addDescriptions(String weatherDescription, String time) {
    String weatherIcon = '';
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
      "heavy intensity rain",
      "very heavy rain",
      "extreme rain",
      "heavy intensity shower rain",
      "ragged shower rain"
    ];

    List<String> lightRain = [
      "light rain",
      "moderate rain",
      "light intensity shower rain",
      "shower rain"
    ];

    List<String> snow = [
      "light snow",
      "snow",
      "heavy snow",
      "sleet",
      "light shower sleet",
      "shower sleet",
      "light rain and snow",
      "rain and snow",
      "light shower snow",
      "shower snow",
      "Heavy shower snow",
      "freezing rain"
    ];

    List<String> atmosphere = [
      "mist",
      "smoke",
      "haze",
      "sand/ dust whirls",
      "fog",
      "sand",
      "dust",
      "volcanic ash",
      "squalls",
      "tornado"
    ];

    List<String> clear = ['clear sky'];

    List<String> clouds = [
      "few clouds",
      "scattered clouds",
      "broken clouds",
      "overcast clouds"
    ];

    if (thunderstorm.contains(weatherDescription) && time != "Night") {
      weatherIcon = 'assets/images/weather-thunderstorm-day.png';
    } else if (thunderstorm.contains(weatherDescription) &&
        time == "Night") {
      weatherIcon = 'assets/images/weather-thunderstorm-night.png';
    } else if (drizzle.contains(weatherDescription) && time != "Night") {
      weatherIcon = 'assets/images/weather-light-rain.png';
    } else if (drizzle.contains(weatherDescription) && time == "Night") {
      weatherIcon = 'assets/images/weather-light-rain-night.png';
    } else if (clear.contains(weatherDescription) && time != "Night") {
      weatherIcon = 'assets/images/weather-clear.png';
    } else if (clear.contains(weatherDescription) && time == "Night") {
      weatherIcon = 'assets/images/weather-clear-night.png';
    } else if (clouds.contains(weatherDescription)) {
      if (weatherDescription == "few clouds" && time != "Night") {
        weatherIcon = 'assets/images/weather-few-clouds-day.png';
      } else if (weatherDescription == "few clouds" && time == "Night") {
        weatherIcon = 'assets/images/weather-few-clouds-night.png';
      } else if (weatherDescription == "scattered clouds" && time != "Night") {
        weatherIcon = 'assets/images/weather-scattered-day.png';
      }else if (weatherDescription == "scattered clouds" && time == "Night") {
        weatherIcon = 'assets/images/weather-scattered-night.png';
      }
      else if (weatherDescription == "broken clouds" && time != "Night") {
        weatherIcon = 'assets/images/weather-broken-day.png';
      } else if (weatherDescription == "broken clouds" && time == "Night") {
        weatherIcon = 'assets/images/weather-broken-night.png';
      } else if (weatherDescription == "overcast clouds" &&
          time != "Night") {
        weatherIcon = 'assets/images/weather-overcast-clouds.png';
      } else if (weatherDescription == "overcast clouds" &&
          time == "Night") {
        weatherIcon = 'assets/images/weather-overcast-night.png';
      }
    }
    else if (atmosphere.contains(weatherDescription)) {
      weatherIcon = 'assets/images/weather-mist.png';
    } else if (snow.contains(weatherDescription)) {
      weatherIcon = 'assets/images/weather-snow.png';
    } else if (rain.contains(weatherDescription)) {
      weatherIcon = 'assets/images/weather-heavy-rain.png';
    } else if (lightRain.contains(weatherDescription) && time != "Night") {
      weatherIcon = 'assets/images/weather-light-rain.png';
    }else if (lightRain.contains(weatherDescription) && time == "Night") {
      weatherIcon = 'assets/images/weather-light-rain-night.png';
    }

    return weatherIcon;
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

  void toggleIcon(int index) async {
    setState(() {
      controller.forward().then((_) async {
        streamController.add(index);
        await Future.delayed(Duration(seconds: 1));
        controller.reverse();
      });
    });
  }

}
