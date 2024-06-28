//여기서 실제 구현체를 구현
import 'package:learn_dart_together/18_test/code_01/model/user.dart';
import 'package:learn_dart_together/18_test/code_01/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser() async {
    return User(name: 'user', id: null, email: '', created_At: null);
  }

  @override
  Future<User> createUser(Object user) {

    }

  @override
  Future<void> deleteUser(int id) {
     }

  @override
  Future<List<User>> fetchAllUsers() {
    }

  @override
  Future<User> fetchUser(int id) {
     }

  @override
  Future<User> findUserByEmail(String email) {
     }

  @override
  Future<User> updateUser(User user) {
     }
}