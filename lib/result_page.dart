import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi calculator".toUpperCase()),
      ),
      body: Center(
        child: Text(
          "Hello Navigator"
        ),
      ),
    );
  }
}
