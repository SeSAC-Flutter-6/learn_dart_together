import 'package:learn_dart_together/19_unit_test/model/user.dart';
import 'package:learn_dart_together/19_unit_test/data_source/user_data_source.dart';

class InMemoryUserDataSourceImpl implements UserDataSource {
  final List<User> list = [];

  InMemoryUserDataSourceImpl() {
    list.addAll(_json.map((e) => User.fromJson(e)).toList());
  }

  final _json = [
    {
      "id": 1,
      "name": "손오공",
      "email": "dragonball2@naver.com",
      "created_at": "2023/01/01 12:00:00"
    },
    {
      "id": 2,
      "name": "손오반",
      "email": "jane.smith@example.com",
      "created_at": "2023/01/02 12:00:00"
    },
  ];

  @override
  Future<void> createUser(User user) async {
    list.add(user);
  }

  @override
  Future<User> getUser(int userId) async {
    try {
      return list.firstWhere((e) => e.id == userId);
    } catch (e) {
      throw Exception('사용자를 찾을 수 없습니다.');
    }
  }

  @override
  Future<void> updateUser(User user) async {
    final index = list.indexWhere((e) => e.id == user.id);
    if (index != -1) {
      list[index] = user;
    } else {
      throw Exception('수정할 사용자를 찾을 수 없습니다.');
    }
  }

  @override
  Future<void> deleteUser(int userId) async {
    final index = list.indexWhere((e) => e.id == userId);
    if (index != -1) {
      list.removeAt(index); // 사용자 삭제
    } else {
      throw Exception('삭제할 사용자를 찾을 수 없습니다.');
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    return list;
  }

  @override
  Future<User> findUserByEmail(String email) async {
    try {
      return list.firstWhere((e) => e.email == email);
    } catch (e) {
      throw Exception('사용자를 찾을 수 없습니다.');
    }
  }
}
