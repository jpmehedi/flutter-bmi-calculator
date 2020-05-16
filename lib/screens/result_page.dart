import 'package:flutter/material.dart';
import 'package:bmi_calculator/constraint.dart';

import '../materials/large_button.dart';
import '../materials/reuseable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.clculateBmi,
      @required this.bmiResult,
      @required this.bmiSummary});

  final String clculateBmi;
  final String bmiResult;
  final String bmiSummary;

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
                      bmiResult.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      clculateBmi,
                      style: kBMItextStyle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      bmiSummary,
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
