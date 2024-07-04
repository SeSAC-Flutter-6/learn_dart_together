import 'dart:math';

import 'package:learn_dart_together/20_result/practice_01/core/result.dart';

class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiple(double a, double b) {
    return a * b;
  }

  Result<double> divide(double a, double b) {
    if (b == 0) {
      return Result.error(Exception('값을 0으로 나눌 수 없습니다.'));
    }
    return Result.success(a / b);
  }
}

void main() {
  Calculator calculator = Calculator();
  var result = calculator.divide(3, 0);
  switch (result) {
    //result내에는 Success와 Error로만 강제되니까 switch문을 써서 분기를 나눌수 있다.
    case Success<double>():
      print('성공: ${result.data.toString()}');
    case Error<double>():
      print('실패 : ${result.e.toString()}');
  }
}
