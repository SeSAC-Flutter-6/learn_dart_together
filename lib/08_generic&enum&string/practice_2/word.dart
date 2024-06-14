class Word {
  String word = '';

  Word(this.word);

  bool isVowel(int i) {
    return ['a', 'e', 'i', 'o', 'u']
        .contains(word.toLowerCase().substring(i, i + 1));
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}
