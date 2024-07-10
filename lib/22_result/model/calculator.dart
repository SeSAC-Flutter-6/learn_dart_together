import 'dart:math';
import 'package:learn_dart_together/22_result/core/result.dart';

class Calculator {
  Result<double, String> add(double a, double b) {
    return Result.success(a + b);
  }

  Result<double, String> subtract(double a, double b) {
    return Result.success(a - b);
  }

  Result<double, String> multiply(double a, double b) {
    return Result.success(a * b);
  }

  Result<double, String> divide(double a, double b) {
    if (b == 0) {
      return Result.error('Division by zero');
    }
    return Result.success(a / b);
  }

  Result<double, String> squareRoot(double a) {
    if (a < 0) {
      return Result.error('Square root of negative number');
    }
    return Result.success(sqrt(a));
  }
}

void main() {
  Calculator calculator = Calculator();

  Result<double, String> result = calculator.divide(10, 0);


}