import 'dart:convert';
import 'dart:math';

void main() {
  final Map<String, dynamic> json = {
    "name": true,
    "email": "john@example.com",
    "address": {
      "city": "suwon",
    },
  };

  Map ddd = json['address'];
  print(ddd['city']);

  User user = User(name: 'user', email: 'a@ac.com');
  User user2 = User.fromJson(json);

  print(user2);

  final Map<String, dynamic> userJson = user2.toJson();
  print(userJson['name']);
  print(userJson['email']);

  final json3 = "{'name': '어쩌구', 'email': '저쩌구'}"; // NG
  final json4 = '{"name": "어쩌구", "email": "저쩌구"}'; // OK
  final json3Map = jsonDecode(json4);
}

// 4종 : data class + 직렬화,역직렬화
class User {
  final String name;
  final String email;

  const User({
    required this.name,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

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

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}