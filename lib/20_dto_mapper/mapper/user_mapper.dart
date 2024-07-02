import 'package:learn_dart_together/20_dto_mapper/dto/user_dto.dart';
import 'package:learn_dart_together/20_dto_mapper/model/user.dart';

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
