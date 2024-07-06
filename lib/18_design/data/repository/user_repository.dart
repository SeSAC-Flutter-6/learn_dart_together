import 'package:learn_dart_together/18_design/data/model/user.dart';

import '../../core/result.dart';

abstract interface class UserRepository {
  Future<Result<List<User>>> getUsers();

  Future<Result<User?>> getUser(int id);

  Future<Result<User>> createUser(User user);

  Future<Result<User>> updateUser(int targetId, User user);

  Future<Result<User>> deleteUser(int id);

  Future<Result<void>> cancelDelete();

  Future<Result<User>> findByName(String name);
}
