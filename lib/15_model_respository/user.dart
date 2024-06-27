class User {
  final String name;
  final int age;

  // 모든 필드가 final인 경우 const 붙일 수 있음
  const User({required this.name, required this.age});

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

void main() {
  final user1 =
      const User(name: '길동이', age: 10); // const 붙으면 똑같은 인스턴스 찾아서씀(문자열처럼)
  final user2 = const User(name: '길동이', age: 10);
  final user3 = User(name: '길동이', age: 10);

  print(user1 == user2); // true
  print(user1 == user3); // false

  print(user1.hashCode); // 336987875
  print(user2.hashCode); // 336987875
  print(user3.hashCode); // 279703141

  print(identical(user1, user2)); // true

  // 이제부터 수정 필요하면 통째로 바꾸기
  User user5 = User(name: '순신', age: 20);
  user5 = user5.copyWith(age: 30);
}
