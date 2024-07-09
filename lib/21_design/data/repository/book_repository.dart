import 'package:learn_dart_together/21_design/core/result.dart';

import '../../core/network_error.dart';
import '../model/book.dart';

abstract interface class BookRepository {
  Future<Result<Book, NetworkError>> getBookCreate(Book book);

  Future<Result<Book, NetworkError>> getBookRead(int id);

  Future<Result<List<Book>, NetworkError>> fetchReadBooks();

  Future<Result<Book, NetworkError>> getBookUpdate(Book book);

  Future<Result<Book, NetworkError>> getBookDelete(Book book);
}