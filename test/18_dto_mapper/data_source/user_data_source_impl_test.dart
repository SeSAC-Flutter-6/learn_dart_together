import 'package:learn_dart_together/18_dto_mapper/data_source/user_data_source_impl.dart';
import 'package:learn_dart_together/18_dto_mapper/dto/user_dto.dart';
import 'package:test/test.dart';

void main() {
  group('UserDataSourceImpl Tests', () {
    late UserDataSourceImpl userDataSource;

    setUp(() {
      userDataSource = UserDataSourceImpl(baseUrl: 'https://6989d813-8d80-41a1-9a48-4772acb8da1f.mock.pstmn.io/users');
    });

    test('getUsers()를 호출하면 list UserDto 타입을 리턴 해야 된다.', () async {
      final users = await userDataSource.getUsers();

      expect(users, isA<List<UserDto>>());
      expect(users.isNotEmpty, true);
    });

    test('getUser()를 호출하면 UserDto 타입을 리턴 해야 한다.', () async {
      final user = await userDataSource.getUser(1);
      expect(user, isA<UserDto>());
      expect(user.id, 1);
    });

    test('getUser(1)를 호출하면 user.id는 1이어야 한다.', () async {
      final user = await userDataSource.getUser(1);
      expect(user.id, 1);
    });
  });
}
