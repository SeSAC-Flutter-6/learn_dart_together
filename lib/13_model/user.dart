class User {
  final String name;
  final int age;

  // 우리는 data class 형태로 만들것이기 때문에 있어도 그만
  const User(this.name, this.age);

  @override
  String toString() {
    return 'User{name: $name, age: $age}';
  }
}

class RentCar {
  static final RentCar instance = RentCar._internal();

  RentCar._internal();
}

class RentCar2 {
  static final RentCar2 _instance = RentCar2._internal();

  factory RentCar2() {
    return _instance;
  }

  RentCar2._internal();
}

void main() {
  final user1 = User('홍길동', 10);
  final user2 = User('홍길동', 10);
  final user3 = const User('홍길동', 10);
  final user4 = const User('홍길동', 10);
  print(user1 == user2);
  print(user3 == user4);

  // User의 필드가 모두 final여야 const 붙일 수 있음.
  // const가 붙은 애들은 String마냥 똑같은 애들을 찾아 재사용 한다.


  // 모두 싱글턴
  final singletone = RentCar.instance;
  final singletone_2 = RentCar.instance;
  final singletoneA = RentCar2(); // 팩토리를 이용하여 가공한 싱글톤
  final singletoneA_2 = RentCar2(); // 팩토리를 이용하여 가공한 싱글톤

  print(singletone.hashCode == singletone_2.hashCode);
  print(singletoneA.hashCode == singletoneA_2.hashCode);
}

// 팩토리 패턴 : 객체를 만들어서 return 한다.
// factory를 붙였다고해서 매번 같은 instance를 주는게 아니다.
// 단순하게 객체를 "내부에서" 만들어서 "return" 해주는거다.

// 싱글톤 패턴 : 추후 객체를 만들더라도, 어디서든지 1개의 객체만을 바라보기 때문에 필드의 값이 바뀌면 모든 곳에서 다 바뀐다. (= 다 똑같은 객체이다)

// 이제부터 객체의 값 수정이 필요하면 copyWith를 이용하여 통째로 바꾼다.
