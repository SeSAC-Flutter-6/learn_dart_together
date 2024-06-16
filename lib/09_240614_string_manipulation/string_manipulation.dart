class Word {
  String word = '';
  String vowel = 'aeiou';

  bool isVowel(int i) {
    String char = word.substring(i, i + 1);
    if (vowel.indexOf(char) >= 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isConsonant(int i) {
    String char = word.substring(i, i + 1);

    if (vowel.indexOf(char) < 0) {
      return true;
    }
    return false;
  }
}

void main() {
  // print('aeious'.substring(0, 1)); //a
  // print('aeious'.substring(1, 2)); //e
  // print('aeious'.substring(2, 3)); //i
  // print('aeious'.substring(3, 4)); //o
  // print('aeious'.substring(4, 5)); //u
}
