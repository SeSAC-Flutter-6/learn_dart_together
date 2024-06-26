import 'package:collection/collection.dart';
import 'package:learn_dart_together/18_data_source/user.dart';
import 'package:learn_dart_together/19_model_repository/repository/user_repository.dart';
import 'package:learn_dart_together/data_source/user_list_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await _userDataSource.getUserList();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final data = await _userDataSource.getUserList();
    return data
        .sorted((a, b) => a.userName.compareTo(b.userName))
        .take(10)
        .toList();
  }
}
