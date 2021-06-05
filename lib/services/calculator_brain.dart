import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  CalculatorBrain({required this.weight, required this.height});

  var bmi;
  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'You have a higher than a normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have lower than the normal body weight. You can eat a bit more.';
    }
  }
}
