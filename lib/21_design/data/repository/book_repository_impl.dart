import 'dart:async';

import 'package:learn_dart_together/21_design/core/result.dart';
import 'package:learn_dart_together/21_design/data/data_source/book_data_source_api.dart';
import 'package:learn_dart_together/21_design/data/model/book.dart';
import 'package:learn_dart_together/21_design/data/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  @override
  Future<Result<List<Book>, NetworkError>> fetchReadBooks() async {
    try {
      List<Book> books = jsonBookStringList
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      return Result.success(books);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<Book, NetworkError>> getBookCreate(Book book) async {
    try {
      List<Book> books = jsonBookStringList
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      if (!books.contains(book)) {
        books.add(book);
        print('book 정보가 추가되었습니다.');
      } else {
        print('book 정보가 이미 존재합니다.');
      }
      return Result.success(book);
    } on Exception {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<Book, NetworkError>> getBookDelete(Book book) async {
    try {
      List<Book> books = jsonBookStringList
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      if (books.contains(book)) {
        books.remove(book);
        print('책 정보가 삭제되었습니다.');
      } else {
        print('책 정보가 존재하지 않습니다.');
      }
      return Result.success(book);
    } on Exception {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<Book, NetworkError>> getBookRead(int id) async {
    try {
      List<Book> books = jsonBookStringList
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      //id 검색
      final Book selectedBook = books.firstWhere((e) => e.id == id);
      if (selectedBook != null) {
        print('Book 검색 성공');
      } else {
        print('없는 BookID 입니다.');
      }
      return Result.success(selectedBook);
    } on Exception {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<Book, NetworkError>> getBookUpdate(Book book) async {
    try {
      List<Book> books = jsonBookStringList
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList();
      //update는 id가 존재하고 있다면 새로들어온 book은 이미 업데이트 된 상태니까
      //기존의 book 삭제 한 후에 들어온 book을 추가하면 된다
      //그런데 추가할때 List 형태에서 추가하게 되면 추가한 데이터는 맨 뒤에 붙게 되니까
      //인덱스가 다르다. update는 인덱스 위치까지 같아야 update니까
      // 인덱스까지 맞춰서 넣어주려면 insert를 사용하면 된다
      final Book selectedBook = books.firstWhere((e) => e.id == book.id);
      if (selectedBook != null) {
        final int selectedBookIndex = books.indexOf(selectedBook);
        books.remove(selectedBook);
        books.insert(selectedBookIndex, book);
      } else {
        print('book 정보가 존재하지 않습니다.');
      }
      return Result.success(book);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
