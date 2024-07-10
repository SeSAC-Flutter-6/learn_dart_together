import 'package:learn_dart_together/17_result/calculator/core/result.dart';
import 'package:learn_dart_together/17_result/calculator/exception/exception.dart';
import 'package:learn_dart_together/17_result/calculator/service/calculator_service.dart';
import 'package:test/test.dart';

void main() {
  group('CalculatorService', () {
    test('adds two numbers', () {
      final result = CalculatorService.add(2, 3);
      result.when(
        success: (value) {
          expect(value, 5);
        },
        error: (errorList) {
          fail(errorList.name);
        },
      );
    });

    test('subtracts two numbers', () {
      final result = CalculatorService.subtract(5, 3);
      result.when(
        success: (value) {
          expect(value, 2);
        },
        error: (errorList) {
          fail(errorList.name);
        },
      );
    });

    test('multiplies two numbers', () {
      final result = CalculatorService.multiply(2, 3);
      result.when(
        success: (value) {
          expect(value, 6);
        },
        error: (errorList) {
          fail(errorList.name);
        },
      );
    });

    test('divides two numbers', () {
      final result = CalculatorService.divide(6, 3);
      result.when(
        success: (value) {
          expect(value, 2);
        },
        error: (errorList) {
          fail(errorList.name);
        },
      );
    });

    test('throws an error when dividing by zero', () {
      final result = CalculatorService.divide(6, 0);
      result.when(
        success: (value) {
          fail('Expected an error result');
        },
        error: (errorList) {
          expect(errorList, ErrorList.cannotDivideZero);
        },
      );
    });
  });
}
