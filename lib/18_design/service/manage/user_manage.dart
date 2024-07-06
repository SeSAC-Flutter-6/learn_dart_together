import 'dart:io';
import 'dart:math';

import 'package:learn_dart_together/18_design/core/result.dart';
import 'package:learn_dart_together/18_design/utils/parse_phone.dart';

import '../../data/model/user.dart';
import '../../data/repository_impl/user_repository_impl.dart';
import '../../utils/parse_birth_date.dart';
import 'package:intl/intl.dart';

class UserManage {
  final UserRepositoryImpl _userRepositoryImpl;

  UserManage(this._userRepositoryImpl);

  Future<void> manage() async {
    print('0. 뒤로\t\t1. 회원조회\t\t2. 회원등록\t\t 3. 회원수정\t\t 4. 회원삭제\t\t5. 삭제취소');
    final input = stdin.readLineSync();
    while (true) {
      switch (input) {
        case '0':
          return;
        case '1':
          final users = await getUsers();
          if (users.isEmpty) {
            print('아무 회원도 없습니다.');
          } else {
            print(users);
          }
          return;
        case '2':
          await createUser();
          return;
        case '3':
          await updateUser();
          return;
        case '4':
          await deleteUser();
          return;
        case '5':
          await cancelDelete();
          return;
        case _:
          print('잘못된 입력');
          return;
      }
    }
  }

  Future<List<User>> getUsers() async {
    final getUsersResult = await _userRepositoryImpl.getUsers();
    switch (getUsersResult) {
      case Success(:final data):
        return data;
      case Error(:final e):
        print(e);
    }
    return [];
  }

  Future<void> createUser() async {
    DateTime now = DateTime.now();
    final users = await getUsers();
    int id = 1;
    for (User user in users) {
      id = max(user.id, id);
    }
    id += 1;

    final (name, address, phone, birthDate) = inputUserInfo();

    final newUser = User(
      id: id,
      name: name,
      registeredData: now,
      address: address,
      phone: phone,
      birth: birthDate,
    );

    final createUserResult = await _userRepositoryImpl.createUser(newUser);
    switch (createUserResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
    }
  }

  (String, String, String, DateTime) inputUserInfo() {
    print('회원 등록 시작');
    print('이름을 입력해주세요');
    final name = stdin.readLineSync() ?? '';
    print('주소을 입력해주세요');
    final address = stdin.readLineSync() ?? '';
    print('핸드폰 번호를 입력해주세요 ex)01089651182');

    String phone;
    while (true) {
      phone = stdin.readLineSync() ?? '';
      if (isValidatePhoneNumber(phone)) break;
      print('잘못된 형식을 입력했습니다.');
    }

    print('생년월일을 입력해주세요 ex)19961216');

    String birth;
    DateTime birthDate;
    while (true) {
      birth = stdin.readLineSync() ?? '';
      if (!isValidateBrith(birth)) {
        print('잘못된 형식을 입력했습니다.');
        continue;
      }

      birthDate = parseBirthDate(birth);
      break;
    }

    return (name, address, phone, birthDate);
  }

  Future<User> findByName() async {
    while (true) {
      print('찾을 회원의 이름을 입력해주세요.');
      final targetName = stdin.readLineSync() ?? '';
      final findByNameResult = await _userRepositoryImpl.findByName(targetName);
      switch (findByNameResult) {
        case Success(:final data):
          return data;
        case Error(:final e):
          print('찾으려는 회원이 없습니다. 다시 입력해주세요.');
      }
    }
  }

  Future<void> updateUser() async {
    final users = await getUsers();
    if (users.isEmpty) {
      print('갱신 할 유저가 없습니다.');
      return;
    }
    print(users);

    final targetUser = await findByName();

    print('회원의 정보를 모두 새로 입력합니다.');
    final (name, address, phone, birthDate) = inputUserInfo();
    final copyUser = targetUser.copyWith(
        name: name, address: address, phone: phone, birth: birthDate);

    final updateUserResult =
        await _userRepositoryImpl.updateUser(targetUser.id, copyUser);

    switch (updateUserResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
        throw Exception(e);
    }
  }

  Future<void> deleteUser() async {
    final users = await getUsers();
    if (users.isEmpty) {
      print('삭제 할 유저가 없습니다.');
      return;
    }
    print(users);

    final targetUser = await findByName();
    switch (await _userRepositoryImpl.deleteUser(targetUser.id)) {
      case Success(:final data):
        print('삭제가 완료되었습니다.');
      case Error(:final e):
        print(e);
    }
  }

  Future<void> cancelDelete() async {
    switch (await _userRepositoryImpl.cancelDelete()) {
      case Success(:final data):
        print('삭제가 취소되었습니다.');
      case Error(:final e):
        print('직전의 파일만 복구할 수 있습니다. 또는 이미 복구 되었습니다.');
    }
  }
}
