import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/data_source/book_data_source.dart';
import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource _bookDataSource;
  int _id = 0;

  BookRepositoryImpl(this._bookDataSource);

  @override
  Future<Result<List<Book>, String>> getBook({int? id, String? title}) {
    // TODO: implement getBook
    throw UnimplementedError();
  }

  @override
  Future<Result<Book, String>> deleteBook({required int id}) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Result<Book, String>> registerBook(
      {String? title,
      String? author,
      String? summary,
      DateTime? publishedDate,
      bool? isBorrowable}) {
    // TODO: implement registerBook
    throw UnimplementedError();
  }

  @override
  Future<Result<Book, String>> updateBook(
      {required int id,
      String? title,
      String? author,
      String? summary,
      DateTime? publishedDate,
      bool? isBorrowable}) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
