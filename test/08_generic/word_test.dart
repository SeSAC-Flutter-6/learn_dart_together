import 'package:learn_dart_together/08_generic/word.dart';
import 'package:test/test.dart';

void main() {
  group('myWord 클래스 테스트', () {
    test('1: 모음 확인 테스트', () {
      Word myWord = Word('hello');
      expect(myWord.isVowel(1), equals(false));
      expect(myWord.isVowel(2), equals(true));
      expect(myWord.isVowel(3), equals(false));
      expect(myWord.isVowel(4), equals(false));
      expect(myWord.isVowel(5), equals(true));
    });

    test('2: 자음 확인 테스트', () {
      Word myWord = Word('hello');
      expect(myWord.isConsonant(1), equals(true));
      expect(myWord.isConsonant(2), equals(false));
      expect(myWord.isConsonant(3), equals(true));
      expect(myWord.isConsonant(4), equals(true));
      expect(myWord.isConsonant(5), equals(false));
    });

    test('3: RangeError 테스트', () {
      Word myWord = Word('hello');
      expect(() => myWord.isVowel(0), throwsRangeError);
      expect(() => myWord.isConsonant(0), throwsRangeError);

      expect(() => myWord.isVowel(1), returnsNormally);
      expect(() => myWord.isConsonant(1), returnsNormally);

      expect(() => myWord.isVowel(myWord.word.length), returnsNormally);
      expect(() => myWord.isConsonant(myWord.word.length), returnsNormally);

      expect(() => myWord.isVowel(myWord.word.length + 1), throwsRangeError);
      expect(
          () => myWord.isConsonant(myWord.word.length + 1), throwsRangeError);
    });

    test('4: FormatException 테스트', () {
      Word myWord = Word('he11@');
      expect(() => myWord.isVowel(3), throwsFormatException);
      expect(() => myWord.isConsonant(4), throwsFormatException);
      expect(() => myWord.isVowel(5), throwsFormatException);
    });
  });
}
