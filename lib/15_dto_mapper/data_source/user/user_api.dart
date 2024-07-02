import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/user_dto.dart';

abstract interface class UserApi {
  Future<bool> createUser(UserDto user);
  Future<List<UserDto>> getUsers();
}
