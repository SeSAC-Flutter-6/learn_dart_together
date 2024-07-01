import 'package:learn_dart_together/15_dto_mapper/model/user.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/15_dto_mapper/data_source/user/user_api.dart';
import 'package:learn_dart_together/15_dto_mapper/data_source/user/user_api_impl.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/user/user_repository.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/user/user_repository_impl.dart';

void main() {
  group('UserRepositoryImpl test', () {
    late UserApi userApi;
    late UserRepository repository;

    setUp(() {
      userApi = UserApiImpl();
      repository = UserRepositoryImpl(userApi: userApi);
    });

    test('createUser', () async {
      final String name = '박서윤';
      final String email = '서윤@example.com';
      final double latitude = 100.00;
      final double longitude = -100.00;

      // createUser 호출
      User createdUser = await repository.createUser(
        name: name,
        email: email,
        latitude: latitude,
        longitude: longitude,
        phone: 111111.toString(),
        website: 'www.abs.kr'
      );
      expect(
          createdUser,
          User(
              name: name,
              email: email,
              latitude: latitude,
              longitude: longitude));
    });

    test('getUserbyName', () async {
      final String userName = 'Leanne Graham';
      final user = await repository.getUserbyName(userName);
      expect(user?.name, userName);
    });

    test('getUsers', () async {
      final users = await repository.getUsers();
      expect(users.length, 10);
    });
  });
}
