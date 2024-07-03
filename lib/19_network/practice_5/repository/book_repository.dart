import 'package:learn_dart_together/19_network/practice_5/model/book.dart';

abstract interface class BookRepository {
  Future<Book> getBook(Book book);
  Future<List<Book>> getBooks();
  Future<Book> createBook(Book book);
  Future<Book> updateBook(Book book);
  Future<Book> deleteBook(Book book);
}
