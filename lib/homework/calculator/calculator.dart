import '../core/result.dart';

class Calculator {
  Result<double> add(double a, double b) => Result.success(a + b);

  Result<double> subtract(double a, double b) => Result.success(a - b);

  Result<double> multiply(double a, double b) => Result.success(a * b);

  Result<double> divide(double a, double b) {
    if (b == 0) {
      return Result.error('0으로는 나누기를 할 수 없습니다.');
    }
    return Result.success(a / b);
  }
}

void main() {
  final Calculator calculator = Calculator();
  print(calculator.add(10, 5));
  print(calculator.subtract(10, 5));
  print(calculator.multiply(10, 5));
  print(calculator.divide(10, 5));
  print(calculator.divide(10, 0));
}
