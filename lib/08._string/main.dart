void main() {
  String s1 = 'aaa';
  String s2 = 'aaa';

  print(s1.hashCode == s2.hashCode);
  print(s1 == s2); //값이 동일하면 해시코드도 동일하다 string과 int
  print(identical(s1, s2)); // 둘이 다른 인스턴스 같은데 true가 나옴
  //String, int, double 은 특이하다. 주소가 같다. 이유는 string은 내부적으로 한 번 만들어놓은 애들을 string-pool에 관리를 함. 똑같은 애를 사용할 때 다시 재사용함.
  //내가 똑같은 걸 쓰면 그래도 메모리는 하나만 쓰게 됨

  //String은 불변
  String result = ''; //new
  print(result.hashCode);
  String s3 = s1 + 'a';
  final stopWatch = Stopwatch();
  for (var i = 1; i < 3; i++) {
    result += '$i'; //new 기존 값이 변경되는 것이 아닌 새로 만들어서 할당 다시하는 것. 만드는 만큼 new 가 됨.
    //+를 하면서 새로 만들어짐
    //해시코드는 어차피 달라짐
    print(result.hashCode);
  }
  stopWatch.stop();
  print(stopWatch.elapsedMilliseconds);

  final stopWatch1 = Stopwatch();
  final sb = StringBuffer('');
  for (var i = 0; i < 100000; i++) {
    sb.write('$i');
  }
  stopWatch1.stop();
  print(stopWatch1.elapsed); // 속도가 빠르다
}
