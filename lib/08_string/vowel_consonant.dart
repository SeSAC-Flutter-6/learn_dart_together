class Word {
  String word = '';

  String letter(int i) {
    return word.substring(i, i + 1).toLowerCase();
  }

  bool isVowel(int i) {
    return RegExp('[aeiou]').hasMatch(letter(i));
  }

  bool isConsonant(int i) {
    return !isVowel(i) && RegExp('[a-z]').hasMatch(letter(i));
  }
}
