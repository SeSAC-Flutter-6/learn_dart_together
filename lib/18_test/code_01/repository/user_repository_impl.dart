//여기서 실제 구현체를 구현
import 'package:learn_dart_together/18_test/code_01/model/user.dart';
import 'package:learn_dart_together/18_test/code_01/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> fetchAllUsers() {
    // TODO: implement fetchAllUsers
    throw UnimplementedError();
  }

  @override
  Future<User> fetchUser(int id) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }

  @override
  Future<User> findUserByEmail(String email) {
    // TODO: implement findUserByEmail
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}