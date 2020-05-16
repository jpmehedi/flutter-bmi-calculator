import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String clculateBmi() {
   _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 27.5) {
      return 'Over Weight';
    } else if (_bmi >= 25 ) {
      return 'Moderate Risk';
    }else if (_bmi > 18.5) {
      return 'Nrormal';
    } else {
      return 'Under Weight';
    }
  }

  String bmiSummary() {
   if (_bmi >= 27.5) {
      return 'High risk of developing heart disease, high blood pressure, stroke, diabetes';
    } else if (_bmi >= 25 ) {
      return 'Moderate risk of developing heart disease, high blood pressure, stroke, diabete';
    }else if (_bmi > 18.5) {
      return 'Low Risk (healthy range)';
    } else {
      return 'Risk of developing problems such as nutritional deficiency and osteoporosis';
    }
  }
}