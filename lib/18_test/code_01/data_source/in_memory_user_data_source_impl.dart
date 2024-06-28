//여기서는 UserDataSource를 구현하는 구현체인
//InMemoryUserDataSourceImpl을 만든다.
import 'dart:math';

import 'package:learn_dart_together/18_test/code_01/data_source/user_data_source.dart';

import '../model/user.dart';

class InMemoryUserDataSourceImpl implements UserDataSource {
  //로컬 데이터 소스를 사용할 때 사용하는 데이터 그러니까 mock 데이터
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
      "email": "sammy@gmail.com",
      "createdAt": "2021-10-01 00:00:00"
    },
    {
      "id": 3,
      "name": "John Smith",
      "email": "sam@nate.com",
      "createdAt": "2021-12-01 00:00:00"
    },
  ];
  int _id = 3;

//여기서는 기초적인 CRUD만 있으면 된다.
  @override
  Future<User> createUser(User user) async {
    //유저를 만들자
    final tempUser = await user.copyWith(
      id: ++_id,
      createdAt: DateTime.now(),
    );
    //유저를 직렬화해서 추가하자
    _json.add(tempUser.toJson());
    //유저를 반환하자
    return tempUser;
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(int id) async {
    //유저를 찾자
    final user = _json.firstWhere((e) => e['id'] == id);
    //유저를 지우자
    _json.remove(user);
  }

  @override
  Future<User> findUserByEmail(String email) {
    // TODO: implement findUserByEmail
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}
