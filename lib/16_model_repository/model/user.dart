class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  // const User(this.name,
  //     this.age); //feild들이 final 이 아닌 경우 const 못 붙임. 모든 필드가 final이면 const 붙일 수 있다
  factory User.fromJSon(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        age: json['age']); //this 접근 안되고 새로운 객체 리턴하는 패턴으로 많이 씀
  }

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

class RentCar {
  var km = 0;

  static final RentCar _instance = RentCar._internal();
  static final RentCar instance = RentCar._internal(); //이렇게도 많이 함, car3에서 사용

  //객체 생성 전에 뭔가를 해서 생성해서 리턴해주는 생성자다
  factory RentCar.getInstance() {
    //getInstance 붙여주는 것이
    return RentCar._internal();
  }

  // RentCar.fromJson(); //생성자를 하나라도 만들면 기본 생성자 없는 걸로 봄
  RentCar._internal(); //생성 못하게 막는 것
}

void main() {
  final car3 = RentCar.instance;
  final car = RentCar.getInstance();
  final car2 = RentCar.getInstance(); //위와 둘은 같은 해시코드

  car.km = 1000; //car2의 km 값도 같음

  final user3 = User.fromJSon({'name': 'name', 'age': 10});
  final user4 = User.fromJSon({'name': 'name', 'age': 10});

  final user1 = User(name: '홍길동', age: 10); //const가 붙으면 같은 것마냥 똑같은 걸로 봄
  final user2 = User(name: '홍길동', age: 10); //그래서 아래와 위는 같은 인스턴스임

  print(user3.hashCode == user4.hashCode); //앞에 const 붙이면 다르지 않을까
  print(user1 == user2); //앞에 const 붙이면 다르지 않을까

  print(user1.hashCode);
  print(user2.hashCode);

  print(identical(user1, user2));

  User user5 = User(name: '이순신', age: 20);
  user5 = user5.copyWith(age: 30); //copyWith로 값을 바꾸는 게 트렌드
}
