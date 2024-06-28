import 'package:learn_dart_together/17_test/data_source/user/user_data_source.dart';

import '../../model/user.dart';

class InMemoryUserDataSourceImpl implements UserDataSource {
  final List<User> _list = [];


  @override
  Future<void> createUser(User user) async {
    _list.add(user);
  }

  @override
  Future<User> getUser(int userId) async {
    return _list.firstWhere((e) => e.id == userId);
  }

  @override
  Future<void> updateUser(User user) async {
    final index = _list.indexWhere((e) => e.id == user.id);
    if (index != -1) {
      _list[index] = user;
    }
  }

  @override
  Future<void> deleteUser(int userId) async {
    _list.removeWhere((e) => e.id == userId);
  }

  @override
  Future<List<User>> getAllUsers() async {
    return _list;
  }
}
// final _json = [
//   {
//     "id": 1,
//     "name": "John Doe",
//     "email": "john.doe@example.com",
//     "created_at": "2023/01/01 12:00:00"
//   },
//   {
//     "id": 2,
//     "name": "Jane Smith",
//     "email": "jane.smith@example.com",
//     "created_at": "2023/01/02 12:00:00"
//   },
// ];
