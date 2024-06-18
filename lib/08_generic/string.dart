class Word {
  String word = '';
  List<String> vowels = ['a', 'e', 'o', 'u', 'i'];

  bool isVowel(int i) {
    return vowels.contains(word.substring(i, i + 1));
  }

  bool isConnect(int i) {
    return !vowels.contains(word.substring(i, i + 1));
  }
}
