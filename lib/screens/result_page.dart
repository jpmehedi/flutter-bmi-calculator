import 'package:flutter/material.dart';
import 'package:bmi_calculator/constraint.dart';

import '../materials/large_button.dart';
import '../materials/reuseable_card.dart';
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi calculator".toUpperCase()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Your Result',
              style: kResultTextStyle,
            ),
          ),
          Expanded(
            child: ReuseableCard(
              color: kActiveCardColor,
              cardChild: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Normal".toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "18.2".toUpperCase(),
                      style: kBMItextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "The Quick Brown fox jumps over the lazy dog",
                      textAlign: TextAlign.justify,
                      style: kResultDescriptionTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          LargeButtonBuilder(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Re-Calculate",
          )
        ],
      ),
    );
  }
}
