import 'package:collection/collection.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/book_data_source.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/book.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource _bookDataSource;

  const BookRepositoryImpl({
    required BookDataSource bookDataSource,
  }) : _bookDataSource = bookDataSource;

  @override
  Future<Result<void, ErrorType>> borrowBook({required int id}) async {
    final data = await getBook(id: id);
    switch (data) {
      case Success<Book, ErrorType>():
        try {
          return Result.success(await _bookDataSource
              .updateBook(data.data.copyWith(isBorrowable: false)));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<Book, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<Book, ErrorType>> createBook(
      {required String title,
      required String publishDate,
      required String author}) async {
    final data = await getBooks();
    switch (data) {
      case Success<List<Book>, ErrorType>():
        try {
          final book = Book(
            id: data.data.sorted((a, b) => a.id.compareTo(b.id)).last.id + 1,
            title: title,
            publishDate: publishDate,
            author: author,
            isBorrowable: true,
          );
          await _bookDataSource.addBook(book);
          return Result.success(book);
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<List<Book>, ErrorType>():
        return Result.error(ErrorType.readError);
    }
  }

  @override
  Future<Result<void, ErrorType>> deleteBook({required int id}) async {
    final data = await getBook(id: id);
    switch (data) {
      case Success<Book, ErrorType>():
        try {
          return Result.success(await _bookDataSource.deleteBook(data.data));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<Book, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<Book, ErrorType>> getBook({required int id}) async {
    final data = await getBooks();
    switch (data) {
      case Success<List<Book>, ErrorType>():
        try {
          return Result.success(data.data.firstWhere((e) => e.id == id));
        } catch (e) {
          return Result.error(ErrorType.noDataError);
        }
      case Error<List<Book>, ErrorType>():
        return Result.error(ErrorType.readError);
    }
  }

  //빌릴수있는 책 목록 얻기
  @override
  Future<Result<List<Book>, ErrorType>> getBorrowableBooks() async {
    try {
      final data = await _bookDataSource.getBooks();
      final borrowableBooks =
          data.where((e) => e.isBorrowable == true).toList();
      return Result.success(borrowableBooks);
    } catch (e) {
      return Result.error(ErrorType.readError);
    }
  }

  @override
  Future<Result<void, ErrorType>> updateBook(
      {required int id,
      String? title,
      String? publishDate,
      String? author}) async {
    final data = await getBook(id: id);
    switch (data) {
      case Success<Book, ErrorType>():
        try {
          return Result.success(await _bookDataSource.updateBook(data.data
              .copyWith(
                  title: title ?? data.data.title,
                  publishDate: publishDate ?? data.data.publishDate,
                  author: author ?? data.data.publishDate)));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<Book, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<void, ErrorType>> returnBook({required int id}) async {
    final data = await getBook(id: id);
    switch (data) {
      case Success<Book, ErrorType>():
        try {
          return Result.success(await _bookDataSource
              .updateBook(data.data.copyWith(isBorrowable: true)));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<Book, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<List<Book>, ErrorType>> getBooks() async{
    try {
      final data = await _bookDataSource.getBooks();
      return Result.success(data);
    } catch (e) {
      return Result.error(ErrorType.readError);
    }
  }
}
