import 'package:learn_dart_together/18_design/data/model/user.dart';

import '../../core/result.dart';
import '../model/book.dart';

abstract interface class BookRepository {
  Future<Result<List<Book>>> getBooks();

  Future<Result<Book?>> getBook(int id);

  Future<Result<Book>> createBook(Book book);

  Future<Result<Book>> updateBook(int targetId, Book book);

  Future<Result<Book>> deleteBook(int id);

  Future<Result<void>> cancelDelete();

  Future<Result<Book>> findByName(String name);
}
