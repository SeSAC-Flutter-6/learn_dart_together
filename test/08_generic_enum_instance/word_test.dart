import 'package:learn_dart_together/08_generic_enum_string/word.dart';
import 'package:test/test.dart';

void main() {
  group('Word test', () {
    final word = Word('aEB*');

    test('word의 i번째 문자가 자음이면 isVowel(i)가 true 반환', () {
      expect(
          [0, 1, 2, 3].map((i) => word.isVowel(i)), [true, true, false, false]);
    });

    test('word의 i번째 문자가 모음이면 isConsonant(i)가 true 반환', () {
      expect([0, 1, 2, 3].map((i) => word.isConsonant(i)),
          [false, false, true, false]);
    });
  });
}
