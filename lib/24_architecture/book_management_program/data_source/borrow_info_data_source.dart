import 'package:learn_dart_together/24_architecture/book_management_program/model/borrow_info.dart';

abstract interface class BorrowInfoDataSource {
  Future<List<BorrowInfo>> getBorrowInfo();

  Future<void> addBorrowInfo(BorrowInfo borrowInfo);

  Future<void> updateBorrowInfo(BorrowInfo borrowInfo);

  Future<void> deleteBorrowInfo(BorrowInfo borrowInfo);
}
