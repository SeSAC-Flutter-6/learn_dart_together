import 'package:learn_dart_together/19_result/core/result.dart';

enum RangeError {
  overflow,
  underflow,
  divisionByZero,
}

typedef DoubleResult = Result<double, RangeError>;

class Calculator {
  static DoubleResult _getResult(double n) {
    if (n > double.infinity) return Result.error(RangeError.overflow);
    if (n < -double.infinity) return Result.error(RangeError.underflow);
    return Result.success(n);
  }

  static DoubleResult add(double a, double b) {
    return _getResult(a + b);
  }

  static DoubleResult subtract(double a, double b) {
    return _getResult(a - b);
  }

  static DoubleResult multiply(double a, double b) {
    return _getResult(a * b);
  }

  static DoubleResult divide(double a, double b) {
    return b == 0 ? Result.error(RangeError.divisionByZero) : _getResult(a / b);
  }
}
