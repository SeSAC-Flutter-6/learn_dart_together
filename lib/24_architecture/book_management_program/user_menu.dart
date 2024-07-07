import 'dart:io';

import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/user_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/user.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/user_repository_impl.dart';

class UserMenu {
  Future<void> showUsers() async {
    final result =
        await UserRepositoryImpl(userDataSource: UserDataSourceImpl())
            .getUsers();
    switch (result) {
      case Success<List<User>, ErrorType>():
        for (var e in result.data) {
          print(
              '${e.toString().substring(0, e.toString().length - 1)}, age : ${e.age})');
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
    print('연락처를 입력하세요');
    final phoneNumber = stdin.readLineSync();
    print('생년월일을 입력하세요 (YYYY/mm/DD)');
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
}
