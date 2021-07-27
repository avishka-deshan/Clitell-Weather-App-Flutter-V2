import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/weather_page.dart';
import 'package:weather_app/search_data.dart';
import 'package:weather_app/widgets/tommorow_weather.dart';

class WeatherWidget extends StatefulWidget {
  final String cityName;
  final int temperature;
  final String updatedDate;
  final String sunriseTime;
  final String sunsetTime;
  final String dayTime;
  final int feelsLike ;
  final int tempMin;
  final int tempMax;
  final int pressure;
  final int humidity;
  final String description;
  final String desIcon;
  final String windSpeed;
  final String windDirection;
  final String country;
  final double visibility;
  final int d2temperature;
  final String d2updatedDate;
  final String d2sunriseTime;
  final String d2sunsetTime;
  final int d2feelsLike;
  final int d2tempMin;
  final int d2tempMax;
  final String d2description;
  final String d2desIcon;

  WeatherWidget(this.cityName, this.temperature, this.updatedDate,
      this.sunriseTime, this.sunsetTime, this.dayTime, this.feelsLike,
      this.tempMin, this.tempMax, this.pressure, this.humidity,
      this.description, this.desIcon, this.windSpeed, this.windDirection,
      this.country, this.visibility, this.d2temperature, this.d2updatedDate,
      this.d2sunriseTime, this.d2sunsetTime, this.d2feelsLike, this.d2tempMin,
      this.d2tempMax, this.d2description, this.d2desIcon);


  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height:550,
              width: MediaQuery.of(context).size.width,
              child:  ListView(
                children: [
                  CarouselSlider(
                    items: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80, right: 0),
                        child: Stack(
                          children: [
                          Container(
                            margin: EdgeInsets.all(23),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.0),
                                topLeft : Radius.circular(50.0),
                                bottomLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF7986CB).withOpacity(1),
                                  Color(0xFF5C6BC0),
                                  Color(0xFF7986CB).withOpacity(1),
                                  Color(0xFF5C6BC0),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.1,0.45,0.9,1],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.description,
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/weather-clear.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.temperature.toString()+"\u2103",
                                        style: GoogleFonts.lato(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/up-arrow.png",
                                                  width: 10,
                                                  height: 20,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Max "+widget.tempMax.toString() + "\u00b0 ",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/down-arrow.png",
                                                  width: 10,
                                                  height: 20,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Min  "+widget.tempMin.toString()+"\u00b0 ",
                                                  style: GoogleFonts.lato(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Feels Like "+widget.feelsLike.toString()+"\u2103",
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/sun-icon.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        Text(widget.sunriseTime + "/"+widget.sunsetTime,
                                            style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                            Padding(
                              padding: const EdgeInsets.only(left: 65),
                              child: Container(
                                height: 35,
                                width:180,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        widget.updatedDate,
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TomorrowWeather(widget.d2temperature, widget.d2updatedDate, widget.d2sunriseTime, widget.d2sunsetTime, widget.d2feelsLike,
                          widget.d2tempMin, widget.d2tempMax, widget.d2description, widget.d2desIcon)
                    ],
                    options: CarouselOptions(
                      height: 480,
                      enlargeCenterPage: false,
                      aspectRatio: 16/10,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.75,
                    )
                    ,
                  )
                ],
              ),
            ),

          ]
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color:Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/wind.png",
                                width: 25,
                                height: 25,
                                color: Color(0xFF3F51B5),
                              ),
                              Text(widget.windSpeed+"km/h " + widget.windDirection ,
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/gauge.png",
                                width: 25,
                                height: 25,
                                color: Color(0xFF3F51B5),
                              ),
                              Text(widget.pressure.toString()+"mb",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/humidity.png",
                                width: 25,
                                height: 25,
                                color: Color(0xFF3F51B5),
                              ),
                              Text(widget.humidity.toString()+"%",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/visibility.png",
                                width: 25,
                                height: 25,
                                color: Color(0xFF3F51B5),
                              ),
                              Text(widget.visibility.toString()+"km",
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
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
