class User {
  final String name;
  final int age;

  const User(this.name, this.age); //모든 필드가 final 이면 const 붙을 수 있음

  // User.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       age = json['name'];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['age']);
  }


  void main() {
    User user1 = const User('name', 10); //생성자에 const 없으면 const 못 붙임
    User user2 = const User('name', 10); //const를 붙이면 같은 것을 찾아서 부름

    print(user1 == user2);

    print(user1.hashCode);
    print(user2.hashCode);
  }
}
