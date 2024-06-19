import 'package:learn_dart_together/09_error/exception.dart';
import 'package:test/test.dart';

void main() {
  group('StringToInt test', () {
    test('double 문자열을 입력하면 0 출력', () {
      expect(() => stringToInt('20.24'), prints('0\n'));
      expect(() => stringToInt('0.618'), prints('0\n'));
    });

    test('int 문자열을 입력하면 int로 바꾸어 출력', () {
      expect(() => stringToInt('7'), prints('7\n'));
      expect(() => stringToInt('22'), prints('22\n'));
    });
  });
}
