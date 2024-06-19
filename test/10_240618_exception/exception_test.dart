import 'package:learn_dart_together/10_240618_exception/exception.dart';
import 'package:test/test.dart';

void main() {
  test('정수 여부 테스트 하기', () {
    final numString = '22';
    final num = int.tryParse(numString);
    expect(num, isNotNull);
    expect(num, equals(22));
    expect(num, isA<int>());
  });

  test('정수가 아닌 경우 테스트 하기', () {
    final numString = 'abc';
    final num = int.tryParse(numString);
    expect(num, isNull);
  });
}
