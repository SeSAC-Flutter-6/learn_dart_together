import 'package:learn_dart_together/20_dto_mapper/dto/user_dto.dart';
import 'package:learn_dart_together/20_dto_mapper/mapper/user_mapper.dart';
import 'package:learn_dart_together/20_dto_mapper/repository/user_repository.dart';
import 'package:learn_dart_together/20_dto_mapper/model/user.dart';
import 'package:learn_dart_together/20_dto_mapper/data_source/user_api.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _client;

  UserRepositoryImpl({UserApi? client}) : _client = client ?? UserApi();
  @override
  Future<List<User>> getUsers() async {
    try {
      List<UserDto> users = await _client.getUser();
      List<User> userList = users.map((dto) => dto.toUser()).toList();
      return userList;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}
