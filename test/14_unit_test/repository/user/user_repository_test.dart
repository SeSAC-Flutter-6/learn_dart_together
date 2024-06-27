import 'package:test/test.dart';
import 'package:learn_dart_together/14_unit_test/data/model/user.dart';
import 'package:learn_dart_together/14_unit_test/data/repository/user/user_repository_impl.dart';
import '../../../dummy_data/dummy_user.dart';
import 'mock_user_api.dart';

void main() {
  late MockUserApi mockUserApi;
  late UserRepositoryImpl userRepository;

  setUp(() {
    mockUserApi = MockUserApi();
    userRepository = UserRepositoryImpl(userApi: mockUserApi);
    dummyUsers.clear();
    dummyUsers.addAll(initialDummyUsers);
  });

  group('createUser 테스트', () {
    test('유저 생성', () async {
      User user = User.fromJson(newbie);
      final created = await userRepository.createUser(user);
      expect(created, true);
    });

    test('이미 존재하는 유저는 생성 불가', () async {
      final existingUser = User.fromJson(user1);
      final created = await userRepository.createUser(existingUser);
      expect(created, false);
    });
  });

  group('getUser 테스트', () {
    test('유저가 존재한다면 유저를 반환', () async {
      final existingUser = User.fromJson(user1);
      final user = await userRepository.getUser(existingUser.id);
      expect(existingUser, user);
    });

    test('유저가 존재하지 않는다면 null 반환', () async {
      User nonExistentUser = User.fromJson(newbie);
      final user = await userRepository.getUser(nonExistentUser.id);
      expect(user, null);
    });
  });

  group('updateUser 테스트', () {
    test('존재하지 않는 유저라면 false', () async {
      User nonExistentUser = User.fromJson(newbie);
      final updated = await userRepository.updateUser(nonExistentUser);
      expect(updated, false);
    });

    test('존재하는 유저지만 기존 정보와 달라진 정보가 없다면 false', () async {
      final existingUser = User.fromJson(user1);
      final updated = await userRepository.updateUser(existingUser);
      expect(updated, false);
    });

    test('존재하는 유저이며 달라진 정보가 있다면 업데이트 후 true', () async {
      final existingUser = User.fromJson(user1);
      final String newEmail = 'new_email@example.com';
      final updatedUser = existingUser.copyWith(email: newEmail);
      final updated = await userRepository.updateUser(updatedUser);
      expect(updated, true);

      final user = await userRepository.getUser(updatedUser.id);
      expect(user!.email, newEmail);
    });
  });

  group('deleteUser 테스트', () {
    test('존재하지 않는 유저라면 false', () async {
      User nonExistentUser = User.fromJson(newbie);
      final deleted = await userRepository.deleteUser(nonExistentUser.id);
      expect(deleted, false);
    });

    test('존재하는 유저면 삭제 후 true', () async {
      final existingUser = User.fromJson(user1);
      final deleted = await userRepository.deleteUser(existingUser.id);
      expect(deleted, true);

      final deletedUser = await userRepository.getUser(existingUser.id);
      expect(deletedUser, null);
    });
  });

  group('getAllUsers 테스트', () {
    test('모든 유저를 가져옴', () async {
      final users = await userRepository.getAllUsers();
      expect(users.length, dummyUsers.length);
    });

    test('유저가 하나도 존재하지 않는다면 빈 리스트 반환', () async {
      dummyUsers.clear();
      final users = await userRepository.getAllUsers();
      expect(users.length, 0);
    });
  });

  group('findUserByEmail 테스트', () {
    test('이메일과 일치하는 유저를 반환', () async {
      final existingUser = User.fromJson(user1);
      final user = await userRepository.findUserByEmail(existingUser.email);
      expect(user!.email, existingUser.email);
    });

    test('일치하는 이메일이 없다면 null 반환', () async {
      User nonExistentUser = User.fromJson(newbie);
      final user = await userRepository.findUserByEmail(nonExistentUser.email);
      expect(user, null);
    });
  });
}
