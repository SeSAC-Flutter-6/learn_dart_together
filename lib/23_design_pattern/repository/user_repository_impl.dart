import 'package:learn_dart_together/23_design_pattern/data_source/user_csv.dart';
import 'package:learn_dart_together/23_design_pattern/model/user.dart';
import 'package:learn_dart_together/23_design_pattern/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CsvApi _client;

  UserRepositoryImpl({CsvApi? client}) : _client = client ?? CsvApi();

  List<User> _userList = [];
  List<User> _deletedUserList = []; // 삭제된 사용자를 저장할 리스트

  int _currentId = 0;


//사용자 정보 생성
  @override
  bool addUser(User user) {
    _userList.add(user);
    return true;
  }
// 사용자 목록 보기
  @override
  List<User> getAllUsers() {
    return _userList;
  }
//ID로 사용자 정보 확인
  @override
  User? getUserById(int id) {
    return _userList.firstWhere((user) => user.id == id);
  }
//사용자 정보 업데이트
  @override
  void updateUser(int id, User user) {
    var index = _userList.indexWhere((u) => u.id == id);
    if (index != -1) {
      _userList[index] = user;
    }
  }

  @override
  void deleteUser(int id) {
    _userList.removeWhere((user) => user.id == id);
  }
//ID로 사용자 정보 확인
  @override
  int generateUserId() {
    return _currentId++;
  }
//사용자 정보 저장
  @override
  Future<void> saveUsers() async {
    await _client.saveUser(_userList);
  }

  @override
  User? undoDeleteUser(int id)  {
    User? userToRestore = _deletedUserList.firstWhere((user) => user.id == id,);
    if (userToRestore != null) {
      _deletedUserList.remove(userToRestore);
      _userList.add(userToRestore); // 삭제된 사용자를 다시 추가
      return userToRestore;
    _client.saveUser(_userList);

    }
    return null;
  }

}

