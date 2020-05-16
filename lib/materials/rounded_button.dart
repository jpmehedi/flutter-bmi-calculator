import 'package:flutter/material.dart';
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