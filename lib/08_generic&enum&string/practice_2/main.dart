import 'word.dart';

void main() {
  Word word = Word('hahihh');

  print(word.isVowel(3));
  print(word.isConsonant(0));
  print(word.isConsonant(1));
  print(word.isConsonant(2));
  print(word.isConsonant(3));
  print(word.isConsonant(4));
  print(word.isConsonant(5));
}
