import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/data_management.dart';
import 'package:weather_app/weather_response.dart';
import 'package:weather_app/widgets/weather_widget.dart';
import 'package:geolocator/geolocator.dart';

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

class _WeatherPageState extends State<WeatherPage> {

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
  int d2temperature = 0;
  String d2updatedDate = '';
  String d2sunriseTime = '';
  String d2sunsetTime= '';
  int d2feelsLike= 0;
  int d2tempMin = 0;
  int d2tempMax = 0;
  String d2description = '';
  String d2desIcon = '';

  @override
  void initState() {
    // TODO: implement initState
    search(widget.searchText);
    _locationPermission();
    widget.stream.listen((index) {
      if (index == 0) {
        try {
          getUserLocation(widget.searchText);
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height-255,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
                          stops: [0.25,0.5,0.75,1]
                          /*stops: [0.1, 0.2, 0.4, 0.6, 0.85, 1],*/
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: Text(
                            cityName + " " + country,
                            style: GoogleFonts.lato(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                                color: Color(0xFF3F51B5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height-255),
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
                d2desIcon
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

    try{
      getUserLocation(widget.searchText);
    }catch(e){
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
    }catch(err){
      print("err");
    }
    return true;

  }


  void getLastKnownPosition() async{

    Position? position = await Geolocator.getLastKnownPosition();
    try {
      if(position != null){
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        String? location = placemarks[0].subAdministrativeArea;
        widget.searchText = location!;
        search(widget.searchText);
        print(location);
      }

    }catch(err){
      print("err");
    }
  }

  void search(String searchText) async {
    WeatherResponse weatherResponse;
    final response = await DataManagement().getWeather(searchText);
    setState(() {
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
      addDescriptions();

      if(dayTime == "Night"){
        widget.bgImage = 'assets/images/nightBackground.jpg';
      }else if(dayTime =="Morning"){
        widget.bgImage = 'assets/images/morningBackground.jpg';
      }else if(dayTime == "Afternoon"){
        widget.bgImage = 'assets/images/noonBackground.jpg';
      }else{
        widget.bgImage = 'assets/images/eveningBackground.jpg';
      }
    }
    );
  }

  void addDescriptions(){
    List<String> thunderstorm = ["thunderstorm with light rain","thunderstorm with rain", "thunderstorm with heavy rain", "light thunderstorm","thunderstorm",
      'heavy thunderstorm', "ragged thunderstorm","thunderstorm with light drizzle","thunderstorm with drizzle","thunderstorm with heavy drizzle"];

    List<String> drizzle = ["light intensity drizzle", "drizzle", "heavy intensity drizzle", "light intensity drizzle rain", "drizzle rain", "heavy intensity drizzle rain",
      "shower rain and drizzle","heavy shower rain and drizzle","shower drizzle"];

    List<String> rain = ["light rain", "moderate rain", "heavy intensity rain", "very heavy rain", "extreme rain", "light intensity shower rain", "shower rain",
      "heavy intensity shower rain", "ragged shower rain"];

    List<String> snow = ["light snow", "Snow", "Heavy snow", "Sleet", "Light shower sleet", "Shower sleet", "Light rain and snow", "Rain and snow", "Light shower snow", "Shower snow"
      ,"Heavy shower snow","freezing rain"];

    List<String> atmosphere = ["mist", "Smoke", "Haze", "sand/ dust whirls", "fog", "sand", "dust", "volcanic ash", "squalls", "tornado"];

    List<String> clear = ['Clear'];

    List<String> clouds = ["few clouds", "scattered clouds", "broken clouds", "overcast clouds"];

    if(thunderstorm.contains(description)){
      desIcon = 'assets/images/thunderstorm.png';
    }
    else if(drizzle.contains(description)){
      desIcon = 'assets/images/shower-rain-day.png';
    }
    else if(clear.contains(description)){
      desIcon = 'assets/images/clear-sky.jpg';
    }
    else if(clouds.contains(description)){
      if(description == "few clouds"){
        desIcon = 'assets/images/few-clouds-day.png';
      }
      else if(description == "scattered clouds"){
        desIcon = 'assets/images/scattered-clouds.png';
      }
      else if(description == "broken clouds" && dayTime != "Night" ){
        desIcon = 'assets/images/few-clouds-day.png';
      }
      else if(description == "broken clouds" && dayTime == "Night" ){
        desIcon = 'assets/images/few-clouds-night.png';
      }
      else if(description == "overcast clouds" && dayTime != "Night"){
        desIcon = 'assets/images/few-clouds-day.png';
      }
      else if(description == "overcast clouds" && dayTime == "Night"){
        desIcon = 'assets/images/few-clouds-night.png';
      }
    }
    else if(atmosphere.contains(description)){
      desIcon = 'assets/images/mist.png';
    }
    else if(snow.contains(description)){
      desIcon = 'assets/images/snow.png';
    }
    else if(rain.contains(description)){
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

}

