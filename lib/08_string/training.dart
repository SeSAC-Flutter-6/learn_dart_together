// i 번째 글자가 모음인지 알려주는 isVowel() 함수를 완성하시오
// 영어에서의 모음은 a, e, i, o, u 다섯가지이다

class Word {
  String word = '';

  Word({
    required this.word,
  });

//모임 확인 함수

  // 모음의 집합 만들기: 모음을 저장하는 집합을 만드세요.
  List<String> vowelist = ['a', 'e', 'i', 'o', 'u'];

  // 집합에 있는지 확인: 주어진 문자가 모음 집합에 있는지 확인하세요.
  bool isVowel(int i) {//int i 는 보니까 인덱스가 int라서 그걸 확인하는거 같고
    // 인덱스 유효성 검사: 인덱스가 문자열의 범위 내에 있는지 확인하세요.
    if (i < 0 || i >= word.length) {//i가 0인덱스 보다 작으면 없는거니까 안되는거고
      //word.length 의 길이보다 큰것도 잘못된 인덱스라는 조건인거 같아
      return false;//그래서 이때는 false를 리턴해서 실패를 알리고
    }

    return vowelist.contains(word.substring(i, i + 1));//그게 아니라면 통과라서
    //vowelist에 contains(담겨있는지) 확인하는데 무엇을 확인하는가
    //단어의 인덱스의 i자리부터 i + 1까지라는건데..왜 2자리를 비교해야하는거지?
    //찾아보니 i부터 i + 1까지 인덱스를 체크하는데 i + 1 자리는 인덱스를 포함하지 않는데
    //결국 substring(i, i + 1)은 i의 인덱스만 체크하게 되는 셈이야..!
  }

  @override
  String toString() {
    return 'Word(word: $word)';
  }
}
