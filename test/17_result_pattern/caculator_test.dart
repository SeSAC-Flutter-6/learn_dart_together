import 'dart:math';
import 'package:learn_dart_together/17_result_pattern/caculator.dart';
import 'package:learn_dart_together/17_result_pattern/core/result.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator test', () {
    final calculator = Calculator();

    test('add() success', () {
      final result = calculator.add(5, 3);
      expect(result, isA<Success<num, String>>());
      expect((result as Success<num, String>).data, 8);
    });

    test('add() overflow', () {
      num maxInt = pow(2, 63) - 1;
      final result = calculator.add(maxInt, 1);
      expect(result, isA<Error<num, String>>());
      expect((result as Error<num, String>).error, 'add(): Integer overflow');
    });

    test('subtract() success', () {
      final result = calculator.subtract(5, 3);
      expect(result, isA<Success<num, String>>());
      expect((result as Success<num, String>).data, 2);
    });

    test('subtract() underflow', () {
      num minInt = -pow(2, 63);
      final result = calculator.subtract(minInt, 1);
      expect(result, isA<Error<num, String>>());
      expect((result as Error<num, String>).error, 'subtract(): Integer underflow');
    });

    test('multiply() success', () {
      final result = calculator.multiply(5, 3);
      expect(result, isA<Success<num, String>>());
      expect((result as Success<num, String>).data, 15);
    });

    test('multiply() overflow', () {
      num maxInt = pow(2, 63) - 1;
      final result = calculator.multiply(maxInt, 2);
      expect(result, isA<Error<num, String>>());
      expect((result as Error<num, String>).error, 'multiply(): Integer overflow');
    });

    test('divide() success', () {
      final result = calculator.divide(6, 3);
      expect(result, isA<Success<num, String>>());
      expect((result as Success<num, String>).data, 2);
    });

    test('divide() cannot divide by zero', () {
      final result = calculator.divide(6, 0);
      expect(result, isA<Error<num, String>>());
      expect((result as Error<num, String>).error, 'Cannot divide by zero');
    });
  });
}