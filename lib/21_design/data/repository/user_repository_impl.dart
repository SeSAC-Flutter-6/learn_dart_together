import 'dart:async';

import 'package:learn_dart_together/21_design/core/result.dart';
import 'package:learn_dart_together/21_design/data/data_source/user_data_source_api.dart';
import 'package:learn_dart_together/21_design/data/model/user.dart';
import 'package:learn_dart_together/21_design/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Result<List<User>, NetworkError>> fetchReadUsers() async {
    // List를 User 객체 리스트로 변환
    try {
      List<User> users = jsonList
          .map((jsonItem) => User.fromJson(jsonItem as Map<String, dynamic>))
          .toList();
      return Result.success(users);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUserDelete(User user) async {
    try {
      List<User> users = jsonList
          .map((jsonItem) => User.fromJson(jsonItem as Map<String, dynamic>))
          .toList();
      if (users.contains(user)) {
        users.remove(user);
        print('user 정보가 삭제되었습니다.');
      } else {
        print('user 정보가 없습니다.');
      }//없으면 알려주는 로직
      return Result.success(user);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, Error>> getUserCreate(User user) {
    // TODO: implement getUserCreate
    throw UnimplementedError();
  }

  @override
  Future<Result<User, Error>> getUserRead(int id) {
    // TODO: implement getUserRead
    throw UnimplementedError();
  }

  @override
  Future<Result<User, Error>> getUserUpdate(User user) {
    // TODO: implement getUserUpdate
    throw UnimplementedError();
  }
}
