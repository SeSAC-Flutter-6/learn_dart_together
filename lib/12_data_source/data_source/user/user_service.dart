import 'package:learn_dart_together/13_model_repository/data/model/user.dart';

abstract interface class UserService {
  Future<User> getUser({required int userId});
  Future<List<User>> getUserList();
}
