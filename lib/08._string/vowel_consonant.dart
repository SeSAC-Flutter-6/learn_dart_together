class Word {
  String word = '';

  bool isVowel(int i) {
    return RegExp('[aeiou]').hasMatch(word.substring(i, i + 1).toLowerCase());
  }

  bool isConsonant(int i) {
    // return !RegExp('[aeiou]').hasMatch(word.substring(i, i+1).toLowerCase());
    return !isVowel(i);
  }
}
