import 'package:learn_dart_together/12_data_source/user.dart';

abstract interface class UserService {
  Future<User> getUser({required int userId});
  Future<List<User>> getUserList();
}
