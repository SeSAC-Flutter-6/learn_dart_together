import 'package:learn_dart_together/19_unit_test/model/user.dart';
import 'package:learn_dart_together/19_unit_test/data_source/user_data_source.dart';
import 'package:learn_dart_together/19_unit_test/repository/user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({
    required UserDataSource userDataSource,
  }) : _userDataSource = userDataSource;

  @override
  Future<void> createUser(User user) async {
    final users = await getAllUsers();
    final emailExists = users.any((e) => e.email == user.email);

    if (emailExists) {
      throw ('이미 등록된 이메일 입니다.');
    }
    await _userDataSource.createUser(user);
  }

  @override
  Future<void> deleteUser(int userId) async {
    await _userDataSource.deleteUser(userId);
  }

  @override
  Future<User?> findUserByEmail(String email) async {
    final user = await getAllUsers();
    try {
      return user.firstWhere((e) => e.email == email);
    } catch (e) {
      throw ('등록된 이메일이 없습니다.');
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    return await _userDataSource.getAllUsers();
  }

  @override
  Future<User> getUser(int userId) async {
    return await _userDataSource.getUser(userId);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userDataSource.updateUser(user);
  }
}
