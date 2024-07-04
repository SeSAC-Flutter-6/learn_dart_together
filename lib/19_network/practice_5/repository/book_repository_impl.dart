import 'package:learn_dart_together/19_network/practice_5/data_source/book_data_source.dart';
import 'package:learn_dart_together/19_network/practice_5/model/book.dart';

import 'book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource _bookDataSource;

  BookRepositoryImpl(this._bookDataSource);

  @override
  Future<Book> createBook(Book book) {
    return _bookDataSource.createBook(book);
  }

  @override
  Future<Book> deleteBook(Book book) {
    return _bookDataSource.deleteBook(book);
  }

  @override
  Future<Book> getBook(Book book) {
    return _bookDataSource.getBook(book);
  }

  @override
  Future<List<Book>> getBooks() {
    return _bookDataSource.getBooks();
  }

  @override
  Future<Book> updateBook(Book book) {
    return _bookDataSource.updateBook(book);
  }
}
