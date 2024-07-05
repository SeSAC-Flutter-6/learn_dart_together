import 'dart:math';
import 'package:test/test.dart';
import 'package:learn_dart_together/22_result/model/calculator.dart';
import 'package:learn_dart_together/22_result/core/result.dart';

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  group('Calculator', () {
    test('Addition', () {
      var result = calculator.add(5, 3);
      expect(result, equals(Result.success(8.0)));
    });

    test('Subtraction', () {
      var result = calculator.subtract(5, 3);
      expect(result, equals(Result.success(2.0)));
    });

    test('Multiplication', () {
      var result = calculator.multiply(5, 3);
      expect(result, equals(Result.success(15.0)));
    });

    test('Division', () {
      var result = calculator.divide(10, 2);
      expect(result, equals(Result.success(5.0)));
    });

    test('Division by zero', () {
      var result = calculator.divide(10, 0);
      expect(result, equals(Result.error('Division by zero')));
    });

    test('Square root', () {
      var result = calculator.squareRoot(25);
      expect(result, equals(Result.success(5.0)));
    });

    test('Square root of negative number', () {
      var result = calculator.squareRoot(-25);
      expect(result, equals(Result.error('Square root of negative number')));
    });
  });
}
