import 'package:test/test.dart';
import 'package:learn_dart_together/14_unit_test/data/model/user.dart';
import 'package:learn_dart_together/14_unit_test/data/repository/user/user_repository_impl.dart';
import '../../dummy_data/dummy_user.dart';
import 'mock_user_api.dart';

void main() {
  late MockUserApi _mockUserApi;
  late UserRepositoryImpl _userRepository;

  setUp(() {
    _mockUserApi = MockUserApi();
    _userRepository = UserRepositoryImpl(userApi: _mockUserApi);
  });

  group('createUser 테스트', () {
    test('유저 생성', () async {
      final newUser = newbie;
      final created = await _userRepository.createUser(newbie);

      expect(created, true);

      // Verify that user was added
      final users = await _userRepository.getAllUsers();
      expect(users.any((user) => user.id == newUser.id), true);
    });

    test('이미 존재하는 유저는 생성 불가', () async {
      final existingUser = User(id: 1, name: 'John', email: 'john@example.com');
      final created = await _userRepository.createUser(existingUser);

      expect(created, false);
    });
  });

  group('getUser 테스트', () {
    test('유저가 존재한다면 유저를 반환', () async {
      final userId = 1;
      final user = await _userRepository.getUser(userId);

      expect(user!.id, userId);
    });

    test('유저가 존재하지 않는다면 null 반환', () async {
      final userId = 10; // Assuming userId 10 does not exist in mock data
      final user = await _userRepository.getUser(userId);

      expect(user, null);
    });
  });

  group('updateUser 테스트', () {
    test('존재하지 않는 유저라면 false', () async {
      final nonExistingUser =
          User(id: 10, name: 'Tom', email: 'tom@example.com');
      final updated = await _userRepository.updateUser(nonExistingUser);

      expect(updated, false);
    });

    test('존재하는 유저지만 기존 정보와 달라진 정보가 없다면 false', () async {
      final existingUser = User(id: 1, name: 'John', email: 'john@example.com');
      final updated = await _userRepository.updateUser(existingUser);

      expect(updated, false);
    });

    test('존재하는 유저이며 달라진 정보가 있다면 업데이트 후 true', () async {
      final existingUser = User(id: 1, name: 'John', email: 'john@example.com');
      final updatedUser = existingUser.copyWith(name: 'Johnny');
      final updated = await _userRepository.updateUser(updatedUser);

      expect(updated, true);

      // Verify that user was updated
      final user = await _userRepository.getUser(existingUser.id);
      expect(user!.name, 'Johnny');
    });
  });

  group('deleteUser 테스트', () {
    test('존재하지 않는 유저라면 false', () async {
      final userId = 10; // Assuming userId 10 does not exist in mock data
      final deleted = await _userRepository.deleteUser(userId);

      expect(deleted, false);
    });

    test('존재하는 유저면 삭제 후 true', () async {
      final userId = 1;
      final deleted = await _userRepository.deleteUser(userId);

      expect(deleted, true);

      // Verify that user was deleted
      final user = await _userRepository.getUser(userId);
      expect(user, null);
    });
  });

  group('getAllUsers 테스트', () {
    test('모든 유저를 가져옴', () async {
      final users = await _userRepository.getAllUsers();

      expect(users.length, _mockUserApi.dummyUsers.length);
    });

    test('유저가 하나도 존재하지 않는다면 빈 리스트 반환', () async {
      _mockUserApi.dummyUsers.clear(); // Clear dummy users for this test
      final users = await _userRepository.getAllUsers();

      expect(users.length, 0);
    });
  });

  group('findUserByEmail 테스트', () {
    test('이메일과 일치하는 유저를 반환', () async {
      final email = 'alice@example.com';
      final user = await _userRepository.findUserByEmail(email);

      expect(user!.email, email);
    });

    test('일치하는 이메일이 없다면 null 반환', () async {
      final email = 'unknown@example.com'; // Assuming this email does not exist
      final user = await _userRepository.findUserByEmail(email);

      expect(user, null);
    });
  });
}
