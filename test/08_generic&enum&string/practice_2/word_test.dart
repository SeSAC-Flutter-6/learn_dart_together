import 'package:test/test.dart';
import 'package:learn_dart_together/08_generic&enum&string/practice_2/word.dart';

void main() {
  late Word words;
  group('isVowel & isConsonant 테스트', () {
    setUp(() {
      words = Word('abcdefghijklmnopqrstuvwxyz');
    });
    test('isVowel 실행시, 단어의 각 문자가 모음일 때 true로 return 하는지 확인', () {
      expect(words.isVowel(0), true);
      expect(words.isVowel(4), true);
      expect(words.isVowel(8), true);
      expect(words.isVowel(14), true);
      expect(words.isVowel(20), true);
    });
    test('isConsonant 실행시, 단어의 각 문자가 자음일 때 true로 return 하는지 확인', () {
      for (int i = 0; i < 26; i++) {
        if (i == 0 || i == 4 || i == 8 || i == 14 || i == 20) {
          continue;
        }
        expect(words.isConsonant(i), true);
      }
    });
    test('단어에 대문자가 포함된 경우에도 isVowel과 isConsonant가 정상 작동하는지 확인', () {
      words = Word('ABCDEFGhijklmnOPQRSTUVWXYZ');
      for (int i = 0; i < 26; i++) {
        if (i == 0 || i == 4 || i == 8 || i == 14 || i == 20) {
          expect(words.isVowel(i), true);
          continue;
        }
        expect(words.isConsonant(i), true);
      }
    });
  });
}
