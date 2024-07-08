import 'package:learn_dart_together/21_architecture/book_management_program/core/result.dart';

import '../error/enum.dart';
import '../model/book.dart';

abstract interface class BookRepository {
  Future<Result<Book, ErrorType>> createBook({
    required String title,
    required String publishDate,
    required String author,
  });

  Future<Result<List<Book>, ErrorType>> getBooks();

  Future<Result<List<Book>, ErrorType>> getBorrowableBooks();

  Future<Result<Book, ErrorType>> getBook({required int id});

  Future<Result<void, ErrorType>> updateBook({
    required int id,
    String? title,
    String? publishDate,
    String? author,
  });

  Future<Result<void, ErrorType>> deleteBook({required int id});

  Future<Result<void, ErrorType>> borrowBook({required int id});

  Future<Result<void, ErrorType>> returnBook({required int id});
}
