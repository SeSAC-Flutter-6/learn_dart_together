import 'package:learn_dart_together/20_ressult/practice_1/core/result.dart';

abstract interface class CalRepository {
  Result<int, OperationError> add(int a, int b);
  Result<int, OperationError> subtract(int a, int b);
  Result<int, OperationError> multiply(int a, int b);
  Result<int, OperationError> divide(int a, int b);
}

enum OperationError {
  additionOverflow,
  subtractionOverflow,
  multiplicationOverflow,
  divisionOverflow,
  divisionByZero,
  unknownError,
}
