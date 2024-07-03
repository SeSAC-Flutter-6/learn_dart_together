import 'package:learn_dart_together/18_dto_mapper/data_source/user_data_source.dart';
import 'package:learn_dart_together/18_dto_mapper/mapper/user_mapper.dart';
import 'package:learn_dart_together/18_dto_mapper/repository/user_repository.dart';

import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDartSource;

  UserRepositoryImpl(this._userDartSource);

  @override
  Future<List<User>> getUsers() async {
    final userDto = await _userDartSource.getUsers();
    return userDto.map((dto) => dto.toUser()).toList();
  }
}
