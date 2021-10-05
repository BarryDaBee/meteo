import 'package:flutter/material.dart';

List<String> life = ['something'];
const Map kDays = {
  1: "Monday",
  2: "Tuesday",
  3: "Wednesday",
  4: "Thursday",
  5: "Friday",
  6: "Saturday",
  7: "Sunday"
};

const Map kMonths = {
  1: "January",
  2: "February",
  3: "March",
  4: "April",
  5: "May",
  6: "June",
  7: "July",
  8: "August",
  9: "September",
  10: "October",
  11: "November",
  12: "December",
};

final DateTime date = DateTime.now();
final kLabelTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 15,
  fontWeight: FontWeight.w300,
);
const kWeatherIconSize = 35.0;
