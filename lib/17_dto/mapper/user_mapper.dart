import 'package:learn_dart_together/17_dto/dto/user_dto.dart';
import '../model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      name: name ?? '',
      email: email ?? '',
      latitude: address?.geo?.lat == null
          ? 0.0
          : double.tryParse(address!.geo!.lat!) ?? 0.0,
      longitude: address?.geo?.lng == null
          ? 0.0
          : double.tryParse(address!.geo!.lng!) ?? 0.0,
    );
  }
}
