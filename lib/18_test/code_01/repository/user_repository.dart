//여기는 추상클래스로 구현체를 만들기 위해 선언만 해놓는다.
import '../model/user.dart';

abstract interface class UserRepository {
  Future<User> fetchUser(int id);//특정 데이터를 가져오는 메서드

  Future<User> createUser(User user);

  Future<User> updateUser(User user);

  Future<void> deleteUser(int id);

  Future<List<User>> fetchAllUsers();//특정 데이터를 가져오는 메서드

  Future<User> findUserByEmail(String email);

}