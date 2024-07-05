import 'package:learn_dart_together/20_result/practice_01/core/result.dart';

class Calculator {
  Result<double> add(double a, double b) {
    return Result.success(a + b);
  }

  Result<double> subtract(double a, double b) {
    return Result.success(a - b);
  }

  Result<double> multiple(double a, double b) {
    return Result.success(a * b);
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
  var divede = calculator.divide(3, 0);
  switch (divede) {
    //result내에는 Success와 Error로만 강제되니까 switch문을 써서 분기를 나눌수 있다.
    case Success<double>():
      print('성공: ${divede.data.toString()}');
    case Error<double>():
      print('실패 : ${divede.e}');
  }
  var add = calculator.add(3, 12);
  switch (add) {
    case Success<double>():
      print('성공: ${add.data.toString()}');
    case Error<double>():
      print('실패 : ${add.e}');
  }
  var subtract = calculator.subtract(3, 0);
  switch (subtract) {
    case Success<double>():
      print('성공: ${subtract.data.toString()}');
    case Error<double>():
      print('실패 : ${subtract.e}');
  }
  var multiple = calculator.multiple(7, 8);
  switch (multiple) {
    case Success<double>():
      print('성공: ${multiple.data.toString()}');
    case Error<double>():
      print('실패 : ${multiple.e}');
  }
}
