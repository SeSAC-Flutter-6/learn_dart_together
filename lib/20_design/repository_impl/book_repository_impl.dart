import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/data_source/book_data_source.dart';
import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource _bookDataSource;
  int _id = 0;

  BookRepositoryImpl(this._bookDataSource);

  @override
  Future<Result<List<Book>, String>> getBook({int? id, String? title}) async {
    try {
      final books = await _bookDataSource.getBook(id: id, title: title);
      return books.isEmpty
          ? Result.error('등록된 도서정보가 없습니다')
          : Result.success(books);
    } catch (e) {
      return Result.error('도서조회 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Book, String>> registerBook({
    required String title,
    required String author,
    required String summary,
    required DateTime publishedDate,
    required bool isBorrowable,
  }) async {
    try {
      final book = Book(
        id: ++_id,
        title: title,
        author: author,
        summary: summary,
        publishedDate: publishedDate,
        isBorrowable: isBorrowable,
      );
      await _bookDataSource.addBook(book);
      return Result.success(book);
    } catch (e) {
      return Result.error('도서등록 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Book, String>> updateBook(
      {required int id,
      String? title,
      String? author,
      String? summary,
      DateTime? publishedDate,
      bool? isBorrowable}) async {
    try {
      final updatedBook = await _bookDataSource.updateBook(
        id: id,
        title: title,
        author: author,
        summary: summary,
        publishedDate: publishedDate,
        isBorrowable: isBorrowable,
      );
      return updatedBook != null
          ? Result.success(updatedBook)
          : Result.error('등록된 도서정보가 없습니다.');
    } catch (e) {
      return Result.error('도서수정 중 오류 발생:$e');
    }
  }

  @override
  Future<Result<Book, String>> deleteBook({required int id}) async {
    try {
      final deletedBook = await _bookDataSource.deleteBook(id: id);
      if (deletedBook != null) {
        return Result.success(deletedBook);
      } else {
        return Result.error('등록된 도서정보가 없습니다');
      }
    } catch (e) {
      return Result.error('도서삭제 중 오류 발생: $e');
    }
  }
}
