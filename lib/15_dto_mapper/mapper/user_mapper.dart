import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/user_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/model/user/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      name: name ?? '',
      email: email ?? '',
      latitude: double.tryParse(address!.geo!.lat ?? '') ?? 0.0,
      longitude: double.tryParse(address!.geo!.lng ?? '') ?? 0.0,
    );
  }
}
