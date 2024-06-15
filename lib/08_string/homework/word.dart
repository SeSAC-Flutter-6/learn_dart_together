/*
* 실습1
* i 번째 글자가 모음인지 알려주는 isVowel() 함수를 완성하시오
* 영어에서의 모음은 a, e, i, o, u 다섯가지이다
*/

/*
* 실습2
* i 번째 글자가 자음인지 알려주는 isConsonant() 함수를 완성하시오
* */

class Word {
  String word;
  List<String> vowels = ['a', 'e', 'o', 'u', 'i'];

  Word({required this.word});

  bool isVowel(int i) {
    if (i < 0 || i >= word.length) {
      throw RangeError('Index out of range');
    }
    return vowels.contains(word.substring(i, i + 1));
  }

  bool isConsonant(int i) {
    if (i < 0 || i >= word.length) {
      throw RangeError('Index out of range');
    }
    return !vowels.contains(word.substring(i, i + 1));
  }
}

void main() {
  Word word = Word(word: 'abc');
  print(word.isVowel(2)); //false
  print(word.isConsonant(2)); //true
  word.word = 'abe';
  print(word.isVowel(2)); //true
  print(word.isConsonant(2)); //false
  print(word.isConsonant(6)); //RangeError
}
