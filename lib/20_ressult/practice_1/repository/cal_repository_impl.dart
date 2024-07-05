import 'package:learn_dart_together/20_ressult/practice_1/core/result.dart';
import 'package:learn_dart_together/20_ressult/practice_1/repository/cal_repository.dart';

const int intMaxValue = 9223372036854775807;
const int intMinValue = -9223372036854775808;

class CalRepositoryImpl implements CalRepository {
  @override
  Result<int, OperationError> add(int a, int b) {
    try {
      if ((b > 0 && a > intMaxValue - b) || (b < 0 && a < intMinValue - b)) {
        return Result.error(OperationError.additionOverflow);
      }
      return Result.success(a + b);
    } catch (e) {
      return Result.error(OperationError.unknownError);
    }
  }

  @override
  Result<int, OperationError> subtract(int a, int b) {
    try {
      if ((b > 0 && a < intMinValue + b) || (b < 0 && a > intMaxValue + b)) {
        return Result.error(OperationError.subtractionOverflow);
      }
      return Result.success(a - b);
    } catch (e) {
      return Result.error(OperationError.unknownError);
    }
  }

  @override
  Result<int, OperationError> multiply(int a, int b) {
    try {
      if (a * b > intMaxValue || a * b < intMinValue) {
        return Result.error(OperationError.multiplicationOverflow);
      }
      return Result.success(a * b);
    } catch (e) {
      return Result.error(OperationError.unknownError);
    }
  }

  @override
  Result<int, OperationError> divide(int a, int b) {
    try {
      if (b == 0) {
        return Result.error(OperationError.divisionByZero);
      }
      if (a / b < intMinValue || a / b > intMaxValue) {
        return Result.error(OperationError.divisionOverflow);
      }
      return Result.success(a ~/ b);
    } catch (e) {
      return Result.error(OperationError.unknownError);
    }
  }
}
