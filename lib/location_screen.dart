import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services.dart';
import 'constants.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  ThemeData appTheme = ThemeData.dark();
  Color themeButtonSplashColor = Colors.white;
  Color themeButtonColor = Colors.white;

  final Random randomNumber = new Random();
  final List<Widget> spinKits = [
    SpinKitWave(
      color: Colors.white,
      size: 100.0,
    ),
    SpinKitChasingDots(
      color: Colors.white,
      size: 100.0,
    ),
    SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
    ),
    SpinKitThreeBounce(
      color: Colors.white,
      size: 100.0,
    ),
    SpinKitFadingGrid(
      color: Colors.white,
      size: 100.0,
    ),
    SpinKitDualRing(
      color: Colors.white,
      size: 100.0,
    ),
  ];

  @override
  void initState() {
    getLocationData('Lagos');
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant LocationScreen oldWidget) {
  //   getLocationData(cityController.value.text);
  //   // setState(() {});
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "${kDays[date.weekday]}, ${date.day} ${kMonths[date.month]}, ${date.year}",
            style: kLabelTextStyle.copyWith(letterSpacing: 2),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.brightness_3),
              splashColor: themeButtonSplashColor,
              color: themeButtonColor,
              onPressed: () {
                setState(() {
                  if (appTheme == ThemeData.dark()) {
                    appTheme = ThemeData.light();
                    themeButtonSplashColor = Colors.grey;
                  } else {
                    appTheme = ThemeData.dark();
                    themeButtonSplashColor = Colors.white;
                  }
                });
              },
            ),
          ],
        ),

        body: StreamBuilder(
            stream: weatherStream.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: spinKits[randomNumber.nextInt(spinKits.length)],
                );
              }
              updateUI(snapshot.data);

              return Container(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        controller: cityController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Enter your City name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          letterSpacing: 3,
                        ),
                        onSubmitted: (city) {
                          //print(weatherIcon.toString());

                          print(snapshot.hasData);
                          getLocationData(cityController.value.text);

                          // setState(() {});
                        },
                        onTap: () {
                          print(
                              snapshot.connectionState == ConnectionState.done);
                          print('hr');
                        },
                      ),
                      SizedBox(height: 15),
                      Text(
                        '$description'.toUpperCase(),
                        style: kLabelTextStyle.copyWith(
                          letterSpacing: 3,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Icon(
                        getWeatherIcon(snapshot.data),
                        size: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${(temperature ?? 40).round()}°',
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.w200),
                      ),
                      SizedBox(height: 20),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  'min',
                                  style: kLabelTextStyle.copyWith(
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '$minTemp°',
                                ),
                              ],
                            ),
                            VerticalDivider(
                              width: 40,
                              thickness: 1.0,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  'max',
                                  style: kLabelTextStyle.copyWith(
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '$maxTemp°',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        thickness: 1.0,
                        height: 1,
                      ),
                      SizedBox(height: 20),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    WeatherIcons.wiWindy,
                                    size: kWeatherIconSize,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'wind speed',
                                    style: kLabelTextStyle,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('$windSpeed m/s'),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1.0,
                              width: 1,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    WeatherIcons.wiSunrise,
                                    size: kWeatherIconSize,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'sunrise',
                                    style: kLabelTextStyle,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      '${sunriseTime.hour}:${sunriseTime.minute}'),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1.0,
                              width: 1,
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      WeatherIcons.wiSunset,
                                      size: kWeatherIconSize,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'sunset',
                                    style: kLabelTextStyle,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      '${sunsetTime.hour}:${sunsetTime.minute}'),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1.0,
                              width: 1,
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    WeatherIcons.wiHumidity,
                                    size: kWeatherIconSize,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'humidity',
                                    style: kLabelTextStyle,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('$humidity%'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  TextEditingController cityController = TextEditingController();
  String cityName;
  var temperature;
  var minTemp;
  var maxTemp;
  String description;
  var windSpeed;
  int sunrise;
  int sunset;
  DateTime sunriseTime;
  DateTime sunsetTime;
  var latitude;
  var longitude;
  var humidity;
  IconData weatherIcon;

  IconData getWeatherIcon(weatherData) {
    if (weatherData != null) {
      int weatherCode = weatherData['weather'][0]['id'];
      if (weatherCode < 300) {
        //thunderstorm
        return WeatherIcons.wiThunderstorm;
      } else if (weatherCode < 500) {
        //drizzle
        return WeatherIcons.wiRaindrops;
      } else if (weatherCode < 600) {
        //rain
        return WeatherIcons.wiRain;
      } else if (weatherCode < 700) {
        //snow
        return WeatherIcons.wiSnow;
      } else if (weatherCode < 800) {
        //atmosphere/fog
        return WeatherIcons.wiFog;
      } else if (weatherCode == 800) {
        //clear sky
        return WeatherIcons.wiDaySunny;
      } else if (weatherCode > 800) {
        //cloudy
        return WeatherIcons.wiCloudy;
      } else {
        return WeatherIcons.wiSnowflakeCold;
      }
    } else {
      return WeatherIcons.wiSnowflakeCold;
    }
  }

  void updateUI(dynamic weatherData) {
    if (weatherData != null) {
      temperature = weatherData['main']['temp'];
      description = weatherData['weather'][0]['description'];
      cityName = weatherData['name'];
      cityController.text = cityName;
      minTemp = weatherData['main']['temp_min'];
      maxTemp = weatherData['main']['temp_max'];
      windSpeed = weatherData['wind']['speed'];
      sunrise = weatherData['sys']['sunrise'];
      sunset = weatherData['sys']['sunset'];
      humidity = weatherData['main']['humidity'];
      sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
      sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    } else {
      temperature = 0;
      description = 'unknown location';
      minTemp = 0;
      maxTemp = 0;
      windSpeed = 0.0;
      sunrise = 0;
      sunset = 0;
      humidity = 0;
      sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
      sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    }
    //setState(() {});
  }
}
/*
200 thunderstorm with light rain
201 thunderstorm with rain
202 thunderstorm with heavy rain
210 light thunderstorm
211 thunderstorm
212 heavy thunderstorm
221 ragged thunderstorm
230 thunderstorm with light drizzle
231 thunderstorm with drizzle
232 thunderstorm with heavy drizzle
300 light intensity drizzle
301 drizzle
302 heavy intensity drizzle
310 light intensity drizzle rain
311 drizzle rain
312 heavy intensity drizzle
314 heavy shower rain and drizzle;
321 shower drizzle

 */
