import '../../../12_data_source/user/user.dart';
import '../data_source/user_data_source.dart';
import '../repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() => _userDataSource.getUsers();

  @override
  Future<List<User>> getUsersTop10ByUserName() =>
      _userDataSource.getUsersTop10ByUserName();
}
