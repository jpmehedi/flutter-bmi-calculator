import 'package:flutter/material.dart';
import '../constraint.dart';

class LargeButtonBuilder extends StatelessWidget {
  LargeButtonBuilder({@required this.onTap, @required this.text});
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomButtonHeight,
        width: double.infinity,
        color: kBottomButtonColor,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.teal),
        )),
      ),
    );
  }
}