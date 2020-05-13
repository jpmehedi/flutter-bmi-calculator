import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './icon_content.dart';
import 'reuseable_card.dart';

const bottomButtonColor = Color(0xFF1EEE555);
const activeCardColor = Color(0xFF155555);
const inactiveCardColor = Color(0xFF1EEE555);
const bottomButtonHeight = 70.0;

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReuseableCard(
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        level: "Male",
                      ),
                      color: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableCard(
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        level: "Female",
                      ),
                      color: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: bottomButtonHeight,
            width: double.infinity,
            color: bottomButtonColor,
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
