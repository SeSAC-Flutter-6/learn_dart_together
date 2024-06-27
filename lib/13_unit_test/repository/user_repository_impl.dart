import 'package:learn_dart_together/13_unit_test/data_source/user_data_source.dart';
import 'package:learn_dart_together/13_unit_test/model/user.dart';
import 'package:learn_dart_together/13_unit_test/repository/user_repository.dart';

final class UserRepositoryException implements Exception {
  final String message;
  // final int errorCode;

  UserRepositoryException(this.message);

  @override
  String toString() => 'UserRepositoryException: $message';
}

final class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<void> createUser(User user) => _userDataSource.createUser(user);

  @override
  Future<void> deleteUser(int userId) => _userDataSource.deleteUser(userId);

  @override
  Future<User> findUserByEmail(String email) async {
    final users = await _userDataSource.getAllUsers();
    return users.firstWhere((e) => e.email == email, orElse: () => throw UserRepositoryException('일치하는 유저가 존재하지 않습니다.'));
  }

  @override
  Future<Set<User>> getAllUsers() => _userDataSource.getAllUsers();

  @override
  Future<User> getUser(int userId) => _userDataSource.getUser(userId);

  @override
  Future<void> updateUser(User user) => _userDataSource.updateUser(user);

}
