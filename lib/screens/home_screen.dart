import 'package:clearsky/component/five_days_forecast_box.dart';
import 'package:clearsky/component/forecast_box.dart';
import 'package:clearsky/component/today_weather_box.dart';
import 'package:clearsky/component/weatherbox.dart';
import 'package:clearsky/models/weathAlt.dart';

import 'package:clearsky/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApi client = WeatherApi();
  WeatherAlt? data;
  String? city;

  void getCity() async {
    if (city == null) {
      city = "abuja";
    }
  }
  // Future<void> getLocation() async {
  //   final position = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   final coordinates = new Coordinates(position.latitude, position.longitude);
  //   final weather = await client.getWeather(coordinates);
  //   setState(() {
  //     data = weather;
  //     city = weather.name;
  //   });
  // }

  Future<void> getWeather() async {
    data = await client.getCurrentWeather("abuja");
  }

  String formatDate(DateTime dateCreated) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateCreated);
  }

  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(112, 71, 235, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(
                            126,
                            89,
                            237,
                            1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Lagos, Nigeria",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          126,
                          89,
                          237,
                          1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              FutureBuilder(
                  future: getWeather(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return WeatherBox(
                        title: "Today",
                        date: formatDate(DateTime.now()),
                        image: "images/sun.png",
                        temp: "${data!.main.temp}°C",
                        location: "${data!.name}, ${data!.sys.country}",
                        time: TimeOfDay.now().format(context),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Forecast(
                                          iconColor:
                                              Color.fromRGBO(118, 89, 237, 1),
                                          textColor:
                                              Color.fromRGBO(118, 89, 237, 1),
                                          color: Color.fromRGBO(
                                            242,
                                            237,
                                            253,
                                            1,
                                          ),
                                          icon: Icons.arrow_downward,
                                          text: "Forecast report"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Today",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TodayWeatherBox(
                                        temp: "25°C",
                                        icon: Icons.wb_sunny,
                                        time: "2:00 pm"),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Next forecast",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Center(
                                                child: Text(
                                              "Five Days",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                118,
                                                89,
                                                237,
                                                1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    NewForecastBox(
                                        temp: "25°C",
                                        icon: Icons.wb_sunny_rounded,
                                        date: "April 5"),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                  ],
                                )),
                          );
                        });
                  });
                },
                child: Forecast(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    color: Color.fromRGBO(118, 89, 237, 1),
                    text: "Forecast report",
                    icon: Icons.arrow_drop_up_rounded),
              )
            ],
          ),
        ));
  }
}
