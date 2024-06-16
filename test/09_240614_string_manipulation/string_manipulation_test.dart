import 'package:learn_dart_together/09_240614_string_manipulation/string_manipulation.dart';
import 'package:test/test.dart';

void main() {
  group('자음-모음 테스트해보기', () {
    test('모음 테스트', () {
      Word word1 = Word();
      word1.word = 'diablo';

      expect(word1.isVowel(0), equals(false)); // 'd'는 모음이 아님
      expect(word1.isVowel(1), equals(true)); // 'i'는 모음임
      expect(word1.isVowel(5), equals(true)); // 'o'는 모음임
    });

    test('자음 테스트', () {
      Word word2 = Word();
      word2.word = 'apple';

      expect(word2.isConsonant(0), equals(false));
      expect(word2.isConsonant(1), equals(true));
      expect(word2.isConsonant(4), equals(false));
    });
  });
}
