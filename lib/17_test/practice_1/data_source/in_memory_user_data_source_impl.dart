import 'package:learn_dart_together/17_test/practice_1/data_source/user_data_source.dart';
import 'package:learn_dart_together/17_test/practice_1/model/user.dart';

class InMemoryUserDataSourceImpl implements UserDataSource {
  final List<Map<String, dynamic>> _json = [
    {
      "id": 1,
      "name": "John Doe",
      "email": "mmmkb1@naver.com",
      "createdAt": "2021-08-01 00:00:00"
    },
    {
      "id": 2,
      "name": "Jane Doe",
      "email": "mmmkb2@gmail.com",
      "createdAt": "2021-10-01 00:00:00"
    },
    {
      "id": 3,
      "name": "John Smith",
      "email": "mmmkb1@nate.com",
      "createdAt": "2021-12-01 00:00:00"
    },
  ];
  int _id = 3;

  List<Map<String, dynamic>> get json => _json;

  @override
  Future<User> getUser(int? id) async {
    final user = _json.firstWhere((element) => element['id'] == id);
    return User.fromJson(user);
  }

  @override
  Future<List<User>> getAllUsers() async {
    return _json.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<String> createUser(User? user) async {
    User temp = user!.copyWith(id: ++_id);
    _json.add(temp.toJson());
    return '${temp.id} created';
  }

  @override
  Future<User> updateUser(User user) async {
    final index = _json.indexWhere((element) => element['id'] == user.id);
    _json[index] = user.toJson();
    return user;
  }

  @override
  Future<String> deleteUser(int id) async {
    _json.removeWhere((element) => element['id'] == id);
    return '$id deleted';
  }
}
