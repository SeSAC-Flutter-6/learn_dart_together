import 'package:collection/collection.dart';
import 'package:learn_dart_together/20_test/user/data_source/user_data_source.dart';
import 'package:learn_dart_together/20_test/user/repository/user_repository.dart';
import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  int _id = 4;

  @override
  Future<void> createUser({required String name, required String email}) async {
    final data = await getAllUsers();
    if (data.firstWhereOrNull((e) => e.email == email) != null) {
      throw Exception('이미 사용중인 email 입니다.');
    }
    final user = User(
        id: ++_id,
        name: name,
        email: email,
        createdAt: DateTime.now().toString());
    _userDataSource.addUser(user);
  }

  @override
  Future<void> deleteUser({required int id}) async {
    final user = await getUser(id: id);
    if (user == null) {
      throw Exception('찾는 ID가 없습니다.');
    }
    _userDataSource.deleteUser(user);
  }

  @override
  Future<User?> findUserByEmail({required String email}) async {
    return (await getAllUsers()).firstWhereOrNull((e) => e.email == email);
  }

  @override
  Future<List<User>> getAllUsers() async {
    return await _userDataSource.fetchUsers();
  }

  @override
  Future<User?> getUser({required int id}) async {
    return (await getAllUsers()).firstWhereOrNull((e) => e.id == id);
  }

  @override
  Future<void> updateUser(
      {required int id, String? name, String? email}) async {
    final data = await getAllUsers();
    final user = await getUser(id: id);
    if (user == null) {
      throw Exception('찾는 ID가 없습니다. ');
    }
    if (data.firstWhereOrNull((e) => e.email == email) != null) {
      throw Exception('이미 사용중인 email 입니다.');
    }
    _userDataSource.updateUser(user.copyWith(name: name, email: email));
  }
}
