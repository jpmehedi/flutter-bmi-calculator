import 'package:flutter/material.dart';
import '../constraint.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.level});
  final IconData icon;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.teal,
          size: 70,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          level,
          style: kLevelTextStyle,
        )
      ],
    );
  }
}
