import 'package:learn_dart_together/21_architecture/book_management_program/core/result.dart';

import '../error/enum.dart';
import '../model/borrow_info.dart';

abstract interface class BorrowInfoRepository {
  Future<Result<List<BorrowInfo>, ErrorType>> getBorrowInfo();

  Future<Result<BorrowInfo, ErrorType>> getOneBorrowInfo(int bookId);

  Future<Result<void, ErrorType>> returnBook(int bookId);

  Future<Result<BorrowInfo, ErrorType>> borrowBook(int bookId, int userId);

  Future<Result<void, ErrorType>> renewBook(int bookId);
}
