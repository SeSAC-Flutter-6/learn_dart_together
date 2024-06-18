void main() {
  String s1 = 'aaa';
  String s2 = 'aaa';
  print(s1 == s2);


  //String은 불변 객체
  //인스턴스를 계속 생성하고 사용안하는 메모리는 가비지 컬렉터가 제거한다.(순간적으로 메모리를 많이잡아먹음)
  String result = ''; // new
  print(result.hashCode);
  for (var i = 0; i < 3; i++) {
    result += '$i';
    print(result.hashCode);
  }

  //StringBuffer 일정 메모리를 일단 잡아놓는다 (훨씬 빠름)
}