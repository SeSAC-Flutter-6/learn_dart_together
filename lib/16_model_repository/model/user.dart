class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], age: json['age']);
  }

  User copyWith({String? name, int? age}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }


// User.fromJson(Map<String, dynamic> json)
//   : name = json['name'], age = json['age'];
}

// RentCar getRentCar() {
//   return RentCar._instance;
// }

class RentCar {
  var km = 0;

  static final RentCar _instance = RentCar._internal();

  // // 객체 생성 전에 뭔가를 하고 생성해서 리턴하는 생성자
  factory RentCar.getInstance() {
    // 반죽
    // 만두 빚던지
    return RentCar._instance;
  }

  RentCar._internal();
}

void main() {
  // 싱글턴 패턴
  final car = RentCar.getInstance();
  car.km = 1000;

  final car2 = RentCar.getInstance();
  car2.km = 2000;

  final user3 = User.fromJson({'name': 'name', 'age': 10});
  final user4 = User.fromJson({'name': 'name', 'age': 10});

  print(user3.hashCode == user4.hashCode);

  final user1 = const User(name: '이순신', age: 20);
  final user2 = const User(name: '이순신', age: 20);

  print(user1 == user2); //

  print(user1.hashCode);
  print(user2.hashCode);

  print(identical(user1, user2));

  // 이제부터 수정필요하면 통째로 바꾼다
  User user5 = User(name: '이순신', age: 20);
  user5 = user5.copyWith(age: 30);
}
