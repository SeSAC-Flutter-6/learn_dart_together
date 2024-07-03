import 'package:learn_dart_together/18_dto_mapper/practice_2/data_source/user_data_souce.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_2/model/user.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_2/repository/user_repository.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_2/mapper/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getAllUsers() async {
    final data = await _userDataSource.getAllUsers();
    return data.map((e) => e.toUser()).toList();
  }
}
