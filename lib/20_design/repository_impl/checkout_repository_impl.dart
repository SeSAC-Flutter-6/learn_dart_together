import 'dart:math';

import 'package:collection/collection.dart';
import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/data_source/book_data_source.dart';
import 'package:learn_dart_together/20_design/data_source/checkout_data_source.dart';
import 'package:learn_dart_together/20_design/data_source/member_data_source.dart';
import 'package:learn_dart_together/20_design/model/checkout.dart';
import 'package:learn_dart_together/20_design/repository/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutDataSource _checkoutDataSource;
  final MemberDataSource _memberDataSource;
  final BookDataSource _bookDataSource;

  CheckoutRepositoryImpl(
    this._checkoutDataSource,
    this._memberDataSource,
    this._bookDataSource,
  );

  @override
  Future<Result<List<Checkout>, String>> getCheckout({int? memberId}) async {
    try {
      final checkouts =
          await _checkoutDataSource.getCheckout(memberId: memberId);
      if (checkouts.isEmpty) {
        return Result.error('등록된 대여/반납정보가 없습니다');
      }
      final overdues = checkouts
          .where((checkout) =>
              checkout.bookStatus == BookStatus.borrowed &&
              checkout.returnDate.isBefore(DateTime.now()))
          .map((e) => (e.memberId, e.bookId));

      overdues.forEach((e) => _checkoutDataSource.updateCheckout(
          memberId: e.$2, bookId: e.$2, bookStatus: BookStatus.overdue));
      return Result.success(checkouts);
    } catch (e) {
      return Result.error('대여/반납조회 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Checkout, String>> registerCheckout({
    required int memberId,
    required int bookId,
  }) async {
    try {
      final member = await _memberDataSource.getMember(id: memberId);
      final book = await _bookDataSource.getBook(id: bookId);

      if (member.isEmpty) return Result.error('등록된 회원정보가 없습니다.');
      if (book.isEmpty) return Result.error('등록된 도서정보가 없습니다.');
      if (!book.first.isBorrowable) return Result.error('이미 대여중인 도서입니다.');

      int id = (await _checkoutDataSource.getCheckout())
          .map((e) => e.id)
          .reduce(max);
      final checkout = Checkout(
        id: ++id,
        memberId: memberId,
        memberName: member.first.name,
        bookId: bookId,
        bookTitle: book.first.title,
        borrowDate: DateTime.now(),
        returnDate: DateTime.now().add(Duration(days: 14)),
        bookStatus: BookStatus.borrowed,
        isExtendable: true,
      );
      await _checkoutDataSource.addCheckout(checkout);
      await _bookDataSource.updateBook(id: bookId, isBorrowable: false);
      return Result.success(checkout);
    } catch (e) {
      return Result.error('도서대여 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Checkout, String>> returnCheckout({
    required int memberId,
    required int bookId,
  }) async {
    try {
      final returnedBook = await _checkoutDataSource.updateCheckout(
        memberId: memberId,
        bookId: bookId,
        bookStatus: BookStatus.returned,
      );
      if (returnedBook != null) {
        _bookDataSource.updateBook(id: bookId, isBorrowable: true);
        return Result.success(returnedBook);
      }
      return Result.error('등록된 대여정보가 없습니다.');
    } catch (e) {
      return Result.error('도서반납 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Checkout, String>> extendCheckout({
    required int memberId,
    required int bookId,
  }) async {
    try {
      final checkouts = await _checkoutDataSource.getCheckout(
          memberId: memberId, bookId: bookId);
      final checkout = checkouts.firstWhereOrNull(
          (e) => e.isExtendable == true && e.bookStatus == BookStatus.borrowed);
      if (checkout == null) return Result.error('이미 연장중이거나 연체중에는 연장이 불가능합니다.');

      final extendedBook = await _checkoutDataSource.updateCheckout(
        memberId: memberId,
        bookId: bookId,
        returnDate: checkout.returnDate.add(Duration(days: 7)),
        isExtendable: false,
      );
      return extendedBook != null
          ? Result.success(extendedBook)
          : Result.error('등록된 대여정보가 없습니다.');
    } catch (e) {
      return Result.error('대여연장 중 오류 발생: $e');
    }
  }

  @override
  Future<void> restoreCheckouts() async {
    await _checkoutDataSource.fetchCheckouts();
  }
}
