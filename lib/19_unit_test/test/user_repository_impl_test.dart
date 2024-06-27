import 'package:learn_dart_together/19_unit_test/data_source/in_memory_user_data_source_impl.dart';
import 'package:learn_dart_together/19_unit_test/repository/user_repository_impl.dart';
import 'package:learn_dart_together/19_unit_test/model/user.dart';
import 'package:test/test.dart';

void main() {
  final userRepository =
      UserRepositoryImpl(userDataSource: InMemoryUserDataSourceImpl());

  test('createUser 할 때 생성한 user 객체 데이터가, getUser로 가져온 데이터와 일치해야 한다.', () async {
    final user = User(
        id: 3,
        name: '손오천',
        email: 'dragonball3@naver.com',
        createdAt: '2024/01/01 12:00:00');
    await userRepository.createUser(user);
    final fetchedUser = await userRepository.getUser(user.id);
    expect(fetchedUser.name, equals(user.name));
    expect(fetchedUser.email, equals(user.email));
    expect(fetchedUser.createdAt, equals(user.createdAt));
  });

  test('deleteUser를 하면, 예외가 발생해야 한다.', () async {
    final user = User(
        id: 2,
        name: 'dandan',
        email: 'dragonba55@naver.com',
        createdAt: '2024/01/01 12:00:00');
    await userRepository.createUser(user);
    await userRepository.deleteUser(user.id);
    expect(
      () async => await userRepository.getUser(user.id),
      throwsA(equals('1 유저를 찾을 수 없습니다.')),
    );
  });

  test('getAllUsers - 모든 사용자 조회', () async {
    final users = await userRepository.getAllUsers();

    expect(users.length, 2);
  });

  test('findUserByEmail - 이메일로 사용자 조회', () async {
    final user = await userRepository.findUserByEmail('dragonball2@naver.com');

    expect(user, isNotNull);
    expect(user!.name, '손오공');
    expect(user.email, 'dragonball2@naver.com');
  });
}
