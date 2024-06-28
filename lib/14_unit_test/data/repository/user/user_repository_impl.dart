import 'package:learn_dart_together/14_unit_test/data/data_source/user/user_api.dart';
import 'package:learn_dart_together/14_unit_test/data/model/user.dart';
import 'package:learn_dart_together/14_unit_test/data/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  const UserRepositoryImpl({required UserApi userApi}) : _userApi = userApi;

  @override
  Future<bool> createUser(User user) async {
    try {
      bool userExists = await _userApi.checkUserExists(user.id);
      if (userExists) {
        return false;
      }
      await _userApi.createUser(user.toJson());
      return true;
    } catch (error) {
      throw Exception('Error creating user: $error');
    }
  }

  @override
  Future<User?> getUser(int userId) async {
    try {
      bool userExists = await _userApi.checkUserExists(userId);
      if (!userExists) {
        print('유저가 존재하지 않음');
        return null;
      }
      final userData = await _userApi.getUser(userId);

      return User.fromJson(userData!);
    } catch (error) {
      throw Exception('Error getting user: $error');
    }
  }

  @override
  Future<bool> updateUser(User updatedUser) async {
    try {
      bool userExists = await _userApi.checkUserExists(updatedUser.id);
      if (!userExists) {
        print('존재하지 않는 유저입니다');
        return false;
      }
      final userData = await _userApi.getUser(updatedUser.id);
      User user = User.fromJson(userData!);
      if (updatedUser == user) {
        print('업데이트할 정보가 없습니다');
        return false;
      }
      await _userApi.updateUser(updatedUser.toJson());
      return true;
    } catch (error) {
      throw Exception('Error updating user: $error');
    }
  }

  @override
  Future<bool> deleteUser(int userId) async {
    try {
      bool userExists = await _userApi.checkUserExists(userId);
      if (!userExists) {
        print('해당 유저가 존재하지 않습니다');
        return false;
      }
      await _userApi.deleteUser(userId);
      return true;
    } catch (error) {
      throw Exception('Error deleting user: $error');
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    try {
      final List<Map<String, dynamic>> userDataList =
          await _userApi.getAllUsers();
      if (userDataList.isEmpty) {
        return [];
      }
      return userDataList.map((json) => User.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Error fetching all users: $error');
    }
  }

  @override
  Future<User?> findUserByEmail(String email) async {
    try {
      final List<Map<String, dynamic>> userDataList =
          await _userApi.getAllUsers();
      if (userDataList.isEmpty) {
        print('존재하는 유저가 없습니다');
        return null;
      }
      for (var userData in userDataList) {
        if (userData['email'] == email) {
          return User.fromJson(userData);
        }
      }
      print('일치하는 이메일이 없습니다');
      return null;
    } catch (error) {
      throw Exception('Error finding user by email: $error');
    }
  }
}
