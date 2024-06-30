import 'package:learn_dart_together/18_dto_mapper/practice_2/dto/user_dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<List<UserDto>> getAllUsers();
}
