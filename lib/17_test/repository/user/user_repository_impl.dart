import 'package:learn_dart_together/17_test/repository/user/user_repository.dart';

import '../../data_source/user/user_data_source.dart';
import '../../model/user.dart';

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
    try {
      await _userDataSource.deleteUser(userId);
    } catch (e) {
      throw ('$userId 유저를 찾을 수 없습니다.');
    }
  }

  @override
  Future<User> findUserByEmail(String email) async {
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
    try {
      return await _userDataSource.getUser(userId);
    } catch (e) {
      throw ('$userId 유저를 찾을 수 없습니다.');
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      return await _userDataSource.updateUser(user);
    } catch (e) {
      throw ('유저를 찾을 수 없습니다.');
    }
  }
}
