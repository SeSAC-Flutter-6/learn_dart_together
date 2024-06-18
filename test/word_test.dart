import 'package:learn_dart_together/08_string/homework/word.dart';
import 'package:test/test.dart';

void main() {
  group('i번째 글자가 자음인지 모음인지 테스트', () {
    late Word word;
    setUp(() {
      word = Word(word: 'Flutter');
    });

    test('isVowe(0) 일 때, false가 되어야 한다.', () {
      expect(word.isVowel(0), false);
    });
    test('isVowe(2) 일 때, false가 되어야 한다.', () {
      expect(word.isVowel(2), true);
    });
    test('isConsonant(0) 일 때, true 되어야 한다.', () {
      expect(word.isConsonant(0), true);
    });
    test('isConsonant(2) 일 때, false가 되어야 한다.', () {
      expect(word.isConsonant(2), false);
    });

    test('isVowel(7) 이상 일 때, throwsRangeError가 발생 해야 한다.', () {
      expect(() => word.isVowel(7), throwsRangeError);
      expect(() => word.isVowel(10), throwsRangeError);
    });

    test('isConsonant(7) 이상 일 때, throwsRangeError가 발생 해야 한다.', () {
      expect(() => word.isConsonant(7), throwsRangeError);
      expect(() => word.isConsonant(10), throwsRangeError);
    });
  });
}
