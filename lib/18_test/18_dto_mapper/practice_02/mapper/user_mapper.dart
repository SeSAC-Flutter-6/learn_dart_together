import 'package:learn_dart_together/18_test/18_dto_mapper/practice_02/dto/user_dto/user_dto.dart';

import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      name: name!,
      email: email!,
      latitude: double.parse(address?.geo?.lat ?? '0.0'),
      longitude: double.parse(address?.geo?.lng ?? '0.0'),
    );
  }
}
