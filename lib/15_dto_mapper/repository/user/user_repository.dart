import 'package:learn_dart_together/15_dto_mapper/model/user/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
  Future<User?> getUserbyName(String name);
}
