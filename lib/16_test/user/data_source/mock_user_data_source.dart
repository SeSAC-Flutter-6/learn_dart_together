import 'package:learn_dart_together/16_test/user/data_source/user_data_source.dart';
import '../model/user.dart';

class MockUserDataSource implements UserDataSource {
  final List<Map<String, dynamic>> _users = [
    {
      "id": 1,
      "name": "홍길동",
      "email": "gildong@naver.com",
      "createdAt": "2024-06-27 13:30:20.854960"
    },
    {
      "id": 2,
      "name": "이순신",
      "email": "sunshin@naver.com",
      "createdAt": "2024-06-28 13:30:20.854960"
    },
    {
      "id": 3,
      "name": "김다희",
      "email": "dahee@naver.com",
      "createdAt": "2024-06-29 13:30:20.854960"
    },
    {
      "id": 4,
      "name": "박주현",
      "email": "juhyeon@naver.com",
      "createdAt": "2024-06-30 13:30:20.854960"
    },
  ];

  @override
  Future<List<User>> fetchUsers() async {
    return _users.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<void> addUser(User user) async {
    _users.add(user.toJson());
  }

  @override
  Future<void> deleteUser(User user) async {
    _users.removeWhere((json) => json['id'] == user.id);
  }

  @override
  Future<void> updateUser(User user) async {
    final index = _users.indexWhere((json) => json['id'] == user.id);
    _users[index] = user.toJson();
  }
}
