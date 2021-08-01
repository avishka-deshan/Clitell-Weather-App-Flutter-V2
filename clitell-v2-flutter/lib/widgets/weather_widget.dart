import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/widgets/day3_weather.dart';
import 'package:weather_app/widgets/tomorrow_weather.dart';

import 'day4_weather.dart';
import 'day5_weather.dart';

class WeatherWidget extends StatefulWidget {
  final String cityName;
  final int temperature;
  final String updatedDate;
  final String sunriseTime;
  final String sunsetTime;
  final String dayTime;
  final int feelsLike;

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

  final int d3temperature;
  final String d3updatedDate;
  final String d3sunriseTime;
  final String d3sunsetTime;
  final int d3feelsLike;
  final int d3tempMin;
  final int d3tempMax;
  final String d3description;
  final String d3desIcon;

  final int d4temperature;
  final String d4updatedDate;
  final String d4sunriseTime;
  final String d4sunsetTime;
  final int d4feelsLike;
  final int d4tempMin;
  final int d4tempMax;
  final String d4description;
  final String d4desIcon;

  final int d5temperature;
  final String d5updatedDate;
  final String d5sunriseTime;
  final String d5sunsetTime;
  final int d5feelsLike;
  final int d5tempMin;
  final int d5tempMax;
  final String d5description;
  final String d5desIcon;

  final int h0temperature;
  final String h0description;
  final String h0time;

  final int h1temperature;
  final String h1description;
  final String h1time;

  final int h2temperature;
  final String h2description;
  final String h2time;

  final int h3temperature;
  final String h3description;
  final String h3time;

  final int h4temperature;
  final String h4description;
  final String h4time;

  final int h5temperature;
  final String h5description;
  final String h5time;

  final int h6temperature;
  final String h6description;
  final String h6time;

  final int h7temperature;
  final String h7description;
  final String h7time;

  final int h8temperature;
  final String h8description;
  final String h8time;

  final String h0desIcon;
  final String h1desIcon;
  final String h2desIcon;
  final String h3desIcon;
  final String h4desIcon;
  final String h5desIcon;
  final String h6desIcon;
  final String h7desIcon;
  final String h8desIcon;

  WeatherWidget(
      this.cityName,
      this.temperature,
      this.updatedDate,
      this.sunriseTime,
      this.sunsetTime,
      this.dayTime,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.description,
      this.desIcon,
      this.windSpeed,
      this.windDirection,
      this.country,
      this.visibility,
      this.d2temperature,
      this.d2updatedDate,
      this.d2sunriseTime,
      this.d2sunsetTime,
      this.d2feelsLike,
      this.d2tempMin,
      this.d2tempMax,
      this.d2description,
      this.d2desIcon,
      this.d3temperature,
      this.d3updatedDate,
      this.d3sunriseTime,
      this.d3sunsetTime,
      this.d3feelsLike,
      this.d3tempMin,
      this.d3tempMax,
      this.d3description,
      this.d3desIcon,
      this.d4temperature,
      this.d4updatedDate,
      this.d4sunriseTime,
      this.d4sunsetTime,
      this.d4feelsLike,
      this.d4tempMin,
      this.d4tempMax,
      this.d4description,
      this.d4desIcon,
      this.d5temperature,
      this.d5updatedDate,
      this.d5sunriseTime,
      this.d5sunsetTime,
      this.d5feelsLike,
      this.d5tempMin,
      this.d5tempMax,
      this.d5description,
      this.d5desIcon,
      this.h0temperature,
      this.h0description,
      this.h0time,
      this.h1temperature,
      this.h1description,
      this.h1time,
      this.h2temperature,
      this.h2description,
      this.h2time,
      this.h3temperature,
      this.h3description,
      this.h3time,
      this.h4temperature,
      this.h4description,
      this.h4time,
      this.h5temperature,
      this.h5description,
      this.h5time,
      this.h6temperature,
      this.h6description,
      this.h6time,
      this.h7temperature,
      this.h7description,
      this.h7time,
      this.h8temperature,
      this.h8description,
      this.h8time,
      this.h0desIcon,
      this.h1desIcon,
      this.h2desIcon,
      this.h3desIcon,
      this.h4desIcon,
      this.h5desIcon,
      this.h6desIcon,
      this.h7desIcon,
      this.h8desIcon);

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
    return Column(children: [
      CarouselSlider(
        items: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(23),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/purple-sky.jpg",
                        ),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(1), BlendMode.dstATop))
                    /*gradient: LinearGradient(
                      colors: [
                        Color(0xFF5C6BC0),
                        Color(0xFF3F51B5),
                        Color(0xFF3949AB),
                        Color(0xFF3F51B5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.45, 0.9, 1],
                    ),*/
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
                        widget.desIcon,
                        width: 160,
                        height: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.temperature.toString() + "\u2103",
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
                                      "Max " +
                                          widget.tempMax.toString() +
                                          "\u00b0 ",
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
                                      "Min  " +
                                          widget.tempMin.toString() +
                                          "\u00b0 ",
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
                        "Feels Like " + widget.feelsLike.toString() + "\u2103",
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
                            Text(widget.sunriseTime + "/" + widget.sunsetTime,
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
                  width: 180,
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
          TomorrowWeather(
              widget.d2temperature,
              widget.d2updatedDate,
              widget.d2sunriseTime,
              widget.d2sunsetTime,
              widget.d2feelsLike,
              widget.d2tempMin,
              widget.d2tempMax,
              widget.d2description,
              widget.d2desIcon),
          Day3Weather(
              widget.d3temperature,
              widget.d3updatedDate,
              widget.d3sunriseTime,
              widget.d3sunsetTime,
              widget.d3feelsLike,
              widget.d3tempMin,
              widget.d3tempMax,
              widget.d3description,
              widget.d3desIcon),
          Day4Weather(
              widget.d4temperature,
              widget.d4updatedDate,
              widget.d4sunriseTime,
              widget.d4sunsetTime,
              widget.d4feelsLike,
              widget.d4tempMin,
              widget.d4tempMax,
              widget.d4description,
              widget.d4desIcon),
          Day5Weather(
              widget.d5temperature,
              widget.d5updatedDate,
              widget.d5sunriseTime,
              widget.d5sunsetTime,
              widget.d5feelsLike,
              widget.d5tempMin,
              widget.d5tempMax,
              widget.d5description,
              widget.d5desIcon)
        ],
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: false,
          aspectRatio: 16 / 9,
          autoPlay: false,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          viewportFraction: 0.75,
        ),
      ),
      Column(
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
                  color: Colors.white,
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
                          Text(
                              widget.windSpeed +
                                  "km/h " +
                                  widget.windDirection,
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
                          Text(widget.pressure.toString() + "mb",
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
                          Text(widget.humidity.toString() + "%",
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
                          Text(widget.visibility.toString() + "km",
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
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CarouselSlider(
          items: [
            Stack(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/water-drops.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                  )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h0time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0D47A1),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h0desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h0temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0D47A1),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h1time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h1desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h1temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h2time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h2desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h2temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h3time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h3desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h3temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h4time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h4desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h4temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h5time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h5desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h5temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h6time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h6desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h6temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h7time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h7desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h7temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/water-drops.jpg",
                                ),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(widget.h8time,
                                    style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3F51B5),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Image.asset(
                                  widget.h8desIcon,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Text(widget.h8temperature.toString() + "\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F51B5),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
          options: CarouselOptions(
            height: 150,
            enlargeCenterPage: false,
            autoPlay: false,
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            enableInfiniteScroll: true,
            viewportFraction: 0.88,
            autoPlayAnimationDuration: Duration(milliseconds: 1500),
          ),
        ),
      ),
    ]);
  }

  void toggleIcon(int index) {
    setState(() {
      streamController.add(index);
    });
  }
}
