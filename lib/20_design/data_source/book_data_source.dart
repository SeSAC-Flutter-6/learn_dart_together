import 'package:learn_dart_together/20_design/model/book.dart';

abstract interface class BookDataSource {
  Future<void> fetchBooks();

  Future<List<Book>> getBook({int? id, String? title});

  Future<void> addBook(Book book);

  Future<Book?> updateBook({
    required int id,
    String? title,
    String? author,
    String? summary,
    DateTime? publishedDate,
    bool? isBorrowable,
  });

  Future<Book?> deleteBook({required int id});
}
