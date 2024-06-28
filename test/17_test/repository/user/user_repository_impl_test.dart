import 'package:learn_dart_together/17_test/data_source/user/in_memory_user_data_source.dart';
import 'package:learn_dart_together/17_test/model/user.dart';
import 'package:learn_dart_together/17_test/repository/user/user_repository_impl.dart';
import 'package:test/test.dart';

void main() async {
  final userRepository =
      UserRepositoryImpl(userDataSource: InMemoryUserDataSourceImpl());
  test('createUser 할 때 생성한 user 객체 데이터가, getUser로 가져온 데이터와 일치해야 한다.', () async {
    final user = User(
        id: 1,
        name: '홍길동',
        email: 'test@test.com',
        createdAt: '2024/01/01 12:00:00');
    await userRepository.createUser(user);
    final fetchedUser = await userRepository.getUser(user.id);
    expect(fetchedUser.name, equals(user.name));
    expect(fetchedUser.email, equals(user.email));
    expect(fetchedUser.createdAt, equals(user.createdAt));
  });

  test('updateUser를 하면, name은 updatedUser.name, email은 updatedUser.email 이 되어야 한다.',
      () async {
    final user = User(
        id: 1,
        name: '홍길동',
        email: 'hong@test.com',
        createdAt: '2024/01/01 12:00:03');
    await userRepository.createUser(user);

    final updatedUser = User(
        id: 1,
        name: '박길동',
        email: 'parkgildong@test.com',
        createdAt: '2024/01/01 12:00:03');
    await userRepository.updateUser(updatedUser);

    final fetchedUser = await userRepository.getUser(updatedUser.id);
    expect(fetchedUser.name, equals(updatedUser.name));
    expect(fetchedUser.email, equals(updatedUser.email));
  });

  test('deleteUser를 하면, 예외가 발생해야 한다.', () async {
    final user = User(
        id: 1,
        name: '이청우',
        email: 'abc@test.com',
        createdAt: '2024/01/01 12:00:03');
    await userRepository.createUser(user);

    await userRepository.deleteUser(user.id);

    expect(
      () async => await userRepository.getUser(user.id),
      throwsA(equals('1 유저를 찾을 수 없습니다.')),
    );
  });

  test('중복된 이메일을 사용하면, 예외가 발생해야 한다.', () async {
    final user1 = User(
        id: 1,
        name: '홍길동',
        email: 'flutter@test.com',
        createdAt: '2024/01/01 12:00:00');
    final user2 = User(
        id: 2,
        name: '이순신',
        email: 'flutter@test.com',
        createdAt: '2024/01/01 12:00:03');

    await userRepository.createUser(user1);

    expect(
      () async => await userRepository.createUser(user2),
      throwsA(equals('이미 등록된 이메일 입니다.')),
    );
  });

  test('findUserByEmail을 하면, lee@test.com 이 되어야 한다.', () async {
    final user = User(
        id: 1,
        name: '리청우',
        email: 'lee@test.com',
        createdAt: '2024/01/01 12:00:03');
    await userRepository.createUser(user);

    final fetchedUser = await userRepository.findUserByEmail(user.email);
    expect(fetchedUser.email, equals('lee@test.com'));
  });

  test('findUserByEmail이 존재하지 않는 이메일을 입력하면 예외가 발생해야 한다.', () async {
    expect(
      () async => await userRepository.findUserByEmail('abcdefg@example.com'),
      throwsA(equals('등록된 이메일이 없습니다.')),
    );
  });
}
