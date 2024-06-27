
import 'package:learn_dart_together/12_data_source/data_source/user_data_source.dart';
import 'package:learn_dart_together/12_data_source/dto/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
  Future<List<User>> getUsersTop10ByUserName();
}

final class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() => _userDataSource.getUsers();

  @override
  Future<List<User>> getUsersTop10ByUserName() => _userDataSource.getUsersTop10ByUserName();
}