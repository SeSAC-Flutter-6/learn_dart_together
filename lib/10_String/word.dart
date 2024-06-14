class Word {
  String word;
  List<String> vowel = ['a', 'e', 'i', 'o', 'u'];

  Word({required this.word});

  bool isVowel(int i) {
    return vowel.contains(word.substring(i, i + 1));
  }

  bool isConsonant(int i) {
    if (vowel.contains(word.substring(i, i + 1))) {
      return false;
    } else {
      return true;
    }
  }
}

void main() {
  Word word = Word(word: 'Christy');
  print(word.isVowel(3));
  print(word.isConsonant(4));
}
