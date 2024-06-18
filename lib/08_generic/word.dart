class Word {
  String word = '';
  final String _alphabet = 'abcdefghijklmnopqrstuvwxyz';
  final String _vowels = 'aeiou';

  Word(this.word);

  bool isVowel(int i) {
    String char = word[i - 1].toLowerCase();
    if (i <= 0 || i > word.length) {
      throw RangeError('$i 번째 글자는 존재하지 않습니다');
    }
    if (!_alphabet.contains(char)) {
      throw FormatException('알파벳이 아닙니다');
    }
    return _vowels.contains(char);
  }

  bool isConsonant(int i) {
    String char = word[i - 1].toLowerCase();
    if (i <= 0 || i > word.length) {
      throw RangeError('$i 번째 글자는 존재하지 않습니다');
    }
    if (!_alphabet.contains(char)) {
      throw FormatException('알파벳이 아닙니다');
    }
    return !_vowels.contains(char);
  }
}
