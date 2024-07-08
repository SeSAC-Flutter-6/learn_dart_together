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
      } //없으면 알려주는 로직
      return Result.success(user);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUserCreate(User user) async {
    try {
      List<User> users = jsonList
          .map((jsonItem) => User.fromJson(jsonItem as Map<String, dynamic>))
          .toList();
      if (!users.contains(user)) {
        users.add(user);
        print('user 정보가 가입되었습니다.');
      } else {
        print('user 정보가 이미 존재합니다.');
      } //없으면 알려주는 로직
      return Result.success(user);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUserRead(int id) async {
    try {
      List<User> users = jsonList
          .map((jsonItem) => User.fromJson(jsonItem as Map<String, dynamic>))
          .toList();
      final User selectedUser = users.firstWhere((e) => e.id == id);
      if (selectedUser != null) {
        print('ID 검색 성공');
      } else {
        print('없는 유저ID 입니다.');
      } //없으면 알려주는 로직
      return Result.success(selectedUser);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<User, NetworkError>> getUserUpdate(User user) async {
    try {
      List<User> users = jsonList
          .map((jsonItem) => User.fromJson(jsonItem as Map<String, dynamic>))
          .toList();
      final User selectedUser = users.firstWhere((e) => e.id == user.id);
      if (selectedUser != null) {
        final int selectedUserIndex = users.indexOf(selectedUser);
        users.remove(selectedUser); //기존유저
        users.insert(selectedUserIndex, user);
        //업데이트된 유저(같은 인덱스에 넣을 수도 있는 방법 공부)
        //selectedUser 인덱스를 확인 한 후에 insert로 기존 user 인덱스 위치에 다시 들어간다
      } else {
        print('user 정보가 존재하지 않습니다.');
      } //없으면 알려주는 로직
      return Result.success(user);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
