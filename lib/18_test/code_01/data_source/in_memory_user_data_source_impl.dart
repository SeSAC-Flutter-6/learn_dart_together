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
  Future<User> updateUser(User user) async {
    //유저의 업데이트는 무엇을 말하는 걸까? - 사용자 정보의 변경 될 때 호출되고, 데이터소스에 반영

    //해당 사용자를 찾고
    final findUser = _json.firstWhere((e) => e['id'] == user.id);
    //해당 사용자를 업데이트
    findUser['name'] = user.name;
    findUser['email'] = user.email;
    //업데이트된 사용자를 반환
    //Future.value()는 주어진 값을 가진 완료된 Future를 생성하는 메서드이고
    //이걸 사용해서 User 객체를 반환한다.
    return User.fromJson(findUser);
  }

  @override
  Future<void> deleteUser(int id) async {
    //유저를 찾자
    final user = _json.firstWhere((e) => e['id'] == id);
    //유저를 지우자
    _json.remove(user);
  }

  @override
  Future<User> findUserByEmail(String email) async {
    //이메일로 유저를 찾자
    final findUserEmail = _json.firstWhere((e) => e['email'] == email);
    //Map 을 User 객체로 변환해서 반환하자
    return User.fromJson(findUserEmail);
  }

  @override
  Future<List<User>> getAllUsers() async {
    // User 객체 내 모든 값에 접근하고
    // User.fromJson을 이용해서 map을 역직렬화해서 Iterable을 반환하고 다시 리스트로 호출
    final allUsersMap = _json.map((e) => User.fromJson(e)).toList();
    //
    return allUsersMap;
  }

  @override
  Future<User> getUser(int id) async {
    //해당하는 사용자 id를 찾고 객체를 반환하는 메서드
    final findUserId = await _json.firstWhere((e) => e['id'] == id);
    //Map을 User 객체로 변환하자
    return User.fromJson(findUserId);
  }
}
