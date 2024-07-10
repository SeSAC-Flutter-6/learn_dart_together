import 'package:collection/collection.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/core/result.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/borrow_info_data_source.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/book.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/borrow_info.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/user.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/book_repository.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/borrow_info_repository.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/repository/user_repository.dart';

class BorrowInfoRepositoryImpl implements BorrowInfoRepository {
  final BorrowInfoDataSource _borrowInfoDataSource;
  final BookRepository _bookRepository;
  final UserRepository _userRepository;

  const BorrowInfoRepositoryImpl({
    required BorrowInfoDataSource borrowInfoDataSource,
    required BookRepository bookRepository,
    required UserRepository userRepository,
  })  : _borrowInfoDataSource = borrowInfoDataSource,
        _bookRepository = bookRepository,
        _userRepository = userRepository;

  Future<Book?> _getBook(int bookId) async {
    final book = await _bookRepository.getBook(id: bookId);
    switch (book) {
      case Success<Book, ErrorType>():
        if (book.data.isBorrowable == true) {
          return book.data;
        }
        return null;
      case Error<Book, ErrorType>():
        return null;
    }
  }

  Future<User?> _getUser(int userId) async {
    final user = await _userRepository.getUser(id: userId);
    switch (user) {
      case Success<User, ErrorType>():
        return user.data;
      case Error<User, ErrorType>():
        return null;
    }
  }

  @override
  Future<Result<BorrowInfo, ErrorType>> borrowBook(
      int bookId, int userId) async {
    final book = await _getBook(bookId);
    final user = await _getUser(userId);
    if (book != null && user != null) {
      final data = await getBorrowInfo();
      switch (data) {
        case Success<List<BorrowInfo>, ErrorType>():
          final newInfo = BorrowInfo(
              id: data.data.isEmpty ? 1 : data.data.map((e) => e.id).max + 1,
              bookId: bookId,
              bookTitle: book.title,
              userId: userId,
              userName: user.name,
              isExtendable: true,
              borrowDate:
                  DateTime.now().toString().replaceAll('-', '/').split(' ')[0],
              dueDate: DateTime.now()
                  .add(Duration(days: 14))
                  .toString()
                  .replaceAll('-', '/')
                  .split(' ')[0]);
          await _borrowInfoDataSource.addBorrowInfo(newInfo);
          await _bookRepository.borrowBook(id: bookId);
          return Result.success(newInfo);
        case Error<List<BorrowInfo>, ErrorType>():
          return Result.error(ErrorType.readError);
      }
    } else {
      return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<List<BorrowInfo>, ErrorType>> getBorrowInfo() async {
    try {
      final data = await _borrowInfoDataSource.getBorrowInfo();
      return Result.success(data.sortedBy<String>((e) => e.dueDate));
    } catch (e) {
      return Result.error(ErrorType.readError);
    }
  }

  @override
  Future<Result<void, ErrorType>> renewBook(int bookId) async {
    final data = await getOneBorrowInfo(bookId);
    switch (data) {
      case Success<BorrowInfo, ErrorType>():
        if (data.data.isExtendable == true) {
          try {
            final originalDate =
                DateTime.parse(data.data.dueDate.replaceAll('/', '-'));
            final renewDate = originalDate.add(Duration(days: 7));
            final stringDate =
                renewDate.toString().replaceAll('-', '/').split(' ')[0];
            return Result.success(await _borrowInfoDataSource.updateBorrowInfo(
                data.data.copyWith(dueDate: stringDate, isExtendable: false)));
          } catch (e) {
            return Result.error(ErrorType.readError);
          }
        } else {
          return Result.error(ErrorType.failure);
        }
      case Error<BorrowInfo, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<void, ErrorType>> returnBook(int bookId) async {
    final result = await getOneBorrowInfo(bookId);
    switch (result) {
      case Success<BorrowInfo, ErrorType>():
        try {
          await _bookRepository.returnBook(id: bookId);
          return Result.success(
              await _borrowInfoDataSource.deleteBorrowInfo(result.data));
        } catch (e) {
          return Result.error(ErrorType.failure);
        }
      case Error<BorrowInfo, ErrorType>():
        return Result.error(ErrorType.noDataError);
    }
  }

  @override
  Future<Result<BorrowInfo, ErrorType>> getOneBorrowInfo(int bookId) async {
    final data = await getBorrowInfo();
    switch (data) {
      case Success<List<BorrowInfo>, ErrorType>():
        try {
          return Result.success(
              data.data.firstWhere((e) => e.bookId == bookId));
        } catch (e) {
          return Result.error(ErrorType.noDataError);
        }
      case Error<List<BorrowInfo>, ErrorType>():
        return Result.error(ErrorType.readError);
    }
  }
}
