abstract interface class UserApi {
  // 서버에서 모든 유저 가져오기
  Future<List<Map<String, dynamic>>> getAllUsers();

  // 서버에서 아이디 기반으로 하나의 유저 가져오기
  Future<Map<String, dynamic>?> getUser(int userId);

  // 서버에서 아이디 기반으로 유저 지우기
  Future<void> deleteUser(int userId);

  // 유저 생성하기
  Future<void> createUser(Map<String, dynamic> user);

  // 유저정보 업데이트
  Future<void> updateUser(Map<String, dynamic> user);

  // 유효한 유저인지 체크
  Future<bool> checkUserExists(int userId);
}
