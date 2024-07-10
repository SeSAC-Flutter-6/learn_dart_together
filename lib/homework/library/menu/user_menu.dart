import 'dart:io';

import 'package:learn_dart_together/homework/core/result.dart';
import 'package:learn_dart_together/homework/library/data/datasource/user_data_source_impl.dart';
import 'package:learn_dart_together/homework/library/data/model/user.dart';

import '../data/repository/user_repository_impl.dart';

class UserMenu {
  final userDataSourceImpl = UserDataSourceImpl();
  final userRepositoryImpl = UserRepositoryImpl(UserDataSourceImpl());

  Future<void> showUserMenu() async {
    while (true) {
      print('0.뒤로  1.회원조회  2.회원등록  3.회원수정  4.회원삭제  5.삭제취소');
      int subMenu = int.parse(stdin.readLineSync()!);

      if (subMenu == 0) {
        break;
      }

      switch (subMenu) {
        case 1:
          print("회원 조회 기능 실행");
          await getUsers();
          break;
        case 2:
          print("회원 등록 기능 실행");
          await createUser();
          break;
        case 3:
          print("회원 수정 기능 실행");
          await updateUser();
          break;
        case 4:
          print("회원 삭제 기능 실행");
          await deleteUser();
          break;
        case 5:
          print("삭제 취소 기능 실행");
          await cancelDelete();
          break;
        default:
          print("잘못된 입력입니다. 다시 선택해 주세요.");
      }
    }
  }

  Future<void> getUsers() async {
    final result = await userRepositoryImpl.getUsers();
    switch (result) {
      case Success<List<User>>():
        if (result.data.isEmpty) {
          print('등록된 회원이 없습니다.');
        } else {
          print('회원목록');
          for (var e in result.data) {
            print(e.toString().substring(0, e.toString().length - 1));
          }
        }
      case Error<List<User>>():
        print('회원조회 실패');
    }
  }

  Future<void> createUser() async {
    print('이름을 입력하세요');
    final name = stdin.readLineSync();
    print('주소를 입력하세요');
    final address = stdin.readLineSync();
    print('연락처를 입력하세요 ex) 010-1234-5678');
    final phoneNumber = stdin.readLineSync();
    print('생년월일을 입력하세요 ex) 2000/01/01');
    final birthday = stdin.readLineSync();
    print('가입한 날짜를 입력하세요 ex) 2024/01/01');
    final joinDate = stdin.readLineSync();

    User user = User(
      id: 0,
      name: name!,
      address: address!,
      phoneNumber: phoneNumber!,
      birthday: birthday!,
      joinedDate: joinDate!,
    );

    final result = await userRepositoryImpl.createUser(user);
    switch (result) {
      case Success<void>():
        print('$name 회원이 등록되었습니다.');
      case Error<void>():
        print('회원등록 실패');
    }
  }

  Future<void> updateUser() async {
    print('수정할 회원 id를 입력하세요');
    final id = int.parse(stdin.readLineSync()!);
    print('변경할 이름을 입력하세요');
    final name = stdin.readLineSync();
    print('변경할 주소를 입력하세요');
    final address = stdin.readLineSync();
    print('변경할 연락처를 입력하세요 ex) 010-1234-5678');
    final phoneNumber = stdin.readLineSync();
    print('변경할 생년월일을 입력하세요 ex) 2000/01/01');
    final birthday = stdin.readLineSync();
    print('변경할 가입한 날짜를 입력하세요 ex) 2024/01/01');
    final joinDate = stdin.readLineSync();

    User user = User(
      id: id,
      name: name!,
      address: address!,
      phoneNumber: phoneNumber!,
      birthday: birthday!,
      joinedDate: joinDate!,
    );

    final result = await userRepositoryImpl.updateUser(id, user);
    switch (result) {
      case Success<void>():
        print('$name 회원정보가 변경되었습니다.');
      case Error<void>():
        print('회원수정 실패');
    }
  }

  Future<void> deleteUser() async {
    print('삭제할 회원 id를 입력하세요');
    final id = int.parse(stdin.readLineSync()!);
    final result = await userRepositoryImpl.deleteUser(id);
    switch (result) {
      case Success<void>():
        print('삭제되었습니다.');
      case Error<void>():
        print('회원삭제 실패');
    }
  }

  Future<void> cancelDelete() async {
    final result = await userRepositoryImpl.cancelDelete();
    switch (result) {
      case Success<void>():
        print('회원정보를 복구하였습니다.');
      case Error<void>():
        print('복구 실패');
    }
  }
}
