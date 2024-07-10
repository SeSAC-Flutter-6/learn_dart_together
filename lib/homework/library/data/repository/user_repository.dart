import 'package:learn_dart_together/homework/library/data/model/user.dart';

import '../../../core/result.dart';

abstract interface class UserRepository {
  Future<Result<List<User>>> getUsers();

  Future<Result<void>> createUser(User user);

  Future<Result<void>> updateUser(int id, User user);

  Future<Result<void>> deleteUser(int id);

  Future<Result<void>> cancelDelete();
}
