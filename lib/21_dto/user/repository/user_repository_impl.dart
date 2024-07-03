import 'package:learn_dart_together/21_dto/user/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_dto/user/mapper/user_mapper.dart';
import 'package:learn_dart_together/21_dto/user/model/user.dart';
import 'package:learn_dart_together/21_dto/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    final data = await _userDataSource.getUserDto();
    return data.map((e) => e.toUser()).toList();
  }
}
