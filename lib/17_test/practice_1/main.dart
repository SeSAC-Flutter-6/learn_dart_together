import 'package:learn_dart_together/17_test/practice_1/model/user.dart';
import 'package:learn_dart_together/17_test/practice_1/repository/user_repository_impl.dart';
import 'package:learn_dart_together/17_test/practice_1/data_source/in_memory_user_data_source_impl.dart';

void main() async {
  // Map<String, dynamic> map = {
  //   'id': 1,
  //   'name': 'John Doe',
  //   'email': '',
  //   'createdAt': '2021-10-01 00:00:00'
  // };
  // final temp = DateTime.parse(map['createdAt'] as String);
  // print(temp.runtimeType);
  // print(temp);

  UserRepositoryImpl userRepository =
      UserRepositoryImpl(InMemoryUserDataSourceImpl());

  // print(
  //   await userRepository.createUser(
  //     User(
  //       name: 'John Doe',
  //       email: 'mmmkb1@empal.com',
  //       createdAt: DateTime.now(),
  //     ),
  //   ),
  // );
  // (await userRepository.getAllUsers()).forEach(print);
  // print('\n');

  // print(await userRepository.getUser(1));
  // print('\n');

  // print(
  //   await userRepository.updateUser(
  //     User(
  //       id: 1,
  //       name: 'Hohn Doe',
  //       email: '',
  //       createdAt: DateTime.now(),
  //     ),
  //   ),
  // );
  // (await userRepository.getAllUsers()).forEach(print);
  // print('\n');

  // print(await userRepository.deleteUser(10));
  // (await userRepository.getAllUsers()).forEach(print);
  // print('\n');

  // Find user by email
  userRepository.findUserByEmail('mmmkb1@naver.com').then((value) {
    print(value);
  });
}
