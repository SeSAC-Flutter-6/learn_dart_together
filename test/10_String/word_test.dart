import 'package:learn_dart_together/10_String/word.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('isVowel()', () {
    Word word = Word(word: 'encyclopedia');
    test('i 번째 글자가 모음이면 true 반환', () {
      expect(word.isVowel(0), true);
      expect(word.isVowel(6), true);
    });
    test('i 번째 글자가 자음이면 false 반환', () {
      expect(word.isVowel(2), false);
      expect(word.isVowel(5), false);
    });
  });
  group('isConsonant()', () {
    Word word = Word(word: 'encyclopedia');
    test('i 번째 글자가 모음이면 false 반환', () {
      expect(word.isConsonant(0), false);
      expect(word.isConsonant(6), false);
    });
    test('i 번째 글자가 자음이면 true 반환', () {
      expect(word.isConsonant(2), true);
      expect(word.isConsonant(5), true);
    });
  });
}
