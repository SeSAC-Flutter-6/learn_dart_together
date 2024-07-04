import 'package:learn_dart_together/17_result_pattern/core/result.dart';

class Calculator {
  Result<int> add(int a, int b) {
    try {
      int result = a + b;
      if ((a > 0 && b > 0 && result < 0) || (a < 0 && b < 0 && result > 0)) {
        return Result.error('Integer overflow on addition');
      }
      return Result.success(result);
    } catch (e) {
      return Result.error('Error adding $a and $b: $e');
    }
  }

  Result<int> subtract(int a, int b) {
    try {
      int result = a - b;
      if ((a > 0 && b < 0 && result < 0) || (a < 0 && b > 0 && result > 0)) {
        return Result.error('Integer underflow on subtraction');
      }
      return Result.success(result);
    } catch (e) {
      return Result.error('Error subtracting $b from $a: $e');
    }
  }

  Result<int> multiply(int a, int b) {
    try {
      int result = a * b;
      if (a != 0 && result ~/ a != b) {
        return Result.error('Integer overflow on multiplication');
      }
      return Result.success(result);
    } catch (e) {
      return Result.error('Error multiplying $a and $b: $e');
    }
  }

  Result<double> divide(int a, int b) {
    try {
      if (b == 0) {
        return Result.error('Cannot divide by zero');
      }
      return Result.success(a / b);
    } catch (e) {
      return Result.error('Error dividing $a by $b: $e');
    }
  }
}

void main() {
  final calculator = Calculator();

  // Division
  var divideResult = calculator.divide(10, 0);
  switch (divideResult) {
    case Success<double>():
      print('Division result: $divideResult');
      break;
    case Error<double>():
      print('Division error: $divideResult');
      break;
  }
}
