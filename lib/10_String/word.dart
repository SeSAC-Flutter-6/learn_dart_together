class Word {
  String word;
  final List<String> _vowel = ['a', 'e', 'i', 'o', 'u'];

  Word({required this.word});

  bool isVowel(int i) {
    return _vowel.contains(word.substring(i, i + 1));
  }

  bool isConsonant(int i) {
    if (_vowel.contains(word.substring(i, i + 1))) {
      return false;
    }
    return true;
  }
}

void main() {
  Word word = Word(word: 'Christy');
  print(word.isVowel(3));
  print(word.isConsonant(4));
}
