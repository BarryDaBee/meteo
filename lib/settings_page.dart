//import 'package:flutter/material.dart';
//import 'package:flutter_weather_icons/flutter_weather_icons.dart';
//
//class SettingsPage extends StatefulWidget {
//  @override
//  _SettingsPageState createState() => _SettingsPageState();
//}
//
//enum AppThemeMode {
//  dark,
//  light,
//}
//
//class _SettingsPageState extends State<SettingsPage> {
//  AppThemeMode _currentTheme = AppThemeMode.dark;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Settings"),
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            ListTile(
//              title: Text("Empty"),
//              leading: Icon(WeatherIcons.wiMoonAltWaningCrescent4),
//            ),
//            RadioListTile(
//              controlAffinity: ListTileControlAffinity.trailing,
//              title: Text("Dark"),
//              value: AppThemeMode.dark,
//              groupValue: _currentTheme,
//              onChanged: (AppThemeMode newTheme) {
//                setState(() {
//                  _currentTheme = newTheme;
//                });
//              },
//            ),
//            RadioListTile(
//              controlAffinity: ListTileControlAffinity.trailing,
//              title: Text("Light"),
//              value: AppThemeMode.light,
//              groupValue: _currentTheme,
//              onChanged: (AppThemeMode newTheme) {
//                setState(() {
//                  _currentTheme = newTheme;
//                });
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
