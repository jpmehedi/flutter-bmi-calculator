import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './icon_content.dart';
import './reuseable_card.dart';
import './constraint.dart';

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
          Container(
            height: kBottomButtonHeight,
            width: double.infinity,
            color: kBottomButtonColor,
            child: Center(
                child: Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            )),
          )
        ],
      ),
    );
  }
}

class RoundedButtonBuilder extends StatelessWidget {
  RoundedButtonBuilder({@required this.onPres, this.icon});
  final Function onPres;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      fillColor: Colors.teal,
      onPressed: onPres,
      constraints: BoxConstraints(
        minHeight: 40.0,
        minWidth: 40.0,
      ),
      child: icon,
    );
  }
}
