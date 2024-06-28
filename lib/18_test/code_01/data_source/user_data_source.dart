import '../model/user.dart';

//데이터소스는 재료를 준다(카레,짜장,짬뽕국물..)- 미네랄
abstract interface class UserDataSource {
  Future<User> createUser(User user);

  Future<User> getUser(int id);

  Future<User> updateUser(User user);

  Future<void> deleteUser(int id);

  Future<List<User>> getAllUsers();

  Future<User> findUserByEmail(String email);
}
