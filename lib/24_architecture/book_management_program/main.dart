import 'dart:io';

import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/book_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/book.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/book_repository_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/user.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/user_menu.dart';

User? deletedUser;

void main() {
  showFirstMenu();
}

void showFirstMenu() {
  print('1. 회원관리  2. 도서관리  3. 대출관리  4.종료');
  final data = stdin.readLineSync();
  switch (data) {
    case '':
      showFirstMenu();
    case '1':
      showUserMenu();
    case '2':
      showBookMenu();
    case '3':
    case '4':
      print('프로그램 종료');
      exit(0);
  }
}

void showUserMenu() async {
  print('0. 뒤로가기,  1. 회원목록  2. 회원등록  3.회원수정  4.회원삭제  5.회원검색  6.삭제취소');
  final data = stdin.readLineSync();
  switch (data) {
    case '':
      showUserMenu();
    case '0':
      showFirstMenu();
    case '1':
      await UserMenu().showUsers();
      showUserMenu();
    case '2':
      await UserMenu().registerUser();
      showUserMenu();
    case '3':
    case '4':
    case '5':
    case '6':
  }
}

void showBookMenu() async {
  print('0. 뒤로가기,  1. 도서목록  2. 도서등록  3.도서수정  4.도서삭제  5.도서검색');
  final data = stdin.readLineSync();
  switch (data) {
    case '':
      showBookMenu();
    case '0':
      showFirstMenu();
    case '1':
      await showBorrowableBooks();
      showBookMenu();
    case '2':
      await createBook();
      showBookMenu();
    case '3':
      await updateBook();
      showBookMenu();
    case '4':
      await deleteBook();
      showBookMenu();
    case '5':
      await findBook();
      showBookMenu();
  }
}

void showLoanInformationMenu() async {
  print('0. 뒤로가기,  1. 대출목록  2. 대출  3.반납  4.연장');
  final data = stdin.readLineSync();
  switch (data) {
    case '0':
      showFirstMenu();
    case '1':
    case '2':
    case '3':
    case '4':
  }
}

Future<void> showBorrowableBooks() async {
  final result = await BookRepositoryImpl(bookDataSource: BookDataSourceImpl())
      .getBorrowableBooks();
  switch (result) {
    case Success<List<Book>, ErrorType>():
      result.data.forEach(print);
    case Error<List<Book>, ErrorType>():
      switch (result.error) {
        case ErrorType.readError:
          print('정보를 불러오는데 실패했습니다.');
        case ErrorType.noDataError:
          print('해댱 id에 대한 책 정보를 찾을 수 없습니다.');
        case ErrorType.failure:
          print('처리에 실패했습니다.');
      }
  }
}

Future<void> findBook() async {
  print('찾으시는 책 id를 입력하세요.');
  final data = stdin.readLineSync();
  if (data != null) {
    try {
      final inputId = int.parse(data);
      final result =
          await BookRepositoryImpl(bookDataSource: BookDataSourceImpl())
              .getBook(id: inputId);
      switch (result) {
        case Success<Book, ErrorType>():
          print(result.data);
        case Error<Book, ErrorType>():
          switch (result.error) {
            case ErrorType.readError:
              print('정보를 불러오는데 실패했습니다.');
            case ErrorType.noDataError:
              print('해댱 id에 대한 책 정보를 찾을 수 없습니다.');
            case ErrorType.failure:
              print('처리에 실패했습니다.');
          }
      }
    } catch (e) {
      print('입력값이 없습니다.');
    }
  }
}

Future<void> createBook() async {
  print('책 제목을 입력하세요');
  final title = stdin.readLineSync();
  print('출간일을 입력하세요');
  final publishDate = stdin.readLineSync();
  print('저자를 입력하세요');
  final author = stdin.readLineSync();
  if (title!.isNotEmpty && publishDate!.isNotEmpty && author!.isNotEmpty) {
    final result =
        await BookRepositoryImpl(bookDataSource: BookDataSourceImpl())
            .createBook(title: title, publishDate: publishDate, author: author);
    switch (result) {
      case Success<Book, ErrorType>():
        print('추가되었습니다.');
      case Error<Book, ErrorType>():
        switch (result.error) {
          case ErrorType.readError:
            print('정보를 불러오는데 실패했습니다.');
          case ErrorType.noDataError:
            print('해댱 id에 대한 책 정보를 찾을 수 없습니다.');
          case ErrorType.failure:
            print('처리에 실패했습니다.');
        }
    }
  } else {
    print('모든 정보를 입력하세요.');
  }
}

Future<void> updateBook() async {
  print('수정할 책의 id를 입력하세요');
  final id = stdin.readLineSync();
  print('변경하실 제목을 입력하세요. 없으시면 enter를 누르세요');
  final title = stdin.readLineSync();
  print('변경하실 출간일을 입력하세요. 없으시면 enter를 누르세요');
  final publishDate = stdin.readLineSync();
  print('변경하실 저자를 입력하세요. 없으시면 enter를 누르세요');
  final author = stdin.readLineSync();

  if (id!.isNotEmpty) {
    if (title!.isEmpty && publishDate!.isEmpty && author!.isEmpty) {
      print('수정할 값이 없습니다.');
    } else {
      final inputId = int.parse(id);
      final result =
          await BookRepositoryImpl(bookDataSource: BookDataSourceImpl())
              .updateBook(
                  id: inputId,
                  title: title!.isEmpty ? null : title,
                  publishDate: publishDate!.isEmpty ? null : publishDate,
                  author: author!.isEmpty ? null : author);
      switch (result) {
        case Success<void, ErrorType>():
          print('수정되었습니다.');
        case Error<void, ErrorType>():
          switch (result.error) {
            case ErrorType.readError:
              print('정보를 불러오는데 실패했습니다.');
            case ErrorType.noDataError:
              print('해댱 id에 대한 책 정보를 찾을 수 없습니다.');
            case ErrorType.failure:
              print('처리에 실패했습니다.');
          }
      }
    }
  } else {
    print('id는 반드시 입력해야 합니다.');
  }
}

Future<void> deleteBook() async {
  print('삭제할 책의 id를 입력하세요');
  final id = stdin.readLineSync();
  if (id != null) {
    try {
      final inputId = int.parse(id);
      final result =
          await BookRepositoryImpl(bookDataSource: BookDataSourceImpl())
              .deleteBook(id: inputId);
      switch (result) {
        case Success<void, ErrorType>():
          print('삭제되었습니다.');
        case Error<void, ErrorType>():
          switch (result.error) {
            case ErrorType.readError:
              print('정보를 불러오는데 실패했습니다.');
            case ErrorType.noDataError:
              print('해댱 id에 대한 책 정보를 찾을 수 없습니다.');
            case ErrorType.failure:
              print('처리에 실패했습니다.');
          }
      }
    } catch (e) {
      print('id는 반드시 입력해야 합니다.');
    }
  }
}
