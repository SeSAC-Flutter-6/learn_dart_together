class User {
  final String name;
  final int age;

  const User(
    this.name,
    this.age,
  );
}

void main() {
  final user1 = User('홍길동', 20);
  final user2 = User('홍길동', 20);
  print(user1 == user2);
  //const 는 final이 아닌 경우는 const가 안붙는다. 수정이 가능하니까
  //const가 붙을 수 있는 생성자는 객체가 생성될 때 const가 붙을 수 있는데
  //객체에 붙이면 컴파일이 User를 찾아서 재활용을 한다(같은 인스턴스로 본다)
  //동등성 비교를 하지 않았는데도 마치 String 처럼!

  final user3 = const User('홍길동', 20);
  final user4 = const User('홍길동', 20);
  print(user3 == user4);
}
//factory 패턴에서 항상 같은 코드를 주는건 아닌데 문서에서는 항상 같다고 써있다
//객체 만들어서 리턴해주는 것이다 (Singleton 이랑 연관관계가 없엉)
