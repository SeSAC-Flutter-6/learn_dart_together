import 'package:learn_dart_together/15_dto/user_assingment/datasource/user_data_source.dart';
import 'package:learn_dart_together/15_dto/user_assingment/mapper/user_mapper.dart';
import 'package:learn_dart_together/15_dto/user_assingment/model/user.dart';
import 'package:learn_dart_together/15_dto/user_assingment/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDatesoruce;

  UserRepositoryImpl(this._userDatesoruce);

  @override
  Future<List<User>> getAllUsers() async {
    final userDto = await _userDatesoruce.getUsers();

    return userDto.map((dto) => dto.toUser()).toList();
  }

  @override
  Future<User?> getUser(String name) async {
    final userDto = await _userDatesoruce.getUser(name);

    return userDto?.toUser();
  }
}
