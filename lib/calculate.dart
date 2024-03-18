import 'dart:math';


class CalculateBmi {
  CalculateBmi({required this.height, required this.weight,this.bmi});
  final int height;
  final int weight;

  double? bmi;

  String calulate() {
    bmi = weight / pow(height / 100, 2);
    print(bmi);
    return bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi! >= 25) {
      return 'Overweight';
    } else if (bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getComment() {
    if (bmi! >= 25) {
      return 'You have higher than normal weight\nPlease excercie more often.';
    } else if (bmi! >= 18.5) {
      return 'Awesome! You have a healthy body. Stay happy.';
    } else {
      return 'You have lower than normal weight\nPlease eat well.';
    }
  }
}