import 'package:learn_dart_together/15_dto_mapper/data_source/user/user_api.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/address.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/company.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/user_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/model/user.dart';
import 'package:learn_dart_together/15_dto_mapper/mapper/user_mapper.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  const UserRepositoryImpl({
    required UserApi userApi,
  }) : _userApi = userApi;

  @override
  Future<User> createUser({
    required String name,
    required String email,
    required double latitude,
    required double longitude,
    int? id,
    String? username,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        latitude: latitude,
        longitude: longitude,
      );

      UserDto userDto = user.toDto(
        id: id,
        username: username,
        address: address,
        phone: phone,
        website: website,
        company: company,
      );

      bool result = await _userApi.createUser(userDto);
      if (!result) {
        throw Exception('Failed to createUser');
      }
      return user;
    } catch (error) {
      throw Exception('Error creating user: $error');
    }
  }

  @override
  Future<User?> getUserbyName(String name) async {
    try {
      List<User> allUsers = await getUsers();
      for (var user in allUsers) {
        if (user.name == name) {
          return user;
        }
      }
      return null;
    } catch (error) {
      throw Exception('Error getting getUserbyName: $error');
    }
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      List<UserDto> userDtos = await _userApi.getUsers();
      List<User> users = userDtos.map((userDto) => userDto.toUser()).toList();
      return users;
    } catch (error) {
      throw Exception('Error getting users: $error');
    }
  }
}
