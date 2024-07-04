import 'package:learn_dart_together/16_result/result.dart';

enum CalculatorError {
  calculationError
}

class Calculator {
  Result<num, CalculatorError> add(num a, num b) {
    return Result.success(a + b);
  }

  Result<num, CalculatorError> subtract(num a, num b) {
    return Result.success(a - b);
  }

  Result<num, CalculatorError> multiply(num a, num b) {
    return Result.success(a * b);
  }

  Result<num, CalculatorError> divide(num a, num b) {
    if ((b == 0) || (a == 0)) {
      return Result.error(CalculatorError.calculationError);
    }
    return Result.success(a / b);
  }
}