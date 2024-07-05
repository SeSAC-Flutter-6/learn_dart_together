import '../core/result.dart';

class Calculator {
  static Result<int, String> add(int x, int y) {
    return Result.success(x + y);
  }

  static Result<int, String> multiply(int x, int y) {
    return Result.success(x * y);
  }

  static Result<int, String> subtract(int x, int y) {
    return Result.success(x - y);
  }

  static Result<num, String> divide(int x, int y) {
    if (x != 0) {
      return Result.success(x / y);
    }
    return Result.error('0으로는 나눌 수 없습니다');
  }
}

void main() {
  Result<num, String> result = Calculator.divide(10, 0);
  switch (result) {
    case Success<num, String>():
      print(result.data);
    case Error<num, String>():
      print(result.error);
  }
}
