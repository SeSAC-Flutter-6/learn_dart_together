import 'dart:io';

import 'package:learn_dart_together/24_architecture/book_management_program/data_source/book_data_source_impl.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/book_repository_impl.dart';

import '../core/result.dart';
import '../error/enum.dart';
import '../model/book.dart';

class BookMenu {
  Future<void> showBorrowableBooks() async {
    final result =
        await BookRepositoryImpl(bookDataSource: BookDataSourceImpl())
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
    print('출간일을 입력하세요 형식: (YYYY/mm/DD');
    final publishDate = stdin.readLineSync();
    print('저자를 입력하세요');
    final author = stdin.readLineSync();
    if (title!.isNotEmpty && publishDate!.isNotEmpty && author!.isNotEmpty) {
      final result = await BookRepositoryImpl(
              bookDataSource: BookDataSourceImpl())
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
}
