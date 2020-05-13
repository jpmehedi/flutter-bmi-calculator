import 'package:flutter/material.dart';
import './input_page.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.teal, scaffoldBackgroundColor: Colors.teal),
      home: InputPage(),
    );
  }
}

