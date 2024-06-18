import 'package:test/test.dart';

void main() {
  group('여러 문자열 타입 별 int 파싱 테스트', () {
    late String numString;
    late int num;

    test('numString이 "10.5" 일 때, num은 0이 되어야 한다.', () {
      numString = '10.5';
      num = int.tryParse(numString) ?? 0;
      expect(num, 0);
    });

    test('numString이 "abc" 일 때, num은 0이 되어야 한다.', () {
      numString = 'abc';
      num = int.tryParse(numString) ?? 0;
      expect(num, 0);
    });

    test('numString이 "" 일 때, num은 0이 되어야 한다.', () {
      numString = '';
      num = int.tryParse(numString) ?? 0;
      expect(num, 0);
    });

    test('numString이 "10" 일 때, num은 하면 10이 되어야 한다.', () {
      numString = '10';
      num = int.tryParse(numString) ?? 0;
      expect(num, 10);
    });
  });
}
