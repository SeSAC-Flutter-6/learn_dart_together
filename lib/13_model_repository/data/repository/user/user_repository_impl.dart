import 'package:learn_dart_together/13_model_repository/data/data_source/user_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/user.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _userApi = UserApi();

  @override
  Future<List<User>> getUsers() async {
    try {
      final List<dynamic> userDataList = await _userApi.fetchAllData();
      return userDataList.map<User>((json) => User.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to getUsers');
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final List<dynamic> userDataList = await _userApi.fetchAllData();
      //username 정렬을 위해 데이터 재조립 후 정렬
      final List<Map<String, dynamic>> extractedUserDataList = userDataList
          .map((json) => {'username': json['username'], 'data': json})
          .toList()
        ..sort((a, b) => a['username'].compareTo(b['username']));

      // 상위 10개의 데이터를 User 객체로 리턴
      return extractedUserDataList
          .take(10)
          .map<User>(
              (extractedUserData) => User.fromJson(extractedUserData['data']))
          .toList();
    } catch (e) {
      throw Exception('Failed to getUsersTop10ByUserName');
    }
  }
}
