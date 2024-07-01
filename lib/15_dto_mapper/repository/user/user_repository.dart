import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/address.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/company.dart';
import 'package:learn_dart_together/15_dto_mapper/model/user.dart';

abstract interface class UserRepository {
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
  });
  Future<List<User>> getUsers();
  Future<User?> getUserbyName(String name);
}
