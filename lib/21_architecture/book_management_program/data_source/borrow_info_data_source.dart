import '../model/borrow_info.dart';

abstract interface class BorrowInfoDataSource {
  Future<List<BorrowInfo>> getBorrowInfo();

  Future<void> addBorrowInfo(BorrowInfo borrowInfo);

  Future<void> updateBorrowInfo(BorrowInfo borrowInfo);

  Future<void> deleteBorrowInfo(BorrowInfo borrowInfo);
}
