import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'dart:core';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'location_screen.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LocationScreen(),
    );
  }
}

// "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=439d4b804bc8187953eb36d2a8c26a02"
