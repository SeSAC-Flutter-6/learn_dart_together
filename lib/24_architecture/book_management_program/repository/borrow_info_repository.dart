import 'package:learn_dart_together/24_architecture/book_management_program/error/enum.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/borrow_info.dart';

import '../core/result.dart';

abstract interface class BorrowInfoRepository {
  Future<Result<List<BorrowInfo>, ErrorType>> getBorrowInfo();

  Future<Result<BorrowInfo, ErrorType>> getOneBorrowInfo(int bookId);

  Future<Result<void, ErrorType>> returnBook(int bookId);

  Future<Result<BorrowInfo, ErrorType>> borrowBook(int bookId, int userId);

  Future<Result<void, ErrorType>> renewBook(int bookId);
}
