import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_user_api.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';
import 'package:learn_dart_together/21_design_pattern/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl([UserDataSource? userDataSource])
      : _userDataSource = userDataSource ?? MemoryUserApi();

  @override
  Future<List<User>> getUsers() {
    return _userDataSource.getUsers();
  }

  @override
  Future<User> getUser(int id) {
    return _userDataSource.getUser(id);
  }

  @override
  Future<User> createUser(User user) {
    return _userDataSource.createUser(user);
  }

  @override
  Future<User> deleteUser(int id) {
    return _userDataSource.deleteUser(id);
  }

  @override
  Future<User> updateUser(User user) {
    return _userDataSource.updateUser(user);
  }
}
