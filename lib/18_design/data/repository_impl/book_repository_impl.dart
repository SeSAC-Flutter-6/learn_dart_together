import 'package:collection/collection.dart';
import 'package:learn_dart_together/18_design/core/result.dart';
import 'package:learn_dart_together/18_design/data/data_source/book_data_source.dart';
import 'package:learn_dart_together/18_design/data/model/book.dart';
import 'package:learn_dart_together/18_design/data/repository/Book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource _bookDataSource;

  BookRepositoryImpl(this._bookDataSource);

  @override
  Future<Result<void>> cancelDelete() async {
    try {
      final result = await _bookDataSource.cancelDelete();
      return Result.success(result);
    } catch (e) {
      return Result.error('cancelDelete error');
    }
  }

  @override
  Future<Result<Book>> createBook(Book book) async {
    try {
      final now = DateTime.now();
      if (now.isBefore(book.publishedData)) {
        return Result.error('현재 날짜보다 이후로 출간 날짜를 입력 불가');
      }

      final result = await _bookDataSource.createBook(book);
      return Result.success(result);
    } catch (e) {
      return Result.error('createBook error');
    }
  }

  @override
  Future<Result<Book>> deleteBook(int id) async {
    try {
      final result = await _bookDataSource.deleteBook(id);
      return Result.success(result);
    } catch (e) {
      return Result.error('deleteBook error');
    }
  }

  @override
  Future<Result<Book>> findByName(String name) async {
    try {
      final getBooksResult = await _bookDataSource.getBooks();
      final book =
          getBooksResult.singleWhereOrNull((book) => book.title == name);

      if (book == null) throw Result.error('not find Book');

      return Result.success(book);
    } catch (e) {
      return Result.error('findBook error');
    }
  }

  @override
  Future<Result<Book?>> getBook(int id) async {
    try {
      final result = await _bookDataSource.getBook(id);
      return Result.success(result);
    } catch (e) {
      return Result.error('getBook error');
    }
  }

  @override
  Future<Result<List<Book>>> getBooks() async {
    try {
      final result = await _bookDataSource.getBooks();
      return Result.success(result);
    } catch (e) {
      return Result.error('getBooks error');
    }
  }

  @override
  Future<Result<Book>> updateBook(int targetId, Book book) async {
    try {
      final result = await _bookDataSource.updateBook(targetId, book);
      return Result.success(result);
    } catch (e) {
      return Result.error('updateBook error');
    }
  }

  @override
  Future<Result<List<Book>>> getBooksCheckoutAble() async {
    try {
      final books = await _bookDataSource.getBooks();
      final result = books
          .where((book) => book.checkoutStatus == CheckoutStatus.readied)
          .toList();

      return Result.success(result);
    } catch (e) {
      return Result.error('updateBook error');
    }
  }

  @override
  Future<Result<List<Book>>> getBooksSortedByRecent() async {
    try {
      final books = await _bookDataSource.getBooks();
      final result = books.sortedByCompare(
          (element) => element.publishedData, (a, b) => -a.compareTo(b));

      return Result.success(result);
    } catch (e) {
      return Result.error('updateBook error');
    }
  }
}
