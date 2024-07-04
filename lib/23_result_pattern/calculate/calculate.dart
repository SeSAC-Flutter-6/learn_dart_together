import 'package:learn_dart_together/23_result_pattern/calculate/result.dart';

enum ErrorType {
  overflow,
  underflow,
  divideByZeroError,
}

final int _max = 9223372036854775807;
final int _min = -9223372036854775808;

class Calculate {
  static Result<int, ErrorType> plus(int a, int b) {
    if (a + b > _max) {
      return Result.error(ErrorType.overflow);
    } else if (a + b < _min) {
      return Result.error(ErrorType.underflow);
    }
    return Result.success(a + b);
  }

  static Result<int, ErrorType> subtract(int a, int b) {
    if (a - b > _max) {
      return Result.error(ErrorType.overflow);
    } else if (a - b < _min) {
      return Result.error(ErrorType.underflow);
    }
    return Result.success(a - b);
  }

  static Result<num, ErrorType> multiply(int a, int b) {
    if (a * b > _max) {
      return Result.error(ErrorType.overflow);
    } else if (a * b < _min) {
      return Result.error(ErrorType.underflow);
    }
    return Result.success(a * b);
  }

  static Result<double, ErrorType> divide(int a, int b) {
    if (b != 0) {
      return Result.success(a / b);
    }
    return Result.error(ErrorType.divideByZeroError);
  }
}

void main() {
  Result<double, ErrorType> result = Calculate.divide(10, 0);
  // result.when(success: success, error: error)
  switch (result) {
    case Success<double, ErrorType>():
      print(result.data);
    case Error<double, ErrorType>():
      {
        switch (result.error) {
          case ErrorType.overflow:
            print('오버플로우');
          case ErrorType.underflow:
            print('언더플로우');
          case ErrorType.divideByZeroError:
            print('0으로 나눌수 없습니다.');
        }
      }
  }
}
