import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constraint.dart';
import '../materials/reuseable_card.dart';
import '../materials/icon_content.dart';
import '../materials/large_button.dart';
import '../materials/rounded_button.dart';
import '../screens/result_page.dart';
import '../bmi_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      level: "Male",
                    ),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      level: "Female",
                    ),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: kLevelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLevelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFF1EEE555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 16.0),
                        overlayColor: Color(0x291EEE555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 32.0),
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.orange),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double changeValue) {
                        setState(() {
                          height = changeValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          "Weight",
                          style: kLevelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButtonBuilder(
                              onPres: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButtonBuilder(
                              onPres: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.plus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          "Age",
                          style: kLevelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButtonBuilder(
                              onPres: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButtonBuilder(
                              onPres: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icon(FontAwesomeIcons.plus),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          LargeButtonBuilder(
            text: "Calculate",
            onTap: () {
              BmiBrain _calc = BmiBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    clculateBmi: _calc.clculateBmi(),
                    bmiResult: _calc.bmiResult(),
                    bmiSummary: _calc.bmiSummary(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
