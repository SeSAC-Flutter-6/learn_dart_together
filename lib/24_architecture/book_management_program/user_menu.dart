import 'dart:io';

import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/user_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/main.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/user.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/user_repository_impl.dart';

class UserMenu {
  Future<void> showUsers() async {
    final result =
        await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
            .getUsers();
    switch (result) {
      case Success<List<User>, ErrorType>():
        if (result.data.isEmpty) {
          print('회원목록이 비어있습니다.');
        } else {
          for (var e in result.data) {
            print(
                '${e.toString().substring(0, e.toString().length - 1)}, age : ${e.age})');
          }
        }
      case Error<List<User>, ErrorType>():
        switch (result.error) {
          case ErrorType.readError:
            print('정보를 불러오는데 실패했습니다.');
          case ErrorType.noDataError:
            print('정보를 찾을 수 없습니다.');
          case ErrorType.failure:
            print('처리에 실패했습니다.');
        }
    }
  }

  Future<void> registerUser() async {
    print('이름을 입력하세요');
    final name = stdin.readLineSync();
    print('주소를 입력하세요');
    final address = stdin.readLineSync();
    print(' - 를 포함한 연락처를 입력하세요');
    final phoneNumber = stdin.readLineSync();
    print('생년월일을 입력하세요 형식 : (YYYY/mm/DD)');
    final birthday = stdin.readLineSync();
    if (name!.isNotEmpty &&
        address!.isNotEmpty &&
        phoneNumber!.isNotEmpty &&
        birthday!.isNotEmpty) {
      final result =
          await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
              .createUser(
                  name: name,
                  address: address,
                  phoneNumber: phoneNumber,
                  birthday: birthday);
      switch (result) {
        case Success<User, ErrorType>():
          print('추가되었습니다.');
        case Error<User, ErrorType>():
          switch (result.error) {
            case ErrorType.readError:
              print('정보를 불러오는데 실패했습니다.');
            case ErrorType.noDataError:
              print('정보를 찾을 수 없습니다.');
            case ErrorType.failure:
              print('처리에 실패했습니다.');
          }
      }
    } else {
      print('모든 정보를 입력하세요.');
    }
  }

  Future<void> updateUser() async {
    print('수정할 회원의 id를 입력하세요');
    final id = stdin.readLineSync();
    print('변경하실 이름을 입력하세요');
    final name = stdin.readLineSync();
    print('변경하실 주소를 입력하세요');
    final address = stdin.readLineSync();
    print('변경하실 연락처를 입력하세요');
    final phoneNumber = stdin.readLineSync();
    print('변경하실 생년월일을 입력하세요 형식 : (YYYY/mm/DD)');
    final birthday = stdin.readLineSync();
    if (id!.isNotEmpty) {
      if (name!.isEmpty &&
          address!.isEmpty &&
          phoneNumber!.isEmpty &&
          birthday!.isEmpty) {
        print('수정할 값이 없습니다.');
      } else {
        final inputId = int.parse(id);
        final result =
            await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
                .updateUser(
          id: inputId,
          name: name!.isEmpty ? null : name,
          address: address!.isEmpty ? null : address,
          phoneNumber: phoneNumber!.isEmpty ? null : phoneNumber,
          birthday: birthday!.isEmpty ? null : birthday,
        );
        switch (result) {
          case Success<void, ErrorType>():
            print('수정되었습니다.');
          case Error<void, ErrorType>():
            switch (result.error) {
              case ErrorType.readError:
                print('정보를 불러오는데 실패했습니다.');
              case ErrorType.noDataError:
                print('해댱 id에 대한 회원 정보를 찾을 수 없습니다.');
              case ErrorType.failure:
                print('처리에 실패했습니다.');
            }
        }
      }
    } else {
      print('id는 반드시 입력해야 합니다.');
    }
  }

  Future<void> deleteUser() async {
    print('삭제할 회원의 id를 입력하세요');
    final id = stdin.readLineSync();
    if (id != null) {
      try {
        final inputId = int.parse(id);
        final result =
            await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
                .deleteUser(id: inputId);
        switch (result) {
          case Success<void, ErrorType>():
            print('삭제되었습니다.');
          case Error<void, ErrorType>():
            switch (result.error) {
              case ErrorType.readError:
                print('정보를 불러오는데 실패했습니다.');
              case ErrorType.noDataError:
                print('해댱 id에 대한 회원 정보를 찾을 수 없습니다.');
              case ErrorType.failure:
                print('처리에 실패했습니다.');
            }
        }
      } catch (e) {
        print('id는 반드시 입력해야 합니다.');
      }
    }
  }

  Future<void> findUser() async {
    print('찾으시는 회원 id를 입력하세요.');
    final data = stdin.readLineSync();
    if (data != null) {
      try {
        final inputId = int.parse(data);
        final result =
            await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
                .getUser(id: inputId);
        switch (result) {
          case Success<User, ErrorType>():
            print(result.data);
          case Error<User, ErrorType>():
            switch (result.error) {
              case ErrorType.readError:
                print('정보를 불러오는데 실패했습니다.');
              case ErrorType.noDataError:
                print('해댱 id에 대한 회원 정보를 찾을 수 없습니다.');
              case ErrorType.failure:
                print('처리에 실패했습니다.');
            }
        }
      } catch (e) {
        print('입력값이 없습니다.');
      }
    }
  }

  Future<void> cancelDelete() async {
    print('마지막에 삭제한 회원 정보를 복구하시겠습니까?');
    print('1.네  2.아니요');
    final answer = stdin.readLineSync();
    switch (answer) {
      case '':
        print('취소되었습니다.');
        showUserMenu();
      case '1':
        final result =
            await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
                .cancelDelete();
        switch (result) {
          case Success<void, ErrorType>():
            print('복구되었습니다.');
          case Error<void, ErrorType>():
            switch (result.error) {
              case ErrorType.readError:
                print('정보를 불러오는데 실패했습니다.');
              case ErrorType.noDataError:
                print('복구할 회원 정보가 없습니다. ');
              case ErrorType.failure:
                print('처리에 실패했습니다.');
            }
        }
      case '2':
        print('이전 화면으로 되돌아갑니다.');
        showUserMenu();
    }
  }
}
