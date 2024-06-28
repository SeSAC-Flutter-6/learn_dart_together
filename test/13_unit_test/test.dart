import 'package:learn_dart_together/13_unit_test/data_source/in_memory_user_data_source_impl.dart';
import 'package:learn_dart_together/13_unit_test/model/user.dart';
import 'package:learn_dart_together/13_unit_test/repository/user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('UserRepositoryImpl 테스트', () {
    late InMemoryUserDataSourceImpl dataSource;
    late UserRepositoryImpl userRepository;

    setUp(() {
      dataSource = InMemoryUserDataSourceImpl();
      userRepository = UserRepositoryImpl(dataSource);
    });

    test('createUser는 사용자를 추가합니다', () async {
      final user = User(id: 1, name: '홍길동', email: 'hong@example.com', createdAt: '');
      await userRepository.createUser(user);

      final allUsers = await userRepository.getAllUsers();
      expect(allUsers, contains(user));
    });

    test('findUserByEmail은 사용자를 반환합니다', () async {
      final user = User(id: 1, name: '홍길동', email: 'hong@example.com', createdAt: '');
      await userRepository.createUser(user);

      final foundUser = await userRepository.findUserByEmail('hong@example.com');
      expect(foundUser, equals(user));
    });

    test('findUserByEmail은 사용자가 없을 때 예외를 던집니다', () async {
      expect(
            () async => await userRepository.findUserByEmail('nonexistent@example.com'),
        throwsA(isA<UserRepositoryException>()),
      );
    });

    test('deleteUser는 사용자를 삭제합니다', () async {
      final user = User(id: 1, name: '홍길동', email: 'hong@example.com', createdAt: '');
      await userRepository.createUser(user);
      await userRepository.deleteUser(1);

      final allUsers = await userRepository.getAllUsers();
      expect(allUsers, isNot(contains(user)));
    });

    test('updateUser는 사용자를 업데이트합니다', () async {
      final user = User(id: 1, name: '홍길동', email: 'hong@example.com', createdAt: '');
      await userRepository.createUser(user);

      final updatedUser = User(id: 1, name: '김철수', email: 'kim@example.com', createdAt: '');
      await userRepository.updateUser(updatedUser);

      final foundUser = await userRepository.getUser(1);
      expect(foundUser.name, equals('김철수'));
      expect(foundUser.email, equals('kim@example.com'));
    });

    test('getUser는 ID로 사용자를 반환합니다', () async {
      final user = User(id: 1, name: '홍길동', email: 'hong@example.com', createdAt: '');
      await userRepository.createUser(user);

      final foundUser = await userRepository.getUser(1);
      expect(foundUser, equals(user));
    });

    test('getUser는 사용자가 없을 때 예외를 던집니다', () async {
      expect(
            () async => await userRepository.getUser(999),
        throwsA(isA<InMemoryUserDataSourceImplException>()),
      );
    });

    test('getAllUsers는 모든 사용자를 반환합니다', () async {
      final user1 = User(id: 1, name: '홍길동', email: 'hong@example.com', createdAt: '');
      final user2 = User(id: 2, name: '김철수', email: 'kim@example.com', createdAt: '');
      await userRepository.createUser(user1);
      await userRepository.createUser(user2);

      final allUsers = await userRepository.getAllUsers();
      expect(allUsers, containsAll([user1, user2]));
    });
  });
}