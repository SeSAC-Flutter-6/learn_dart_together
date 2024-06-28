import 'package:test/test.dart';
import 'package:learn_dart_together/17_test/practice_1/repository/user_repository_impl.dart';
import 'package:learn_dart_together/17_test/practice_1/data_source/in_memory_user_data_source_impl.dart';
import 'package:learn_dart_together/17_test/practice_1/model/user.dart';

void main() async {
  UserRepositoryImpl userRepository =
      UserRepositoryImpl(InMemoryUserDataSourceImpl());

  group('createUser 테스트', () {
    test('정상적으로 추가되었는지 테스트', () async {
      final actual = await userRepository.createUser(User(
        name: 'John Doe',
        email: 'mmmkb3@naver.com',
        createdAt: DateTime.now(),
      ));

      expect(actual, '4 created');
    });

    test('이름 or 아이디 or 날짜가 비어있으면 에러 처리', () async {
      expect(
          () async => await userRepository.createUser(User(
                name: '',
                email: 'mmmkb4@gmail.com',
                createdAt: DateTime.now(),
              )),
          throwsException);
      expect(
          () async => await userRepository.createUser(User(
                name: 'John Dae',
                email: '',
                createdAt: DateTime.now(),
              )),
          throwsException);

      expect(
          () async => await userRepository.createUser(User(
                name: 'John Dae',
                email: 'mmmkb4@gmail.com',
                createdAt: null,
              )),
          throwsException);
    });

    test('id가 null이 아니면 에러 처리', () {
      expect(
          () async => await userRepository.createUser(User(
                id: 2,
                name: 'John Doe',
                email: 'aaa@naver.com',
                createdAt: DateTime.now(),
              )),
          throwsException);
    });

    test('이메일이 중복되는 경우 에러 처리', () async {
      expect(
          () async => await userRepository.createUser(User(
                name: 'John Doe',
                email: 'mmmkb1@naver.com',
                createdAt: DateTime.now(),
              )),
          throwsException);
    });
  });

  group('deleteUser 테스트', () {
    test('정상적으로 삭제되었는지 테스트', () async {
      final actual = await userRepository.deleteUser(2);
      expect(actual, '2 deleted');
    });
    test('존재하지 않는 id로 삭제 시 에러 처리', () async {
      expect(() async => await userRepository.deleteUser(10), throwsException);
    });
  });

  group('getAllUsers 테스트', () {
    test('모든 유저를 가져오는지 테스트', () async {
      final actual = await userRepository.getAllUsers();
      expect(actual.length, 3);
    });
  });

  group('getUser 테스트', () {
    test('정상적으로 유저를 가져오는지 테스트', () async {
      final actual = await userRepository.getUser(1);
      expect(actual.id, 1);
    });
    test('존재하지 않는 id로 가져오기 시 에러 처리', () async {
      expect(() async => await userRepository.getUser(10), throwsException);
    });
  });

  group('updateUser 테스트', () {
    test('정상적으로 유저를 업데이트하는지 테스트', () async {
      final actual = await userRepository.updateUser(User(
        id: 1,
        name: 'Hohn Doe',
        email: 'mmmkb5@naver.com',
        createdAt: DateTime.parse('2021-10-01 00:00:00'),
      ));
      expect(
        actual,
        User(
          id: 1,
          name: 'Hohn Doe',
          email: 'mmmkb5@naver.com',
          createdAt: DateTime.parse('2021-10-01 00:00:00'),
        ),
      );
    });

    test('존재하지 않는 id로 업데이트 시 에러 처리', () async {
      expect(
        () async => await userRepository.updateUser(
          User(
            id: 10,
            name: 'Hohn Doe',
            email: 'mmmkb5@naver.com',
            createdAt: DateTime.parse('2021-10-01 00:00:00'),
          ),
        ),
        throwsException,
      );
    });

    test('이름 or 아이디 or 날짜가 비어있으면 에러 처리', () async {
      expect(
          () async => await userRepository.updateUser(User(
                id: 1,
                name: '',
                email: 'mmmkb4@gmail.com',
                createdAt: DateTime.now(),
              )),
          throwsException);
      expect(
          () async => await userRepository.updateUser(User(
                id: 1,
                name: 'John Dae',
                email: '',
                createdAt: DateTime.now(),
              )),
          throwsException);

      expect(
          () async => await userRepository.updateUser(User(
                id: 1,
                name: 'John Dae',
                email: 'mmmkb4@gmail.com',
                createdAt: null,
              )),
          throwsException);
    });
  });

  group('findUserByEmail 테스트', () {
    test('이메일로 유저를 찾는지 테스트', () async {
      final actual = await userRepository.findUserByEmail('mmmkb5@naver.com');
      expect(
          actual,
          User(
              id: 1,
              name: 'Hohn Doe',
              email: 'mmmkb5@naver.com',
              createdAt: DateTime.parse('2021-10-01 00:00:00')));
    });

    test('존재하지 않는 이메일로 찾을 시 에러 처리', () async {
      expect(
          () async => await userRepository.findUserByEmail('mmmkb0@naver.com'),
          throwsException);
    });
  });
}
