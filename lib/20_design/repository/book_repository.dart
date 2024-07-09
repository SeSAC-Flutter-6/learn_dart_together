import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/book.dart';

abstract interface class BookRepository {
  Future<Result<List<Book>, String>> getBook({int? id, String? title});

  Future<Result<Book, String>> registerBook({
    required String title,
    required String author,
    required String summary,
    required DateTime publishedDate,
    required bool isBorrowable,
  });

  Future<Result<Book, String>> updateBook({
    required int id,
    String? title,
    String? author,
    String? summary,
    DateTime? publishedDate,
    bool? isBorrowable,
  });

  Future<Result<Book, String>> deleteBook({required int id});

  Future<void> restoreBooks();
}
