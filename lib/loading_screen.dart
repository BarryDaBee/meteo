// import 'package:flutter/material.dart';
// import 'location_screen.dart';
// import 'networking.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'dart:math';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// class LoadingScreen extends StatefulWidget {
//   LoadingScreen({this.city});
//   final String city;
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//   double latitude;
//   double longitude;
//   var apiKey = env['API-KEY'];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     getLocationData();
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home: LoadingScreenBody(),
//     );
//   }
// }
//
// class LoadingScreenBody extends StatelessWidget {
//   final Random randomNumber = new Random();
//   final List<Widget> spinKits = [
//     SpinKitWave(
//       color: Colors.white,
//       size: 100.0,
//     ),
//     SpinKitChasingDots(
//       color: Colors.white,
//       size: 100.0,
//     ),
//     SpinKitDoubleBounce(
//       color: Colors.white,
//       size: 100.0,
//     ),
//     SpinKitThreeBounce(
//       color: Colors.white,
//       size: 100.0,
//     ),
//     SpinKitFadingGrid(
//       color: Colors.white,
//       size: 100.0,
//     ),
//     SpinKitDualRing(
//       color: Colors.white,
//       size: 100.0,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: spinKits[randomNumber.nextInt(spinKits.length)],
//       ),
//     );
//   }
// }
