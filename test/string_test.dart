import 'package:learn_dart_together/08_generic/string.dart';
import 'package:test/test.dart';

void main() {
  Word word = Word();
  word.word = 'abcdefghijklnmopqrstuvwxyz';
  List<String> vowels = ['a', 'e', 'o', 'u', 'i'];
  test('a to z에 대한 isVowel() test', () {
    for (int i = 0; i < 26; i++) {
      expect(word.isVowel(i), equals(vowels.contains(word.word[i])));
    }
  });

  test('a to z에 대한 isConnect() test', () {
    for (int i = 0; i < 26; i++) {
      expect(word.isConnect(i), isNot(vowels.contains(word.word[i])));
    }
  });
}
