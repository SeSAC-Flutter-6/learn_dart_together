import 'package:learn_dart_together/homework/core/result.dart';
import 'package:learn_dart_together/homework/library/data/datasource/user_data_source.dart';
import 'package:learn_dart_together/homework/library/data/datasource/user_data_source_impl.dart';
import 'package:learn_dart_together/homework/library/data/repository/user_repository.dart';
import 'package:learn_dart_together/homework/library/data/model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Result<List<User>>> getUsers() async {
    try {
      final userData = await _userDataSource.getUsers();
      return Result.success(userData);
    } catch (e) {
      return Result.error('회원 조회 실패');
    }
  }

  @override
  Future<Result<void>> createUser(User user) async {
    try {
      final createUserData = await _userDataSource.createUser(user);
      return Result.success(createUserData);
    } catch (e) {
      return Result.error('회원 등록 실패');
    }
  }

  @override
  Future<Result<void>> updateUser(int id, User user) async {
    try {
      final updateUserData = await _userDataSource.updateUser(id, user);
      return Result.success(updateUserData);
    } catch (e) {
      return Result.error('회원 정보 수정 실패');
    }
  }

  @override
  Future<Result<void>> deleteUser(int id) async {
    try {
      final deleteUserData = await _userDataSource.deleteUser(id);
      return Result.success(deleteUserData);
    } catch (e) {
      return Result.error('회원 삭제 실패');
    }
  }

  @override
  Future<Result<void>> cancelDelete() async {
    try {
      final cancelDeleteData = await _userDataSource.cancelDelete();
      return Result.success(cancelDeleteData);
    } catch (e) {
      return Result.error('회원 복구 실패');
    }
  }
}
