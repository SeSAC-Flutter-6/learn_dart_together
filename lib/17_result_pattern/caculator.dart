import 'package:learn_dart_together/17_result_pattern/core/result.dart';

class Calculator {
  Result<num, String> add(num a, num b) {
    try {
      num result = a + b;
      if ((a > 0 && b > 0 && result < 0) || (a < 0 && b < 0 && result > 0)) {
        return const Result.error('add(): Integer overflow');
      }
      return Result.success(result);
    } catch (e) {
      return Result.error('Error $a + $b: $e');
    }
  }

  Result<num, String> subtract(num a, num b) {
    try {
      num result = a - b;
      if ((a > 0 && b < 0 && result < 0) || (a < 0 && b > 0 && result > 0)) {
        return const Result.error('subtract(): Integer underflow');
      }
      return Result.success(result);
    } catch (e) {
      return Result.error('Error $a - $b: $e');
    }
  }

  Result<num, String> multiply(num a, num b) {
    try {
      num result = a * b;
      if (a != 0 && result ~/ a != b) {
        return const Result.error('multiply(): Integer overflow');
      }
      return Result.success(result);
    } catch (e) {
      return Result.error('Error $a * $b: $e');
    }
  }

  Result<num, String> divide(num a, num b) {
    try {
      if (b == 0) {
        return const Result.error('Cannot divide by zero');
      }
      return Result.success(a / b);
    } catch (e) {
      return Result.error('Error $a / $b: $e');
    }
  }
}