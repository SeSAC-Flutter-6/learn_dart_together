import 'package:learn_dart_together/18_data_source/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>> getUsersTop10ByUserName();
}
