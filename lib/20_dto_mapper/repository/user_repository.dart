import 'package:learn_dart_together/20_dto_mapper/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
}
