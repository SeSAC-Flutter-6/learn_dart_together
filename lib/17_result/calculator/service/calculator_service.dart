import 'package:learn_dart_together/17_result/calculator/core/result.dart';
import 'package:learn_dart_together/17_result/calculator/exception/exception.dart';

class CalculatorService {
  CalculatorService._singletonConstructor();

  static final CalculatorService _instance =
      CalculatorService._singletonConstructor();

  factory CalculatorService() {
    return _instance;
  }

  static CalculatorService get instance => _instance;

  static Result<num> add(num a, num b) {
    return Result.success(a + b);
  }

  static Result<num> subtract(num a, num b) {
    return Result.success(a - b);
  }

  static Result<num> multiply(num a, num b) {
    return Result.success(a * b);
  }

  // 0으로 나누면 결과는 Infinity가 나와버린다.
  // 과제의 취지에 맞게 고의로 throw를 발생
  static Result<num> divide(num a, num b) {
    try {
      if (b == 0) throw ();

      return Result.success(a / b);
    } catch (e) {
      return Result.error(ErrorList.cannotDivideZero);
    }
  }
}
