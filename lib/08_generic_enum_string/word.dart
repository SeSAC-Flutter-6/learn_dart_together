class Word {
  String word;

  Word(this.word);

  bool isVowel(int i) {
    return 'aeiou'.split('').contains(word[i]);
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

void main() {
  final word = Word('eqqmayo');

  print(word.isVowel(3));
  print(word.isConsonant(4));
}
