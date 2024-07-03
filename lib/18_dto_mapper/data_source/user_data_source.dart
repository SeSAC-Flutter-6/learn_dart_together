import 'package:learn_dart_together/18_dto_mapper/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<List<UserDto>> getUsers();
}
