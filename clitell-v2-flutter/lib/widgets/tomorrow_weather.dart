import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TomorrowWeather extends StatelessWidget {
  final int d2temperature;
  final String d2updatedDate;
  final String d2sunriseTime;
  final String d2sunsetTime;
  final int d2feelsLike;
  final int d2tempMin;
  final int d2tempMax;
  final String d2description;
  final String d2desIcon;

  TomorrowWeather(
      this.d2temperature,
      this.d2updatedDate,
      this.d2sunriseTime,
      this.d2sunsetTime,
      this.d2feelsLike,
      this.d2tempMin,
      this.d2tempMax,
      this.d2description,
      this.d2desIcon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
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
                    Colors.black.withOpacity(1),
                    BlendMode.dstATop))
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
                d2description,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                d2desIcon,
                width: 160,
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    d2temperature.toString() + "\u2103",
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
                              "Max " + d2tempMax.toString() + "\u00b0 ",
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
                              "Min  " + d2tempMin.toString() + "\u00b0 ",
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
                "Feels Like " + d2feelsLike.toString() + "\u2103",
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
                    Text(d2sunriseTime + "/" + d2sunsetTime,
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
                  d2updatedDate,
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
    ]);
  }
}
