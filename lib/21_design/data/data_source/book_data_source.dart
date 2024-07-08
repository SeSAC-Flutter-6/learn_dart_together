import 'package:learn_dart_together/20_result/practice_01/core/result.dart';

import '../model/book.dart';

abstract interface class BookDataSource {
  Future<Result<Book, Error>> getBookCreate(Book book);

  Future<Book, Error> getBookRead(int id);

  Future<List<Book, Error>> fetchReadBooks();

  //Future<Book?> getBook(int id);

  Future<Book, Error> getBookUpdate(Book book);

  Future<Book, Error> getBookDelete(Book book);
}