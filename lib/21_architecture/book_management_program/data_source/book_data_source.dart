import '../model/book.dart';

abstract interface class BookDataSource {
  Future<List<Book>> getBooks();
  Future<void> addBook(Book book);
  Future<void> deleteBook(Book book);
  Future<void> updateBook(Book book);
}