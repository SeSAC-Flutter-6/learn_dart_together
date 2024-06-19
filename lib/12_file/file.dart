import 'dart:io';

void main() {
  final file = File('abc.txt');
  file.writeAsString('Hello'); // 여기서 열고 닫고 다 한거임

  User user = User(name: 'name', email: 'email');
  User user2 = User.fromJson({'name': '홍길동', 'email': 'aaaa@aaaa'});
  print(user2);

  final Map<String, dynamic> userJson = user2.toJson();
  print(userJson);
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email;

  @override
  int get hashCode => name.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  User copyWith(String? name, String? email) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    //메서드
    return {'name': name, 'email': email};
  }
}
