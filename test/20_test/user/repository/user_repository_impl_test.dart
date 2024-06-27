import 'package:collection/collection.dart';
import 'package:learn_dart_together/20_test/user/data_source/mock_user_data_source.dart';
import 'package:learn_dart_together/20_test/user/model/user.dart';
import 'package:learn_dart_together/20_test/user/repository/user_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('UserRepositoryImpl test', () {
    final repository = UserRepositoryImpl(MockUserDataSource());
    test('getAllUsers()를 실행하면 모든 데이터를 받아옴', () async {
      var users = await repository.getAllUsers();
      expect(
          users.equals([
            User.fromJson({
              "id": 1,
              "name": "홍길동",
              "email": "gildong@naver.com",
              "createdAt": "2024-06-27 13:30:20.854960"
            }),
            User.fromJson({
              "id": 2,
              "name": "이순신",
              "email": "sunshin@naver.com",
              "createdAt": "2024-06-28 13:30:20.854960"
            }),
            User.fromJson({
              "id": 3,
              "name": "김다희",
              "email": "dahee@naver.com",
              "createdAt": "2024-06-29 13:30:20.854960"
            }),
            User.fromJson({
              "id": 4,
              "name": "박주현",
              "email": "juhyeon@naver.com",
              "createdAt": "2024-06-30 13:30:20.854960"
            }),
          ]),
          true);
    });

    test('데이터저장소에 존재하는 이메일로 createUser() 실행시 에러 발생', () async {
      expect(
          () async => await repository.createUser(
              name: '이다희', email: 'dahee@naver.com'),
          throwsException);

      await repository.createUser(name: '이다희', email: '2dahee@naver.com');
      expect((await repository.getAllUsers()).last.email, '2dahee@naver.com');
    });

    test('deleteUser() 실행시 찾는 id가 없으면 에러 발생', () async {
      expect(() async => await repository.deleteUser(id: 7), throwsException);

      await repository.deleteUser(id: 5);
      expect((await repository.getAllUsers()).last.id, 4);
    });

    test('findUserByEmail() 실행시 찾는 이메일이 없으면 null 리턴', () async {
      expect(await repository.findUserByEmail(email: 'null@naver.com'), isNull);
      expect(await repository.findUserByEmail(email: 'dahee@naver.com'),
          isNotNull);
    });

    test('updateUser() 실행시 찾는 id가 없거나 이메일이 중복될 경우 에러 발생', () async {
      expect(() async => await repository.updateUser(id: 8, name: '민지'),
          throwsException);
      expect(
          () async =>
              await repository.updateUser(id: 3, email: 'gildong@naver.com'),
          throwsException);

      await repository.updateUser(id: 2, name: '애옹');
      expect((await repository.getAllUsers())[1].name, '애옹');
    });

    test('getUser()를 하면 id로 유저를 찾을수 있고, id가 없으면 null 리턴', () async {
      final user = await repository.getUser(id: 1);
      final user1 = await repository.getUser(id: 10);
      expect(user?.id, 1);
      expect(user1, null);
    });
  });
}
