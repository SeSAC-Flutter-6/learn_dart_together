import 'package:collection/collection.dart';
import 'package:learn_dart_together/18_model_repository/data_source/user_data_source.dart';
import 'package:learn_dart_together/18_model_repository/model/user.dart';
import 'package:learn_dart_together/18_model_repository/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    UserApi userApi = UserApi();
    return userApi.getUsers();
  }

  @override
  Future<List<User>> getUsersTop10ByName() async {
    UserApi userApi = UserApi();
    final List<User> users = await userApi.getUsers();
    List<User> usersTop10ByUserName =
        users.sorted((a, b) => a.name.compareTo(b.name)).sublist(0, 10);
    return usersTop10ByUserName;
  }
}
