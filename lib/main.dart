import 'package:flutter/material.dart';
import 'package:horizons_weather/screen/home_screen.dart'; 
import 'package:horizons_weather/utils/scroll_behavior.dart';

void main() {
  runApp(const HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      home: const HomeScreen(), 
    );
  }
}