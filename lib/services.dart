//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'location.dart';
//import 'dart:convert';
//
//const apiKey = "5cbf4c99dc27a7e6d27dd63978ba66dc";
//
//TextEditingController controller = TextEditingController();
//void getLocation() async {
//  Location location = Location();
//  await location.getCurrentLocation();
//}
//
//class Services {
//  Future<void> getLocationData() async {
//    http.Response response = await http.get(url);
//    if (response.statusCode == 200) {
//      String data = response.body;
//      name = await jsonDecode(data)['name'];
//      controller.text = name;
//      temperature = await jsonDecode(data)['main']['temp'];
//      minTemp = await jsonDecode(data)['main']['temp_min'];
//      maxTemp = await jsonDecode(data)['main']['temp_max'];
//      windSpeed = await jsonDecode(data)['wind']['speed'];
//      sunrise = await jsonDecode(data)['sys']['sunrise'];
//      sunset = await jsonDecode(data)['sys']['sunset'];
//      condition = await jsonDecode(data)['weather'][0]['description'];
//      sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
//      sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
//    } else {
//      print(response.statusCode);
//    }
//  }
//}
import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'networking.dart';

var apiKey = env['API-KEY'];
StreamController weatherStream = StreamController();

void getLocationData(city) async {
  NetworkHelper networkHelper = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

  var weatherData = await networkHelper.getData();
  weatherStream.add(weatherData);
}
