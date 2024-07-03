import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/address.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/company.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/user_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/model/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(
      name: name ?? '',
      email: email ?? '',
      latitude: double.tryParse(address?.geo?.lat ?? '') ?? 0.0,
      longitude: double.tryParse(address?.geo?.lng ?? '') ?? 0.0,
    );
  }
}

extension UserDtoMapper on User {
  UserDto toDto({
    int? id,
    String? username,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UserDto(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address,
      phone: phone,
      website: website,
      company: company,
    );
  }
}
