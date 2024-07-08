import 'dart:io';

import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/book_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/borrow_info_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/user_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/borrow_info.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/book_repository_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/borrow_info_repository_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/user_repository_impl.dart';

class BorrowInfoMenu {
  final _repository = BorrowInfoRepositoryImpl(
      borrowInfoDataSource: BorrowInfoDataSourceImpl(),
      bookRepository: BookRepositoryImpl(bookDataSource: BookDataSourceImpl()),
      userRepository: UserRepositoryImpl(userDataSource: UserDataSourceImpl()));

  Future<void> showBorrowInfo() async {
    final result = await _repository.getBorrowInfo();
    switch (result) {
      case Success<List<BorrowInfo>, ErrorType>():
        if (result.data.isEmpty) {
          print('대출목록이 비어있습니다.');
        } else {
          result.data.forEach(print);
        }
      case Error<List<BorrowInfo>, ErrorType>():
        switch (result.error) {
          case ErrorType.readError:
            print('정보를 불러오는데 실패했습니다.');
          case ErrorType.noDataError:
            print('대출 정보를 찾을 수 없습니다.');
          case ErrorType.failure:
            print('처리에 실패했습니다.');
        }
    }
  }

  Future<void> borrowBook() async {
    print('대출할 책 id를 입력하세요');
    final bookId = stdin.readLineSync();
    print('회원 id를 입력하세요');
    final userId = stdin.readLineSync();
    if (bookId!.isNotEmpty && userId!.isNotEmpty) {
      final result =
          await _repository.borrowBook(int.parse(bookId), int.parse(userId));
      switch (result) {
        case Success<BorrowInfo, ErrorType>():
          print('대출성공하였습니다.');
        case Error<BorrowInfo, ErrorType>():
          switch (result.error) {
            case ErrorType.readError:
              print('정보를 불러오는데 실패했습니다.');
            case ErrorType.noDataError:
              print('대출 불가합니다.');
            case ErrorType.failure:
              print('처리에 실패했습니다.');
          }
      }
    } else {
      print('책 정보와 id를 다시 한번 확인하세요');
    }
  }

  Future<void> returnBook() async {
    print('반납할 책의 id를 입력하세요');
    final id = stdin.readLineSync();
    if (id != null) {
      try {
        final intId = int.parse(id);
        final result = await _repository.returnBook(intId);
        switch (result) {
          case Success<void, ErrorType>():
            print('정상적으로 반납되었습니다.');
          case Error<void, ErrorType>():
            switch (result.error) {
              case ErrorType.readError:
                print('정보를 불러오는데 실패했습니다.');
              case ErrorType.noDataError:
                print('대출이력이 없습니다.');
              case ErrorType.failure:
                print('처리에 실패했습니다.');
            }
        }
      } catch (e) {
        print('id를 입력하세요.');
      }
    }
  }

  Future<void> renewBook() async {
    print('연장할 책의 id를 입력하세요');
    final id = stdin.readLineSync();
    if (id != null) {
      try {
        final intId = int.parse(id);
        final result = await _repository.renewBook(intId);
        switch (result) {
          case Success<void, ErrorType>():
            print('7일 연장되었습니다.');
          case Error<void, ErrorType>():
            switch (result.error) {
              case ErrorType.readError:
                print('처리에 실패했습니다.');
              case ErrorType.noDataError:
                print('연장할 책이 없습니다.');
              case ErrorType.failure:
                print('연장은 한번만 가능합니다.');
            }
        }
      } catch (e) {
        print('id를 확인하세요.');
      }
    }
  }
}
