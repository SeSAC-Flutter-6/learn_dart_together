import '../model/book.dart';

abstract interface class BookDataSource {
  Future<List<Book>> getBooks();

  Future<Book?> getBook(int id);
}