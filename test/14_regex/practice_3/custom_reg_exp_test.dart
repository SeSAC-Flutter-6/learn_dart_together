import 'package:test/test.dart';
import 'package:learn_dart_together/14_regex/practice_3/custom_reg_exp.dart';

void main() {
  group('Custom RegExp 테스트', () {
    test('매칭되는 경우', () {
      var shouldMatch = [
        'A1',
        'A12',
        'A123',
        'UABE',
        'UABCD',
        'UABCDE',
      ];

      for (var testCase in shouldMatch) {
        expect(customRegExp(testCase), isTrue);
      }
    });

    test('매칭되지 않는 경우', () {
      var shouldNotMatch = [
        'A',
        'UA',
        'B12',
        'Us12',
        'UAB4',
      ];

      for (var testCase in shouldNotMatch) {
        expect(customRegExp(testCase), isFalse);
      }
    });
  });
}
