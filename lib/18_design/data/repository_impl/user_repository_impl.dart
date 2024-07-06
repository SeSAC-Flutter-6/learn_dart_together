import 'package:collection/collection.dart';
import 'package:learn_dart_together/18_design/core/result.dart';
import 'package:learn_dart_together/18_design/data/data_source/user_data_source.dart';
import 'package:learn_dart_together/18_design/data/model/user.dart';
import 'package:learn_dart_together/18_design/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Result<void>> cancelDelete() async {
    try {
      final result = await _userDataSource.cancelDelete();
      return Result.success(result);
    } catch (e) {
      return Result.error('cancelDelete error');
    }
  }

  @override
  Future<Result<User>> createUser(User user) async {
    try {
      final result = await _userDataSource.createUser(user);
      return Result.success(result);
    } catch (e) {
      return Result.error('createUser error');
    }
  }

  @override
  Future<Result<User>> deleteUser(int id) async {
    try {
      final result = await _userDataSource.deleteUser(id);
      return Result.success(result);
    } catch (e) {
      return Result.error('deleteUser error');
    }
  }

  @override
  Future<Result<User?>> getUser(int id) async {
    try {
      final result = await _userDataSource.getUser(id);
      return Result.success(result);
    } catch (e) {
      return Result.error('getUser error');
    }
  }

  @override
  Future<Result<List<User>>> getUsers() async {
    try {
      final result = await _userDataSource.getUsers();
      return Result.success(result);
    } catch (e) {
      return Result.error('getUsers error');
    }
  }

  @override
  Future<Result<User>> updateUser(int targetId, User user) async {
    try {
      final result = await _userDataSource.updateUser(targetId, user);
      return Result.success(result);
    } catch (e) {
      return Result.error('updateUser error');
    }
  }

  @override
  Future<Result<User>> findByName(String name) async {
    try {
      final getUsersResult = await _userDataSource.getUsers();
      final user =
          getUsersResult.singleWhereOrNull((user) => user.name == name);

      if (user == null) throw Result.error('not find User');

      return Result.success(user);
    } catch (e) {
      return Result.error('findUser error');
    }
  }
}
