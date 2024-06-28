import 'package:learn_dart_together/21_dto/user/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<List<UserDto>> getUserDto();
}
