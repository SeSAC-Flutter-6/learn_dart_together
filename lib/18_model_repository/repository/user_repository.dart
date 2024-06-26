import 'package:learn_dart_together/18_model_repository/model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
  Future<List<User>> getUsersTop10ByName();
}
