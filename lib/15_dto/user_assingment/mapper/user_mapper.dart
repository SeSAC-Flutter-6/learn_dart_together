import 'package:learn_dart_together/15_dto/user_assingment/dto/user_dto.dart';

import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      name: name ?? '',
      email: email ?? '',
      latitude: double.parse(address?.geo?.lat ?? '0.0'),
      londtitude: double.parse(address?.geo?.lng ?? '0.0'),
    );
  }
}
