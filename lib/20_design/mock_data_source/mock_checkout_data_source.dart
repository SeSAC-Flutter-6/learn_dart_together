import 'dart:io';
import 'package:learn_dart_together/20_design/data_source/checkout_data_source.dart';
import 'package:learn_dart_together/20_design/model/checkout.dart';
import 'package:learn_dart_together/20_design/utils/constant.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class MockCheckoutDataSource implements CheckoutDataSource {
  List<Checkout>? _checkouts;
  final String _csvFile = checkoutCsvFile;
  late Future<void> _initializationDone;

  MockCheckoutDataSource() {
    _initializationDone = _initBooks();
  }

  Future<void> _initBooks() async {
    try {
      _checkouts = await csvToCheckoutList(_csvFile);
    } catch (e) {
      print('대여/반납 데이터 불러오기 실패: $e');
      _checkouts = [];
    }
  }

  @override
  Future<List<Checkout>> getCheckout({int? memberId, int? bookId}) async {
    await _initializationDone;
    if (_checkouts == null) {
      throw Exception('대여/반납 데이터 초기화 실패');
    }
    if (memberId != null) {
      return _checkouts!
          .where((checkout) => checkout.memberId == memberId)
          .toList();
    } else if (bookId != null) {
      return _checkouts!
          .where((checkout) => checkout.bookId == bookId)
          .toList();
    }
    return _checkouts!;
  }

  @override
  Future<void> addCheckout(Checkout checkout) async {
    await _initializationDone;
    _checkouts?.add(checkout);
    await _saveCheckoutsToCSV();
  }

  @override
  Future<Checkout?> updateCheckout({
    required int memberId,
    required int bookId,
    DateTime? returnDate,
    BookStatus? bookStatus,
    bool? isExtendable,
  }) async {
    await _initializationDone;
    if (_checkouts == null) return null;

    final index = _checkouts!.indexWhere((checkout) =>
        checkout.memberId == memberId &&
        checkout.bookId == bookId &&
        checkout.bookStatus != BookStatus.returned);

    if (index != -1) {
      final checkout = _checkouts![index];
      final updatedCheckout = checkout.copyWith(
        returnDate: returnDate ?? checkout.returnDate,
        bookStatus: bookStatus ?? checkout.bookStatus,
        isExtendable: isExtendable ?? checkout.isExtendable,
      );
      _checkouts![index] = updatedCheckout;
      await _saveCheckoutsToCSV();
      return updatedCheckout;
    }
    return null;
  }

  Future<void> _saveCheckoutsToCSV() async {
    if (_checkouts == null) return;
    final csvContent = [
      'id,memberId,memberName,bookId,bookTitle,borrowDate,returnDate,bookStatus,isExtendable',
      ..._checkouts!.map((checkout) =>
          '${checkout.id},${checkout.memberId},${checkout.memberName},${checkout.bookId},${checkout.bookTitle},${checkout.borrowDate.toString().substring(0, 10)},${checkout.returnDate.toString().substring(0, 10)},${checkout.bookStatus.name},${checkout.isExtendable}')
    ].join('\n');
    await File(_csvFile).writeAsString(csvContent);
  }
}
