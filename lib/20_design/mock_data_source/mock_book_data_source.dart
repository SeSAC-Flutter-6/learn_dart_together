import 'dart:io';

import 'package:learn_dart_together/20_design/data_source/book_data_source.dart';
import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class MockBookDataSource implements BookDataSource {
  late List<Book> _books;
  final String _csvFile = 'lib/20_design/mock_data_source/book_data.csv';

  MockBookDataSource() {
    _initBooks();
  }

  Future<void> _initBooks() async {
    try {
      _books = await csvToBookList(_csvFile);
    } catch (e) {
      print('도서 데이터 불러오기 실패: $e');
      _books = [];
    }
  }

  @override
  Future<List<Book>> getBook({int? id, String? title}) async {
    if (id != null) {
      return _books.where((book) => book.id == id).toList();
    } else if (title != null) {
      return _books
          .where(
              (book) => book.title.toLowerCase().contains(title.toLowerCase()))
          .toList();
    }
    return _books;
  }

  @override
  Future<void> addBook(Book book) async {
    _books.add(book);
    await _saveBooksToCSV();
  }

  @override
  Future<Book?> deleteBook({required int id}) async {
    final index = _books.indexWhere((book) => book.id == id);
    if (index != -1) {
      final deletedBook = _books.removeAt(index);
      await _saveBooksToCSV();
      return deletedBook;
    }
    return null;
  }

  @override
  Future<Book?> updateBook({
    required int id,
    String? title,
    String? author,
    String? summary,
    DateTime? publishedDate,
    bool? isBorrowable,
  }) async {
    final index = _books.indexWhere((book) => book.id == id);
    if (index != -1) {
      final book = _books[index];
      final updatedBook = book.copyWith(
        title: title ?? book.title,
        author: author ?? book.author,
        summary: summary ?? book.summary,
        publishedDate: publishedDate ?? book.publishedDate,
        isBorrowable: isBorrowable ?? book.isBorrowable,
      );
      _books[index] = updatedBook;
      await _saveBooksToCSV();
      return updatedBook;
    }
    return null;
  }

  Future<void> _saveBooksToCSV() async {
    final csvContent = [
      'id,title,author,summary,publishedDate,isBorrowable',
      ..._books.map((book) =>
          '${book.id},${book.title},${book.author},${book.summary},${book.publishedDate.toString().substring(0, 10)},${book.isBorrowable}')
    ].join('\n');
    await File(_csvFile).writeAsString(csvContent);
  }
}
