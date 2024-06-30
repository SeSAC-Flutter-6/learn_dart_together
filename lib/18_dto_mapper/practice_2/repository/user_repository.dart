import 'package:learn_dart_together/18_dto_mapper/practice_2/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getAllUsers();
}
