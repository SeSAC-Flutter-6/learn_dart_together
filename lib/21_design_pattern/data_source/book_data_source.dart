import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_book_api.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/mock_data_source/mock_book_api.dart';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';

abstract interface class BookDataSource {
  static BookDataSource? _instance;

  factory BookDataSource([BookDataSource? api]) {
    _instance = api ?? MemoryBookApi();
    return _instance!;
  }

  Future<List<Book>> getBooks();
  Future<Book> getBook(int id);
  Future<Book> createBook(Book book);
  Future<Book> updateBook(Book book);
  Future<Book> deleteBook(int id);
}
